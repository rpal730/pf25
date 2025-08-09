import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/show_app_dialog.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/menu_item_model.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/order_model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

Future<void> showAddOrderDialog({
  required RestaurantManagerCubit cubit,
  required BuildContext context,
  required List<MenuItemModel> menuItems,
  required void Function(OrderModel order) onOrderSubmit,
}) async {
  String getRandomUpiId(List<String>? upiIds) {
    print('upiIds: $upiIds');
    if (upiIds == null || upiIds.isEmpty) return '';
    if (upiIds.length == 1) return upiIds.first;

    final random = Random();
    return upiIds[random.nextInt(upiIds.length)];
  }

  final customerNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  // Track selected quantities
  final Map<String, int> selectedQuantities = {
    for (final item in menuItems) item.id ?? '': 0,
  };

  double calculateTotal() {
    double total = 0.0;
    for (final item in menuItems) {
      final quantity = selectedQuantities[item.id] ?? 0;
      total += (item.price ?? 0) * quantity;
    }
    return total;
  }

  final List<String> paymentOptions = ['Cash', 'Card', 'UPI'];
  String selectedPaymentMode = 'Cash'; // default selection

  final searchController = TextEditingController();
  String searchQuery = '';

  await showAppDialog(
    context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final filteredMenuItems =
              menuItems.where((item) {
                return item.name?.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    ) ??
                    false;
              }).toList();
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BrutalismContainer(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Create Order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Customer Name
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Customer Name', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 4),
                TextField(
                  controller: customerNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Phone
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Phone Number', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 4),
                TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Enter phone number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Payment Mode
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Payment Mode', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 4),

                ...paymentOptions.map((option) {
                  return RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: selectedPaymentMode,
                    onChanged: (value) {
                      selectedPaymentMode = value!;
                      (context as Element).markNeedsBuild(); // triggers rebuild
                    },
                    dense: true,
                    visualDensity: VisualDensity.compact,
                  );
                }),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Search Menu Items',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 4),
                TextField(
                  controller: searchController,
                  onChanged: (value) {
                    searchQuery = value;
                    setState(() {}); // Triggers rebuild
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon:
                        searchQuery.isNotEmpty
                            ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                searchController.clear();
                                searchQuery = '';
                                setState(() {});
                              },
                            )
                            : null,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Items',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),

                // List of menu items with quantity controls
                ...filteredMenuItems.map((item) {
                  final quantity = selectedQuantities[item.id] ?? 0;
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${item.price?.toStringAsFixed(2) ?? "0.00"}',
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed:
                                    quantity > 0
                                        ? () {
                                          selectedQuantities[item.id ?? ''] =
                                              quantity - 1;
                                          (context as Element).markNeedsBuild();
                                        }
                                        : null,
                              ),
                              Text('$quantity'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed:
                                    (item.availableUnits ?? 0) > quantity
                                        ? () {
                                          selectedQuantities[item.id!] =
                                              quantity + 1;
                                          (context as Element).markNeedsBuild();
                                        }
                                        : null,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 16),
                Text(
                  'Total: \$${calculateTotal().toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final name = customerNameController.text.trim();
                    final phone = phoneNumberController.text.trim();
                    final payment = selectedPaymentMode;

                    final selectedItems =
                        menuItems
                            .where((item) => selectedQuantities[item.id]! > 0)
                            .map(
                              (item) => item.copyWith(
                                quantity: selectedQuantities[item.id],
                              ),
                            )
                            .toList();

                    if (name.isEmpty ||
                        phone.isEmpty ||
                        payment.isEmpty ||
                        selectedItems.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Please fill all fields and select items',
                          ),
                        ),
                      );
                      return;
                    }

                    final order = OrderModel(
                      id: Uuid().v4(),
                      customerName: name,
                      phoneNumber: phone,
                      paymentMode: payment,
                      totalAmount: calculateTotal().toStringAsFixed(2),
                      orderStatus: 'pending',
                      items: selectedItems,
                      createdAt: DateTime.now().toIso8601String(),
                    );

                    final selectedUpiId = getRandomUpiId(
                      cubit.state.restaurantData?.upiPaymentId,
                    );

                    // Build UPI payment URI
                    final upiUri =
                        Uri(
                          scheme: 'upi',
                          host: 'pay',
                          queryParameters: {
                            'pa': selectedUpiId,
                            'pn': cubit.state.restaurantData?.name ?? '',
                            'am': calculateTotal().toStringAsFixed(2),
                            'cu': 'INR',
                          },
                        ).toString();

                    // Show QR code in dialog
                    await showAppDialog(
                      context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Scan to Pay'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Pay with UPI'),
                              const SizedBox(height: 10),
                              QrImageView(data: upiUri, size: 200),
                              const SizedBox(height: 10),
                              Text(
                                'Amount: ₹${calculateTotal().toStringAsFixed(2)}',
                              ),
                              Text('UPI ID: $selectedUpiId'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                onOrderSubmit(
                                  order,
                                ); // Save order only after showing QR
                                Navigator.of(context).pop(); // Close QR dialog
                                Navigator.of(
                                  context,
                                ).pop(); // Close main dialog
                              },
                              child: const Text('Done'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Place Order'),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
