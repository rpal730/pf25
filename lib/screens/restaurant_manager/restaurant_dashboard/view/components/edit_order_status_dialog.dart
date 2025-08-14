import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';

Future<void> showEditOrderDialog({
  required BuildContext context,
  required OrderModel order,
  required void Function(OrderModel updatedOrder) onOrderUpdate,
}) async {
  final List<String> statusOptions = [
    'pending',
    'preparing',
    'ready',
    'completed',
    'cancelled',
  ];

  String selectedStatus = order.orderStatus ?? '';

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.accentYellow,
            title: const Text('Edit Order Status'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display order details (read-only)
                  Text(
                    'Customer: ${order.customerName}\n',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Order Items: \n${order.items?.map((e) => ('${e.name} x ${e.quantity}')).join(', ')}\n',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Phone: ${order.phoneNumber}'),
                  Text('Total: ₹${order.totalAmount}'),
                  const SizedBox(height: 16),

                  const Text(
                    'Order Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  ...statusOptions.map((status) {
                    return RadioListTile<String>(
                      title: Text(
                        status[0].toUpperCase() + status.substring(1),
                      ),
                      value: status,
                      groupValue: selectedStatus,
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value!;
                        });
                      },
                      dense: true,
                      visualDensity: VisualDensity.compact,
                    );
                  }),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Cancel
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final updatedOrder = order.copyWith(
                    orderStatus: selectedStatus,
                   
                  );
                  onOrderUpdate(updatedOrder);
                  Navigator.pop(context);
                },
                child: const Text('Update'),
              ),
            ],
          );
        },
      );
    },
  );
}
