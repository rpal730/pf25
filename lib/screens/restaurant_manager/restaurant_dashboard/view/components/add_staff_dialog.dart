import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/show_app_dialog.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/model/user_model.dart';
import 'package:uuid/uuid.dart';

Future<void> showAddStaffMemberSheet({
  required BuildContext context,
  required String restaurantId,
  required void Function(UserModel user) onSubmit,
}) async {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final List<String> roles = ['operator', 'manager', 'chef'];
  String selectedRole = 'operator';

  await showAppDialog(
    context,
    barrierDismissible: false,

    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          left: 20,
          right: 20,
          top: 20,
        ),
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
              'Add Staff Member',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Username
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12), // Username
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Role Dropdown
            DropdownButtonFormField<String>(
              value: selectedRole,
              items:
                  roles
                      .map(
                        (role) => DropdownMenuItem(
                          value: role,
                          child: Text(
                            role[0].toUpperCase() + role.substring(1),
                          ),
                        ),
                      )
                      .toList(),
              decoration: const InputDecoration(
                labelText: 'Role',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (value != null) {
                  selectedRole = value;
                }
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final username = usernameController.text.trim();
                final phone = phoneNumberController.text.trim();

                if (name.isEmpty || username.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                final user = UserModel(
                  id: Uuid().v4(),
                  name: name,
                  phoneNumber: phone,
                  username: username,
                  role: selectedRole,
                  restaurantId: restaurantId,
                  createdAt: DateTime.now().toIso8601String(),
                );

                onSubmit(user);
                Navigator.of(context).pop();
              },
              child: const Text('Add Staff'),
            ),
          ],
        ),
      );
    },
  );
}
