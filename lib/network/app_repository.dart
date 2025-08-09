import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
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
}
