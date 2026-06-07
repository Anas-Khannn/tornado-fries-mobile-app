import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../navigation_hub.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              const SizedBox(height: 24),
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Start your delicious journey with us',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              const SizedBox(height: 32),
              _buildField(Icons.person_outline, 'Full Name'),
              const SizedBox(height: 16),
              _buildField(Icons.email_outlined, 'Email'),
              const SizedBox(height: 16),
              _buildField(Icons.phone_outlined, 'Phone Number'),
              const SizedBox(height: 16),
              _buildField(Icons.lock_outline, 'Password', obscure: true),
              const SizedBox(height: 16),
              _buildField(Icons.location_on_outlined, 'Delivery Address'),
              const SizedBox(height: 32),
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
                  child: const Text('SIGN UP'),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?", style: TextStyle(color: Colors.white70)),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: TornadoTheme.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(IconData icon, String hint, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: TornadoTheme.surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(icon, color: TornadoTheme.primaryColor),
      ),
    );
  }
}
