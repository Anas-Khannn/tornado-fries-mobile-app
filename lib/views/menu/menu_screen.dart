import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../models/cart_models.dart';
import '../../core/theme.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _categories = [
    'Burgers',
    'Fries',
    'Shawarma',
    'Wraps',
    'Ice Cream',
    'Dips'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: TornadoTheme.primaryColor,
          labelColor: TornadoTheme.primaryColor,
          unselectedLabelColor: Colors.white54,
          tabAlignment: TabAlignment.start,
          tabs: _categories.map((cat) => Tab(text: cat)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _categories.map((cat) => _CategoryListView(category: cat)).toList(),
      ),
    );
  }
}

class _CategoryListView extends StatelessWidget {
  final String category;
  const _CategoryListView({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10, // Mock count
      itemBuilder: (context, index) {
        return _buildMenuItem(
          context,
          '$category Item ${index + 1}',
          'Crispy, delicious $category with our secret Tornado spices.',
          'Rs. ${400 + (index * 50)}',
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String desc, String price) {
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
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.restaurant, color: TornadoTheme.primaryColor, size: 40),
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
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(color: TornadoTheme.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              final product = Product(
                id: title, // Simplified ID for mock
                name: title,
                description: desc,
                price: double.parse(price.replaceAll('Rs. ', '')),
              );
              Provider.of<CartController>(context, listen: false).addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$title added to cart'),
                  duration: const Duration(seconds: 1),
                  backgroundColor: TornadoTheme.primaryColor,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.add_shopping_cart, color: TornadoTheme.primaryColor),
          ),
        ],
      ),
    );
  }
}
