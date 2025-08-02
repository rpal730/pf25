import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_web_portfolio_2025/app/cubit/app_cubit.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';
import 'package:flutter_web_portfolio_2025/network/dio_client.dart';

@lazySingleton
class AppRepository {
  final AppCubit _appCubit = getIt<AppCubit>();

  final DioClient _dioClient = DioClient(Dio());

  Options get options => Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${_appCubit.state.token}',
        },
      );

  //-----------

  Future<Response> dummyapicallGooglecom() async {
    final response = await _dioClient.get('https://www.google.com');
    return response;
  }

  Future<Response> dummyapicallBadUrl() async {
    final response = await _dioClient.get('htaad.09.com');
    return response;
  }

  Future<Response> dummyapicallthroException() async {
    await _dioClient.get('htaad.09.com');
    throw Exception();
  }
}
