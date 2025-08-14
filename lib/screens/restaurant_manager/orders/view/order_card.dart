import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final int? index;

  const OrderCard({super.key, required this.order, this.index});

  @override
  Widget build(BuildContext context) {
    final createdAt = DateTime.tryParse(order.createdAt ?? '');
    final now = DateTime.now();
    final duration = createdAt != null ? now.difference(createdAt) : null;

    // Determine color based on order age
    Color backgroundColor;
    if (duration == null) {
      backgroundColor = Colors.grey.shade200;
    } else if (duration.inMinutes > 10) {
      backgroundColor = Colors.red.shade100;
    } else if (duration.inMinutes > 5) {
      backgroundColor = Colors.orange.shade100;
    } else {
      backgroundColor = Colors.green.shade100;
    }

    return Container(
      // width: 10,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${((index ?? 0) + 1)}. ${order.customerName ?? 'Unknown Customer'}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            'Status: ${order.orderStatus ?? 'N/A'}',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 4),
          if (createdAt != null) ...[
            // Text(
            //   'Created: ${DateFormat('hh:mm a, dd MMM').format(createdAt)}',
            //   style: const TextStyle(fontSize: 13, color: Colors.grey),
            // ),
            const SizedBox(height: 4),
            Text(
              'Placed ${duration!.inMinutes} minutes ago',
              style: TextStyle(
                fontSize: 13,
                color:
                    duration.inMinutes > 10
                        ? Colors.red
                        : duration.inMinutes > 5
                        ? Colors.orange
                        : Colors.green,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
