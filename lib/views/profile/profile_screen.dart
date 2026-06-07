import 'package:flutter/material.dart';
import '../../core/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: TornadoTheme.primaryColor,
              child: Icon(Icons.person, size: 80, color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Text(
              'Anas Khan',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'anas.khan@example.com',
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
            const SizedBox(height: 32),
            _buildProfileOption(Icons.history, 'Order History'),
            _buildProfileOption(Icons.location_on_outlined, 'Saved Addresses'),
            _buildProfileOption(Icons.payment_outlined, 'Payment Methods'),
            _buildProfileOption(Icons.notifications_outlined, 'Notification Settings'),
            _buildProfileOption(Icons.help_outline, 'Help & Support'),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('LOGOUT', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: TornadoTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: TornadoTheme.primaryColor),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
        onTap: () {},
      ),
    );
  }
}
