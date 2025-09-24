import 'package:flutter/material.dart';
import '../../models/user.dart';

class ProdukTerbaruPage extends StatelessWidget {
  final User currentUser;

  const ProdukTerbaruPage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produk Terbaru"),
        backgroundColor: const Color.fromRGBO(255, 182, 193, 1),
      ),
      body: const Center(
        child: Text(
          "Halaman Produk Terbaru",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
