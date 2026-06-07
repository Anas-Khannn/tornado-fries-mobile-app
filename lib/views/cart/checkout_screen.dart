import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'order_confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _paymentMethod = 0; // 0 for COD, 1 for Online

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Address',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: TornadoTheme.surfaceColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: TornadoTheme.primaryColor),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'House 123, Street 5, Blue Area, Islamabad, Pakistan',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Change', style: TextStyle(color: TornadoTheme.primaryColor)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Payment Method',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(0, 'Cash on Delivery', Icons.money),
            const SizedBox(height: 12),
            _buildPaymentOption(1, 'Online Payment', Icons.credit_card),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const OrderConfirmationScreen()),
                    (route) => false,
                  );
                },
                child: const Text('PLACE ORDER'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(int value, String title, IconData icon) {
    return GestureDetector(
      onTap: () => setState(() => _paymentMethod = value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: TornadoTheme.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _paymentMethod == value ? TornadoTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: _paymentMethod == value ? TornadoTheme.primaryColor : Colors.white54),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: _paymentMethod == value ? Colors.white : Colors.white54,
                fontWeight: _paymentMethod == value ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const Spacer(),
            if (_paymentMethod == value)
              const Icon(Icons.check_circle, color: TornadoTheme.primaryColor),
          ],
        ),
      ),
    );
  }
}
