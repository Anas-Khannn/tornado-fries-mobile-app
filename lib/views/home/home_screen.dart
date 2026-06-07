import 'package:flutter/material.dart';
import '../../core/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deliver to',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            Row(
              children: [
                Text(
                  'Your Location, City',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_down, color: TornadoTheme.primaryColor, size: 18),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search your favorite fries...',
                  filled: true,
                  fillColor: TornadoTheme.surfaceColor,
                  prefixIcon: const Icon(Icons.search, color: TornadoTheme.primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Featured Deal Banner
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: PageView(
                children: [
                  _buildBanner(
                    'Get 50% OFF',
                    'On your first Tornado Fries order!',
                    'ORDER NOW',
                    Colors.orange,
                  ),
                  _buildBanner(
                    'Burger Combo',
                    'Try our new XL Chicken Burger Deal',
                    'VIEW DEAL',
                    Colors.deepPurple,
                  ),
                ],
              ),
            ),

            // Categories Section
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Text(
                'Explore Menu',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildCategoryItem('Burgers', Icons.lunch_dining),
                  _buildCategoryItem('Fries', Icons.waves),
                  _buildCategoryItem('Shawarma', Icons.stroller), // Close enough icon
                  _buildCategoryItem('Corndogs', Icons.settings_input_component),
                  _buildCategoryItem('Ice Cream', Icons.icecream),
                ],
              ),
            ),

            // Deals Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Deals & Offers',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All', style: TextStyle(color: TornadoTheme.primaryColor)),
                  ),
                ],
              ),
            ),
            _buildDealTile(
              'The Tornado Spark',
              'Burger + Small Fries + Drink',
              'Rs. 850',
              'Rs. 1200',
            ),
            _buildDealTile(
              'Family Twist',
              '2 Wraps + 2 Burgers + 2 Fries',
              'Rs. 2400',
              'Rs. 3200',
            ),
            const SizedBox(height: 100), // Bottom padding for FAB
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(String title, String subtitle, String btnText, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    btnText,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.flash_on, size: 80, color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: TornadoTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: TornadoTheme.primaryColor, size: 32),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildDealTile(String title, String desc, String price, String oldPrice) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TornadoTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
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
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(color: TornadoTheme.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      oldPrice,
                      style: const TextStyle(
                        color: Colors.white24,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle, color: TornadoTheme.primaryColor, size: 30),
          ),
        ],
      ),
    );
  }
}
