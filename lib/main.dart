import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'views/auth/login_screen.dart';

import 'package:provider/provider.dart';
import 'controllers/cart_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: const TornadoFriesApp(),
    ),
  );
}

class TornadoFriesApp extends StatelessWidget {
  const TornadoFriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tornado Fries',
      debugShowCheckedModeBanner: false,
      theme: TornadoTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate splash delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for logo
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: TornadoTheme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.bolt, size: 80, color: Colors.black),
            ),
            const SizedBox(height: 24),
            Text(
              'TORNADO FRIES',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Twist Your Taste!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white70,
                    letterSpacing: 1.2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderHomeScreen extends StatelessWidget {
  const PlaceholderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Coming Soon')),
    );
  }
}
