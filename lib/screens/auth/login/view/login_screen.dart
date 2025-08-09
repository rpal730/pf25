import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/app/cubit/app_cubit.dart';
import 'package:flutter_web_portfolio_2025/config/app_injection.dart';
import 'package:flutter_web_portfolio_2025/config/routes/app_router.dart';
import 'package:flutter_web_portfolio_2025/res/custom_text_field.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(),
          const Text('Login Screen'),
          ElevatedButton(
            onPressed: () {
              getIt<AppCubit>().setToken('token');

              if (getIt<AppCubit>().state.token != null) {
                context.router.replace(const DashboardRoute());
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
