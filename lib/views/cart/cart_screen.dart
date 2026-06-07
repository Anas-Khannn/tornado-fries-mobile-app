import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../core/theme.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: cart.items.isEmpty
          ? _buildEmptyCart(context)
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items.values.toList()[index];
                      return _buildCartItem(context, cart, item);
                    },
                  ),
                ),
                _buildSummary(context, cart),
              ],
            ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket_outlined, size: 100, color: Colors.white24),
          const SizedBox(height: 24),
          const Text(
            'Your cart is empty',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add some delicious Tornado Fries to get started!',
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('START SHOPPING'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartController cart, dynamic item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: TornadoTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.fastfood, color: TornadoTheme.primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rs. ${item.product.price}',
                  style: const TextStyle(color: TornadoTheme.primaryColor),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => cart.decrementItem(item.product.id),
                icon: const Icon(Icons.remove_circle_outline, color: Colors.white54),
              ),
              Text(
                '${item.quantity}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => cart.addItem(item.product),
                icon: const Icon(Icons.add_circle_outline, color: TornadoTheme.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(BuildContext context, CartController cart) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: TornadoTheme.surfaceColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal', style: TextStyle(color: Colors.white54)),
              Text('Rs. ${cart.totalAmount}', style: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee', style: TextStyle(color: Colors.white54)),
              Text('Rs. 150', style: TextStyle(color: Colors.white)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.white10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rs. ${cart.totalAmount + 150}',
                style: const TextStyle(
                  color: TornadoTheme.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CheckoutScreen()),
                );
              },
              child: const Text('PROCEED TO CHECKOUT'),
            ),
          ),
        ],
      ),
    );
  }
}
