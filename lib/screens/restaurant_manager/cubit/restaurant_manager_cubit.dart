import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_portfolio_2025/app/cubit/app_cubit.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';
import 'package:flutter_web_portfolio_2025/config/routes/app_router.dart';
import 'package:flutter_web_portfolio_2025/network/app_repository.dart';
import 'package:flutter_web_portfolio_2025/network/firestore_service.dart';
import 'package:flutter_web_portfolio_2025/res/password_helper.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_state.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/menu_item_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/restaurant_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/user_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class RestaurantManagerCubit extends HydratedCubit<RestaurantManagerState> {
  RestaurantManagerCubit() : super(RestaurantManagerState());

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController restaurantNameController = TextEditingController();
  TextEditingController restaurantGSTINController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();

  setLoadersToInit() {
    emit(state.copyWith(fetchingRestaurantDetails: false, isLoading: false));
  }

  setRestaurantId(String? value) async {
    emit(state.copyWith(restaurantId: value));
    await fetchRestaurantDetails();
    await fetchAllMenuItems();
    // await fetchAllOrders();
    await fetchTodayOrders();
    listenToOrders();
  }

  addMenuItemLocally(MenuItemModel menuItem) {
    emit(
      state.copyWith(
        restaurantData: state.restaurantData!.copyWith(
          menuItems: [...state.restaurantData?.menuItems ?? [], menuItem],
        ),
      ),
    );
  }

  addOrderLocally(OrderModel order, {bool editOnly = false}) {
    final currentOrders = state.restaurantData?.orders ?? [];

    List<OrderModel> updatedOrders;

    if (editOnly) {
      // Replace the existing order with the updated one
      updatedOrders =
          currentOrders.map((o) {
            if (o.id == order.id) {
              return order; // updated order
            }
            return o;
          }).toList();
    } else {
      // Add as new
      updatedOrders = [order, ...currentOrders];
    }

    emit(
      state.copyWith(
        restaurantData: state.restaurantData!.copyWith(orders: updatedOrders),
      ),
    );
  }

  addStaffMemberLocally(UserModel userModel) {
    emit(
      state.copyWith(
        restaurantData: state.restaurantData!.copyWith(
          staffMembers: [
            ...state.restaurantData?.staffMembers ?? [],
            userModel,
          ],
        ),
      ),
    );
  }

  Future<void> fetchRestaurantDetails() async {
    try {
      emit(state.copyWith(fetchingRestaurantDetails: true));
      final docRef = FirebaseFirestore.instance
          .collection('restaurants')
          .doc(state.restaurantId);
      final snapshot = await docRef.get();
      print('snapshot: $snapshot');
      print('snapshot: ${snapshot.id}');
      print('snapshot restaurant id : ${state.restaurantId}');

      if (!(snapshot.exists)) {
        throw Exception('Restaurant not found!---1');
      }

      final data = snapshot.data();

      if (data == null) {
        throw Exception('Restaurant not found!, data - $data');
      }

      emit(
        state.copyWith(
          restaurantData: RestaurantModel.fromJson(
            data,
          ).copyWith(id: snapshot.id),
        ),
      );

      // ✅ Now fetch the logged-in staff's details
      final staffQuery =
          await docRef
              .collection('staff')
              .where(
                'username',
                isEqualTo: getIt<AppCubit>().state.userData?.username,
              )
              .limit(1)
              .get();

      if (staffQuery.docs.isEmpty) {
        throw Exception('Staff member not found!');
      }

      final staffData = staffQuery.docs.first.data();

      emit(
        state.copyWith(
          loggedInStaffData: UserModel.fromJson(
            staffData,
          ).copyWith(id: staffQuery.docs.first.id),
        ),
      );
    } catch (e) {
      emit(state.copyWith(fetchingRestaurantDetails: false));
      log(e.toString());
    } finally {
      emit(state.copyWith(fetchingRestaurantDetails: false));
      emit(state);
    }
  }

  Future<void> fetchAllMenuItems() async {
    final restaurantMenuRef =
        FirebaseFirestore.instance
            .collection('restaurants')
            .doc(state.restaurantId)
            .collection('menu')
            .get();

    final menuItems = await restaurantMenuRef.then(
      (value) =>
          value.docs.map((e) => MenuItemModel.fromJson(e.data())).toList(),
    );
    emit(
      state.copyWith(
        restaurantData: state.restaurantData?.copyWith(menuItems: menuItems),
      ),
    );
  }

  Future<void> fetchAllOrders() async {
    final restaurantMenuRef =
        await FirebaseFirestore.instance
            .collection('restaurants')
            .doc(state.restaurantId)
            .collection('orders')
            .orderBy('created_at', descending: true) // 👈 Latest first
            .get();

    final orders =
        restaurantMenuRef.docs
            .map((e) => OrderModel.fromJson(e.data()))
            .toList();

    emit(
      state.copyWith(
        restaurantData: state.restaurantData?.copyWith(orders: orders),
      ),
    );
  }

  Future<void> fetchTodayOrders() async {
    final now = DateTime.now();

    // Get start of the day (00:00:00)
    final startOfDay = DateTime(now.year, now.month, now.day);

    // Get end of the day (23:59:59.999)
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);

    final todayOrdersSnapshot =
        await FirebaseFirestore.instance
            .collection('restaurants')
            .doc(state.restaurantId)
            .collection('orders')
            .where(
              'created_at',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay),
            )
            .where(
              'created_at',
              isLessThanOrEqualTo: Timestamp.fromDate(endOfDay),
            )
            .orderBy('created_at', descending: true)
            .get();

    final orders =
        todayOrdersSnapshot.docs
            .map((e) => OrderModel.fromJson(e.data()))
            .toList();

    emit(
      state.copyWith(
        restaurantData: state.restaurantData?.copyWith(orders: orders),
      ),
    );
  }

  List<OrderModel> addOrUpdateOrders(
    List<OrderModel> newItems, {
    bool areLatestOrders = false,
  }) {
    final existingItems = state.restaurantData?.orders ?? [];

    // Map existing by ID for quick replacement
    final orderMap = {for (var e in existingItems) e.id: e};

    // Replace or add
    for (final item in newItems) {
      if (item.id != null) {
        orderMap[item.id!] = item;
      }
    }

    return orderMap.values.toList();
  }

  StreamSubscription? _ordersStreamSub;

  void listenToOrders() {
    log("listenToMessages called");
    _ordersStreamSub?.cancel(); // cancel previous if any

    _ordersStreamSub = getIt<AppRepository>()
        .streamOrders(restaurantId: state?.restaurantId ?? "")
        .listen((incomingOrders) {
          log("📨 Incoming orders: ${incomingOrders}");
          final updated = addOrUpdateOrders(
            incomingOrders,
            areLatestOrders: true,
          );

          log("📨 Real-time messages received: ${incomingOrders.length}");

          emit(
            state.copyWith(
              restaurantData: state.restaurantData?.copyWith(orders: updated),
            ),
          );
        });
  }

  showRestaurantSignInForm(bool? value) {
    emit(state.copyWith(showSignInForm: value));
  }

  Future<void> loginUser(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      _showError(context, "All fields are required.");
      return;
    }

    try {
      // final hashedPassword = PasswordHelper.hashPassword(passwordController.text.trim());

      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(usernameController.text.trim());
      final snapshot = await docRef.get();

      if (!snapshot.exists) {
        _showError(context, 'User not found!');
        return;
        // throw Exception('User not found!');
      }

      final data = snapshot.data();

      if (data == null || data['password'] != null) {
        final isMatched = PasswordHelper.verifyPassword(
          passwordController.text.trim(),
          data!['password'],
        );

        log('HashedPassword: $isMatched');

        if (isMatched == false) {
          _showError(context, 'Invalid credentials');
          return;
        }
        // throw Exception('Invalid credentials');
      }

      // ✅ Save session locally
      getIt<AppCubit>().setUserData(
        UserModel.fromJson(data!).copyWith(id: snapshot.id, createdAt: null),
      );
      _showSuccess(context, 'Login successful! Welcome, ${data['name']}');

      context.router.push(RestaurantDashboardRoute(id: data['restaurant_id']));

      print('✅ Login successful');
    } catch (e, s) {
      emit(state.copyWith(isLoading: false));
      print('❌ Login failed: $e , $s');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signUpRestaurant(BuildContext context) async {
    try {
      final name = nameController.text.trim();
      final username = usernameController.text.trim();
      final password = passwordController.text;
      final restaurantName = restaurantNameController.text.trim();
      final gstin = restaurantGSTINController.text.trim();
      final upiId = upiIdController.text.trim();

      // === VALIDATION ===

      if (name.isEmpty ||
          username.isEmpty ||
          password.isEmpty ||
          restaurantName.isEmpty ||
          upiId.isEmpty) {
        _showError(context, "All fields are required.");
        return;
      }

      if (password.length < 6) {
        _showError(context, "Password must be at least 6 characters.");
        return;
      }

      final usernameRegex = RegExp(r'^[a-zA-Z0-9_.-]+$');
      if (!usernameRegex.hasMatch(username)) {
        _showError(
          context,
          "Username can only contain letters, numbers, underscores, dots or hyphens.",
        );
        return;
      }

      final gstinRegex = RegExp(r'^[a-zA-Z0-9_.-]+$');
      if (gstin.isNotEmpty)
      // final gstinRegex = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');
      {
        if (!gstinRegex.hasMatch(gstin)) {
          if (gstin.isNotEmpty) {
            _showError(context, "Invalid GSTIN format.");

            return;
          }
        }
      }

      // === CHECK IF USERNAME EXISTS ===

      emit(state.copyWith(isLoading: true));

      final existingUserSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(username)
              .get();

      if (existingUserSnapshot.exists) {
        _showError(context, "Username already exists. Please choose another.");
        return;
      }

      // === CONTINUE SIGNUP ===

      final createdAt = FieldValue.serverTimestamp();
      final String hashedPassword = PasswordHelper.hashPassword(password);

      final restaurantDocRef =
          FirebaseFirestore.instance.collection('restaurants').doc();

      await restaurantDocRef.set({
        'name': restaurantName,
        'gstin': gstin,
        'owned_by': name,
        'created_at': createdAt,
        'upi_payment_id': [upiId],
      });

      await restaurantDocRef.collection('staff').add({
        'name': name,
        'username': username,
        'password': hashedPassword,
        'created_at': createdAt,
        'role': 'owner',
      });

      await getIt<AppRepository>().setUserData(
        id: username,

        data: {
          'name': name,
          'username': username,
          'password': hashedPassword,
          'role': 'owner',
          'restaurant_id': restaurantDocRef.id,
          'created_at': createdAt,
        },
      );

      _showSuccess(context, "Restaurant registered successfully!");
    } catch (e) {
      print("Error signing up restaurant: $e");
      _showError(context, "Something went wrong. Please try again.");
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> addStaffToRestaurant(UserModel userModel) async {
    addStaffMemberLocally(userModel);
    final userWithId = userModel;

    final userJson = {
      ...userWithId.toJson(),
      'created_at': FieldValue.serverTimestamp(),
    };

    final restaurantStaffRef = FirebaseFirestore.instance
        .collection('restaurants')
        .doc(state.restaurantId)
        .collection('staff')
        .doc(userModel.id);

    final globalUsersRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.id);

    final batch = FirebaseFirestore.instance.batch();

    batch.set(globalUsersRef, userJson);
    batch.set(restaurantStaffRef, userJson);

    await batch.commit();
  }

  Future<void> addMenuToRestaurant(MenuItemModel menuModel) async {
    addMenuItemLocally(menuModel);
    final restaurantMenuRef = FirebaseFirestore.instance
        .collection('restaurants')
        .doc(state.restaurantId)
        .collection('menu')
        .doc(menuModel.id);

    await restaurantMenuRef.set({
      ...menuModel.toJson(),
      'created_at': FieldValue.serverTimestamp(),
    });
  }

  Future<void> addOrderToRestaurant(OrderModel orderModel) async {
    // addOrderLocally(orderModel);
    final restaurantOrdersRef = FirebaseFirestore.instance
        .collection('restaurants')
        .doc(state.restaurantId)
        .collection('orders')
        .doc(orderModel.id);

    print('Order ID: ${orderModel.id}');

    await restaurantOrdersRef.set({
      ...orderModel.toJson(),
      'created_at': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateOrder(OrderModel orderModel) async {
    // addOrderLocally(orderModel, editOnly: true);
    final restaurantOrdersRef = FirebaseFirestore.instance
        .collection('restaurants')
        .doc(state.restaurantId)
        .collection('orders')
        .doc(orderModel.id);

    print('Order ID: ${orderModel.id}');

    await restaurantOrdersRef.update({
      ...orderModel.toJson()..remove('created_at'),
      'updated_at': FieldValue.serverTimestamp(),
    });
  }

  void _showError(BuildContext context, String message) {
    emit(state.copyWith(isLoading: false));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(width: figmaScreenWidth, child: Text(message)),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccess(BuildContext context, String message) {
    emit(state.copyWith(isLoading: false));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(width: figmaScreenWidth, child: Text(message)),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Future<void> close() {
    _ordersStreamSub?.cancel();
    return super.close();
  }
  @override
  RestaurantManagerState? fromJson(Map<String, dynamic> json) {
    return RestaurantManagerState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(RestaurantManagerState state) {
    return state.toJson();
  }
}
