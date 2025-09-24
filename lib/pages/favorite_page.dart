// lib/pages/favorite_page.dart
import 'package:flutter/material.dart';
import '../widgets/beflorist_drawer.dart';
import '../models/user.dart';

class FavoritePage extends StatelessWidget {
  final User currentUser; // ✅ pakai User object

  const FavoritePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Drawer pakai currentUser
      drawer: BefloristDrawer(
        selectedIndex: 3,
        onItemSelected: (_) {},
        currentUser: currentUser, // kirim User object
      ),

      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 182, 193, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Favorite dari: ${currentUser.username}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Text(
              "Daftar produk favorit akan ditampilkan di sini.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
