import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'orders_section_state.dart';

class OrdersCubit extends Cubit<OrdersSectionState> {
  OrdersCubit({required this.restaurantId}) : super(const OrdersSectionState());

  final String restaurantId;
  StreamSubscription<List<OrderModel>>? _ordersStreamSub;
  DocumentSnapshot? _lastFetchedDoc;
  ScrollController? scrollController;
  BuildContext? context; // to show snackbars

  void setScrollController(ScrollController sc) {
    scrollController = sc;
  }

  void setContext(BuildContext ctx) {
    context = ctx;
  }

  bool get _isAtTop {
    if (scrollController?.hasClients ?? false) {
      return scrollController!.offset <= 50; // close enough to top
    }
    return true;
  }

  void _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController?.hasClients ?? false) {
        scrollController?.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _showNewOrderSnackbar() {
    if (context == null) return;

    ScaffoldMessenger.of(context!).hideCurrentSnackBar();
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: const Text("New order received"),
        action: SnackBarAction(label: "View", onPressed: _scrollToTop),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  /// Start listening to real-time latest orders
  // void listenToNewOrders() {
  //   log("listenToNewOrders called");
  //   _ordersStreamSub?.cancel();

  //   _ordersStreamSub = _streamLatestOrders().listen((incomingOrders) {
  //     if (incomingOrders.isEmpty) return;

  //     final updated = addUniqueOrders(incomingOrders, prepend: true);
  //     emit(state.copyWith(orders: updated));

  //     if (_isAtTop) {
  //       _scrollToTop();
  //     } else {
  //       _showNewOrderSnackbar();
  //     }
  //   });
  // }

  /// Fetch initial page
  Future<void> fetchInitialOrders({int limit = 10}) async {
    log("fetchInitialOrders called");
    emit(state.copyWith(fetchingMoreOrders: true));

    final snapshot =
        await FirebaseFirestore.instance
            .collection('restaurants')
            .doc(restaurantId)
            .collection('orders')
            .orderBy('created_at', descending: true)
            .limit(limit)
            .get();

    final orders =
        snapshot.docs.map((doc) {
          return OrderModel.fromJson(
            doc.data(),
          ).copyWith(snapshot: doc, id: doc.id);
        }).toList();

    if (orders.isNotEmpty) {
      _lastFetchedDoc = snapshot.docs.last;
    }

    emit(
      state.copyWith(
        orders: orders,
        hasMoreOrders: orders.length == limit,
        fetchingMoreOrders: false,
      ),
    );
  }

  /// Pagination
  Future<void> fetchMoreOrders({int limit = 10}) async {
    log("fetchMoreOrders called");
    if (state.fetchingMoreOrders || !(state.hasMoreOrders ?? false)) return;

    emit(state.copyWith(fetchingMoreOrders: true));

    final snapshot =
        await FirebaseFirestore.instance
            .collection('restaurants')
            .doc(restaurantId)
            .collection('orders')
            .orderBy('created_at', descending: true)
            .startAfterDocument(_lastFetchedDoc!)
            .limit(limit)
            .get();

    final moreOrders =
        snapshot.docs.map((doc) {
          return OrderModel.fromJson(
            doc.data(),
          ).copyWith(snapshot: doc, id: doc.id);
        }).toList();

    if (moreOrders.isNotEmpty) {
      _lastFetchedDoc = snapshot.docs.last;
    }

    final updated = addUniqueOrders(moreOrders, prepend: false);

    emit(
      state.copyWith(
        orders: updated,
        hasMoreOrders: moreOrders.length == limit,
        fetchingMoreOrders: false,
      ),
    );
  }

  /// Deduplication logic
  List<OrderModel> addUniqueOrders(
    List<OrderModel> newItems, {
    bool prepend = false,
  }) {
    final existingItems = state.orders ?? [];
    final existingIds = existingItems.map((e) => e.id).toSet();

    final filteredNewItems = <OrderModel>[];
    for (final item in newItems) {
      if (!existingIds.contains(item.id)) {
        existingIds.add(item.id);
        filteredNewItems.add(item);
      }
    }

    if (prepend) {
      // Put new items at the top (used for real-time updates)
      return [...filteredNewItems, ...existingItems];
    } else {
      // Append at the bottom (used for pagination)
      return [...existingItems, ...filteredNewItems];
    }
  }

  Future<void> updateOrder(OrderModel orderModel) async {
    // addOrderLocally(orderModel, editOnly: true);
    final restaurantOrdersRef = FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId)
        .collection('orders')
        .doc(orderModel.id);

    await restaurantOrdersRef.update({
      ...orderModel.toJson()..remove('created_at'),
      'updated_at': FieldValue.serverTimestamp(),
    });
  }

  void listenToNewOrders() {
    log("listenToNewOrders called");

    // Cancel previous subscription if any
    _ordersStreamSub?.cancel();

    _ordersStreamSub = _streamLatestOrders().listen((latestDocs) {
      if (latestDocs.isEmpty) return;
      log("New order: ${latestDocs.length}");
      final latestOrder = latestDocs.first;

      final existingOrders = state.orders ?? [];
      final alreadyExists = existingOrders.any((o) => o.id == latestOrder.id);

      if (!alreadyExists) {
        final updatedOrders = addUniqueOrders([latestOrder], prepend: true);
        emit(state.copyWith(orders: updatedOrders));
      } else {
        log("Updating order data (already exists)");
        final updatedOrders =
            existingOrders.map((order) {
              return order.id == latestOrder.id ? latestOrder : order;
            }).toList();
        emit(state.copyWith(orders: updatedOrders));
      }
    });
  }

  /// Real-time stream of the single newest order
  Stream<List<OrderModel>> _streamLatestOrders() {
    return FirebaseFirestore.instance
        .collection('restaurants')
        .doc(restaurantId)
        .collection('orders')
        .orderBy('created_at', descending: true)
        .orderBy(FieldPath.documentId, descending: true) // tie-breaker
        .limit(1)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return OrderModel.fromJson(
              doc.data(),
            ).copyWith(snapshot: doc, id: doc.id);
          }).toList();
        });
  }

  @override
  Future<void> close() {
    _ordersStreamSub?.cancel();
    return super.close();
  }
}
