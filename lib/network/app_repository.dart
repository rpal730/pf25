import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_web_portfolio_2025/app/cubit/app_cubit.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';
import 'package:flutter_web_portfolio_2025/network/dio_client.dart';

@lazySingleton
class AppRepository {
  Future<void> setRestaurantData({
    required Map<String, dynamic> data,
    String? id,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('restaurants')
          .doc(id)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      throw Exception("Error saving answer: $e");
    }
  }

  Future<void> setUserData({
    String? id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      throw Exception("Error saving answer: $e");
    }
  }

  Stream<List<OrderModel>> streamOrders({
    required String restaurantId,
    int limit = 3,
  }) {
    final firestore = FirebaseFirestore.instance;

    final messagesRef = firestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('orders')
        .orderBy('created_at', descending: true)
        .limit(limit);

    return messagesRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return OrderModel.fromJson(data).copyWith(snapshot: doc, id: doc.id);
      }).toList();
    });
  }
}
