import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';
import 'package:flutter_web_portfolio_2025/internet_checker/cubit/network_checker.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    if (kDebugMode) {
      log("Dio Client INTERCEPTORS START: -----------");
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));
      log("INTERCEPTORS: ------------------------END");
    }
  }

  // Centralized error handler
  Future<Response<T>> _handleErrors<T>(
      Future<Response<T>> Function() dioCall) async {
    try {
      var result = await dioCall();

      return result;
    } on SocketException catch (e) {
      log('SocketException Error: $e');
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      log("FormatException Error: ${e.toString()}");
      throw const FormatException('Unable to process the data');
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        log('CONNECTION ERROR : ${e.message}');

        getIt<NetworkCheckerCubit>().startInternetCheck();
      }

      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        log("Timeout Error: ${e.message}");
        throw Exception('Request timed out');
      } else if (e.response != null) {
        log("HTTP Error: ${e.response?.statusCode} - ${e.response?.statusMessage}");
      } else {
        log("Unexpected Error: ${e.message}");
      }
      rethrow;
    } catch (e) {
      log("Unknown Error: $e");
      rethrow;
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<Response<dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleErrors(() => _dio.get(
          uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  // Post:----------------------------------------------------------------------
  Future<Response<dynamic>> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    log('POST Data: $data');
    return _handleErrors(() => _dio.post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  // PUT:----------------------------------------------------------------------
  Future<Response<dynamic>> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleErrors(() => _dio.put(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  // PATCH:----------------------------------------------------------------------
  Future<Response<dynamic>> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleErrors(() => _dio.patch(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  // DELETE:----------------------------------------------------------------------
  Future<Response<dynamic>> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _handleErrors(() => _dio.delete(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        ));
  }
}
