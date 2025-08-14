import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/loader.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_state.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/orders/cubit/orders_section_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/restaurant_dashboard/view/components/add_menu_dialog.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/restaurant_dashboard/view/components/add_order_dialog.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/restaurant_dashboard/view/components/add_staff_dialog.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/orders/view/orders_section.dart';

@RoutePage()
class RestaurantDashboardScreen extends StatelessWidget {
  final String id;
  const RestaurantDashboardScreen({@PathParam('id') required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantManagerCubit()..setRestaurantId(id),
      child: BlocBuilder<RestaurantManagerCubit, RestaurantManagerState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.accentYellow,
            appBar: AppBar(
              backgroundColor: AppColors.accentYellow,
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              centerTitle: true,
              title: InkWell(
                onTap: () => context.router.pop(),
                child: BrutalismContainer(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ),
            body: Center(
              child:
                  state.fetchingRestaurantDetails ?? false
                      ? const CustomLoaderBar()
                      : (state.restaurantData == null
                          ? const Text('Restaurant details not found.')
                          : SizedBox(
                            width: figmaScreenWidth,
                            child: BrutalismContainer(
                              child: Column(
                                children: [
                                  Text(
                                    '${state.restaurantData!.name}\'s dashboard',
                                  ),

                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      if (state
                                              .loggedInStaffData
                                              ?.canAddStaff ??
                                          false)
                                        BrutalismContainer(
                                          onTap: () async {
                                            await showAddStaffMemberSheet(
                                              context: context,
                                              onSubmit: (user) async {
                                                await context
                                                    .read<
                                                      RestaurantManagerCubit
                                                    >()
                                                    .addStaffToRestaurant(user);
                                              },
                                              restaurantId:
                                                  state.restaurantData?.id ??
                                                  '',
                                            );
                                          },
                                          child: const Text('Add Staff'),
                                        ),
                                      BrutalismContainer(
                                        onTap: () async {
                                          await showAddOrderDialog(
                                            cubit:
                                                context
                                                    .read<
                                                      RestaurantManagerCubit
                                                    >(),
                                            context: context,
                                            menuItems:
                                                state
                                                    .restaurantData
                                                    ?.menuItems ??
                                                [],
                                            onOrderSubmit: (order) async {
                                              await context
                                                  .read<
                                                    RestaurantManagerCubit
                                                  >()
                                                  .addOrderToRestaurant(order);
                                            },
                                          );
                                        },
                                        child: const Text('Add Order'),
                                      ),
                                      BrutalismContainer(
                                        onTap: () {
                                          showAddMenuItemDialog(
                                            onModelSubmit: (menuItem) async {
                                              await context
                                                  .read<
                                                    RestaurantManagerCubit
                                                  >()
                                                  .addMenuToRestaurant(
                                                    menuItem,
                                                  );
                                            },
                                            context: context,
                                            cubit:
                                                context
                                                    .read<
                                                      RestaurantManagerCubit
                                                    >(),
                                          );
                                        },
                                        child: const Text('Add Menu Item'),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 12),

                                  Expanded(
                                    child: BlocProvider(
                                      create:
                                          (context) => OrdersCubit(
                                            restaurantId:
                                                state.restaurantId ?? '',
                                          )..fetchInitialOrders()..listenToNewOrders(),
                                      child: OrdersSection(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
            ),
          );
        },
      ),
    );
  }
}
