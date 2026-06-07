import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../models/cart_models.dart';
import '../../core/theme.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exclusive Combo Deals', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildComboCard(
            context,
            'Super Tornado Feast',
            '2 Tornado Fries + 1 Classic Burger + 2 Drinks',
            'Rs. 1450',
            'Rs. 2100',
            Colors.orangeAccent,
          ),
          _buildComboCard(
            context,
            'Wrappin\' Joy Deal',
            '2 Chicken Wraps + 1 Fries Basket + 1.5L Coke',
            'Rs. 1850',
            'Rs. 2400',
            Colors.yellowAccent,
          ),
          _buildComboCard(
            context,
            'Corndog Carnival',
            '3 Cheese Corndogs + 2 Dips + 2 Small Fries',
            'Rs. 1100',
            'Rs. 1650',
            Colors.redAccent,
          ),
          _buildComboCard(
            context,
            'Sweet & Salty Mix',
            '1 Large Fries + 1 Ice Cream Cone + 1 Drink',
            'Rs. 650',
            'Rs. 950',
            Colors.blueAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildComboCard(
    BuildContext context,
    String title,
    String items,
    String discountPrice,
    String originalPrice,
    Color accentColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: TornadoTheme.surfaceColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accentColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accentColor.withOpacity(0.1), accentColor.withOpacity(0.4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: const Center(
                  child: Icon(Icons.fastfood, size: 60, color: Colors.white24),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Best Value',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  items,
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          originalPrice,
                          style: const TextStyle(
                            color: Colors.white24,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          discountPrice,
                          style: const TextStyle(
                            color: TornadoTheme.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final product = Product(
                          id: title,
                          name: title,
                          description: items,
                          price: double.parse(discountPrice.replaceAll('Rs. ', '')),
                          isDeal: true,
                        );
                        Provider.of<CartController>(context, listen: false).addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$title added to cart'),
                            backgroundColor: TornadoTheme.primaryColor,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text('Add Deal'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
