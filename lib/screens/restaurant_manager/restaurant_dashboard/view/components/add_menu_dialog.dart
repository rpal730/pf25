import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_portfolio_2025/res/show_app_dialog.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/menu_item_model.dart';
import 'package:uuid/uuid.dart';

Future<void> showAddMenuItemDialog({
  required BuildContext context,
  required RestaurantManagerCubit cubit,
  required void Function(MenuItemModel order) onModelSubmit,
}) {
  final itemNameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final availableUnitController = TextEditingController();

  return showAppDialog(
    context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Add Menu Item',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            const Text('Item Name', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            TextField(
              controller: itemNameController,
              decoration: const InputDecoration(
                hintText: 'Enter item name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            const Text('Description', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Enter description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            const Text('Price', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            TextField(
              controller: priceController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter price (e.g. 9.99)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            const Text('Total Quantity', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            TextField(
              controller: availableUnitController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter total units',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final itemName = itemNameController.text.trim();
                  final description = descriptionController.text.trim();
                  final availableUnits = int.tryParse(
                    availableUnitController.text.trim(),
                  );
                  final price = double.tryParse(priceController.text.trim());

                  if (itemName.isEmpty ||
                      price == null ||
                      availableUnits == null) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please fill all fields correctly'),
                      ),
                    );
                    return;
                  }

                  onModelSubmit(
                    MenuItemModel(
                      id: Uuid().v4(),
                      name: itemName,
                      description: description,
                      price: price,
                      availableUnits: availableUnits,
                      createdAt: DateTime.now().toIso8601String(),
                    ),
                  );

                  // TODO: Replace with actual cubit call
                  // cubit.addMenuItem(name: itemName, price: price, description: description);

                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      );
    },
  );
}
