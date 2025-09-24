import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        backgroundColor: const Color(0xFFFFC0CB),
      ),
      body: const Center(
        child: Text("Halaman Wishlist"),
      ),
    );
  }
}
