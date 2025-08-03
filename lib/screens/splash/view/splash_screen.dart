

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/config/routes/app_router.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:flutter_web_portfolio_2025/screens/splash/cubit/splash_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/splash/cubit/splash_enum.dart';

@RoutePage()


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashEnum>(
          listener: (context, state) {
          //  switch (state) {
            context.router.replace(const DashboardRoute());
            //  case SplashEnum.authenticated:
            //  context.router.replace(const DashboardRoute());
               
            //    break; 
            //    case SplashEnum.unauthenticated:
            //  context.router.replace(const LoginRoute());
               
              //  break;
            //  default:
          //  }
          },
          child:  Center(
            child: SizedBox(
              width: figmaScreenWidth,
              child: Image.asset("assets/download.jpeg")),
          ),
        ),
      ),
    );
  }
}