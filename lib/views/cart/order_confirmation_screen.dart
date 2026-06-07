import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../navigation_hub.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: TornadoTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 80, color: Colors.black),
              ),
              const SizedBox(height: 32),
              const Text(
                'Order Confirmed!',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your Tornado Fries are being prepared and will be with you shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MainNavigationHub()),
                      (route) => false,
                    );
                  },
                  child: const Text('BACK TO HOME'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navigate to Order History
                },
                child: const Text('Track Order', style: TextStyle(color: TornadoTheme.primaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
