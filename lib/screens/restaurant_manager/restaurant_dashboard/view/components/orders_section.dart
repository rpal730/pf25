import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_state.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/restaurant_dashboard/view/components/order_card.dart';
import 'package:injectable/injectable.dart';

class OrdersSection extends StatelessWidget {
  const OrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantManagerCubit, RestaurantManagerState>(
      builder: (context, state) {
        return Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            for (OrderModel order in state.restaurantData?.orders ?? [])
              OrderCard(order: order),
          ],
        );
      },
    );
  }
}
