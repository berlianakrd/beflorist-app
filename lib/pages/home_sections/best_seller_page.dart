import 'package:flutter/material.dart';
import '../../models/user.dart';

class BestSellerPage extends StatelessWidget {
  final User currentUser;

  const BestSellerPage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Best Seller"),
        backgroundColor: const Color.fromRGBO(255, 182, 193, 1),
      ),
      body: const Center(
        child: Text(
          "Halaman Best Seller",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
