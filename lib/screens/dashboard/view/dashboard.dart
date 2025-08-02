import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/config/routes/app_router.dart';
import 'package:flutter_web_portfolio_2025/res/app_strings.dart';
import 'package:flutter_web_portfolio_2025/res/custom_navbar_widget.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:flutter_web_portfolio_2025/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/dashboard/cubit/dashboard_state.dart';
import 'package:flutter_web_portfolio_2025/screens/screen1/screen1.dart';
import 'package:flutter_web_portfolio_2025/screens/screen2/screen2.dart';
import 'package:flutter_web_portfolio_2025/screens/screen3/screen3.dart';
import 'package:flutter_web_portfolio_2025/screens/screen4/screen4.dart';
import 'package:flutter_web_portfolio_2025/screens/screen5/screen5.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          // switch (state.selectedIndex) {
          //   case 0:
          //     context.router.replace(const Route1Route());
          //     break;
          //   case 1:
          //     context.router.replace(const Route2Route());
          //     break;
          //   case 2:
          //     context.router.replace(const Route3Route());
          //     break;
          //   case 3:
          //     context.router.replace(const Route4Route());
          //     break;
          //   case 4:
          //     context.router.replace(const Route5Route());
          //     break;
          //   default:
          // }
          return Scaffold(
            // appBar: AppBar(
            //   title:  Text('Home',style: Theme.of(context).textTheme.titleLarge, ),
            // ),
            body: IndexedStack(index: state.selectedIndex, children: const [Screen1Screen(), Screen2Screen(), Screen3Screen(), Screen4Screen(), Screen5Screen()]),
            appBar: CustomStatelessWidget(
              child: Container(
                width: 300,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 2))]),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //HOME WIDGET
                      CustomNavbarWidget(
                        isSelected: state.selectedIndex == 0,
                        selectedIcon: Icons.home_filled,
                        unSelectedIcon: Icons.home_outlined,
                        onTap: () {
                          context.read<DashboardCubit>().selectIndex(0);
                        },
                        label: AppStrings.home,
                      ),

                      //MECHANIC WIDGET
                      CustomNavbarWidget(
                        isSelected: state.selectedIndex == 1,
                        selectedIcon: Icons.settings,
                        unSelectedIcon: Icons.settings_outlined,
                        onTap: () {
                          context.read<DashboardCubit>().selectIndex(1);
                        },
                        label: AppStrings.settings,
                      ),

                      //CART WIDGET
                      CustomNavbarWidget(
                        isSelected: state.selectedIndex == 2,
                        selectedIcon: Icons.shopping_bag,
                        unSelectedIcon: Icons.shopping_bag_outlined,
                        onTap: () {
                          context.read<DashboardCubit>().selectIndex(2);
                        },
                        label: AppStrings.orders,
                      ),

                      //HISTORY WIDGET
                      CustomNavbarWidget(
                        isSelected: state.selectedIndex == 3,
                        selectedIcon: Icons.history,
                        unSelectedIcon: Icons.history_toggle_off,
                        onTap: () {
                          context.read<DashboardCubit>().selectIndex(3);
                        },
                        label: AppStrings.history,
                      ),

                      //PROFILE WIDGET
                      CustomNavbarWidget(
                        isSelected: state.selectedIndex == 4,
                        selectedIcon: Icons.person,
                        unSelectedIcon: Icons.person_outline,
                        onTap: () {
                          context.read<DashboardCubit>().selectIndex(4);
                        },
                        label: AppStrings.profile,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomStatelessWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  const CustomStatelessWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Size get preferredSize => Size(200, kToolbarHeight + 30);
}
