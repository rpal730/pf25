import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/res/pagination/pagination.dart';
import 'package:flutter_web_portfolio_2025/res/pagination/pagination_builder.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_state.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/orders/cubit/orders_section_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/orders/cubit/orders_section_state.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/restaurant_dashboard/view/components/edit_order_status_dialog.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/orders/view/order_card.dart';
import 'package:injectable/injectable.dart';

class OrdersSection extends StatelessWidget {
  const OrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();

    // Give cubit the context for snackbar use
    ordersCubit.setContext(context);


    return BlocBuilder<OrdersCubit, OrdersSectionState>(
      builder: (context, state) {
        final orders = List<OrderModel>.from(state.orders ?? []);

        return PaginationBuilder(
          pagination: Pagination(
            limit: 10,
            isLastPage: !(state.hasMoreOrders ?? false),
          ),
          childCount: orders.length,
          onLoadMore: () => ordersCubit.fetchMoreOrders(),
          builder: (context, scrollController, childCount, showLoader) {
            ordersCubit.setScrollController(scrollController);

            return ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: orders.length,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final order = orders[index];
                return InkWell(
                  onTap: () async {
                    await showEditOrderDialog(
                      context: context,
                      order: order,
                      onOrderUpdate: (updatedOrder) {
                        context.read<OrdersCubit>().updateOrder(updatedOrder);
                      },
                    );
                  },
                  child: OrderCard(order: order, index: index),
                );
              },
            );
          },
        );
      },
    );
  }
}
