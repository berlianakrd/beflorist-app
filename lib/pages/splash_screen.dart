// lib/pages/splash_screen.dart
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'home_page.dart';
import '../models/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUserStr = prefs.getString('currentUser');

    // delay agar splash terlihat
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    if (currentUserStr != null && currentUserStr.isNotEmpty) {
      try {
        final decoded = jsonDecode(currentUserStr);
        if (decoded is Map<String, dynamic>) {
          final currentUser = User.fromJson(decoded);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(currentUser: currentUser),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        }
      } catch (e) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildStars() {
    final random = Random();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return List.generate(20, (index) {
      final left = random.nextDouble() * width;
      final top = random.nextDouble() * height;

      return Positioned(
        left: left,
        top: top,
        child: FadeTransition(
          opacity: Tween(begin: 0.3, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          ),
          child: const Icon(
            Icons.star,
            size: 10,
            color: Colors.white,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFDEE9), Color(0xFFFECDEB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ..._buildStars(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/beflorist_logo.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                "Beflorist Loading...",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 163, 122, 128),
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  color: Color.fromARGB(255, 163, 122, 128),
                  backgroundColor: Colors.white38,
                ),
              ),
            ],
          ),
          
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "by : berliana kurnia dewi",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
