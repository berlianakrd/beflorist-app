// lib/pages/produk_page.dart
import 'package:flutter/material.dart';
import '../widgets/beflorist_drawer.dart';
import '../models/user.dart';

import 'subcategories/fresh_flowers_page.dart';
import 'subcategories/artificial_flowers_page.dart';
import 'subcategories/bouquet_page.dart';
import 'subcategories/hampers_page.dart';
import 'subcategories/papan_bunga_page.dart';
import 'subcategories/giftbox_page.dart';
import 'subcategories/aksesoris_page.dart';

import 'home_sections/promo_page.dart';
import 'home_sections/produk_terbaru_page.dart';
import 'home_sections/best_seller_page.dart';
import 'home_sections/testimoni_page.dart';

class ProdukPage extends StatefulWidget {
  final User currentUser;

  const ProdukPage({super.key, required this.currentUser});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> allProduk = [
    "Fresh Flowers",
    "Artificial Flowers",
    "Bouquet",
    "Hampers",
    "Papan Bunga",
    "Gift Box",
    "Aksesoris",
    // ✅ Tambahan kategori baru
    "Promo & Diskon",
    "Produk Terbaru",
    "Best Seller",
    "Testimoni",
  ];

  List<String> filteredProduk = [];
  int? _pressedIndex;

  @override
  void initState() {
    super.initState();
    filteredProduk = List.from(allProduk);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterProduk(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProduk = List.from(allProduk);
      } else {
        filteredProduk = allProduk
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // ✅ Fungsi mapping kategori → halaman
  Widget _getPage(String name) {
    switch (name) {
      case "Fresh Flowers":
        return FreshFlowersPage(currentUser: widget.currentUser);
      case "Artificial Flowers":
        return ArtificialFlowersPage(currentUser: widget.currentUser);
      case "Bouquet":
        return BouquetPage(currentUser: widget.currentUser);
      case "Hampers":
        return HampersPage(currentUser: widget.currentUser);
      case "Papan Bunga":
        return PapanBungaPage(currentUser: widget.currentUser);
      case "Gift Box":
        return GiftBoxPage(currentUser: widget.currentUser);
      case "Aksesoris":
        return AksesorisPage(currentUser: widget.currentUser);

      // ✅ Tambahan mapping kategori baru
      case "Promo & Diskon":
        return PromoPage(currentUser: widget.currentUser);
      case "Produk Terbaru":
        return ProdukTerbaruPage(currentUser: widget.currentUser);
      case "Best Seller":
        return BestSellerPage(currentUser: widget.currentUser);
      case "Testimoni":
        return TestimoniPage(currentUser: widget.currentUser);

      default:
        return FreshFlowersPage(currentUser: widget.currentUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Produk Beflorist",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 182, 193, 1),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: BefloristDrawer(
        selectedIndex: 1,
        onItemSelected: (_) {},
        currentUser: widget.currentUser,
      ),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/dashboard_bg.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Konten
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Search Bar
                Center(
                  child: Container(
                    width: screenWidth * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterProduk,
                      decoration: const InputDecoration(
                        hintText: "Cari produk...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromRGBO(255, 182, 193, 1),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // List Produk
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredProduk.length,
                    itemBuilder: (context, index) {
                      final name = filteredProduk[index];
                      final isPressed = _pressedIndex == index;

                      return GestureDetector(
                        onTapDown: (_) {
                          setState(() => _pressedIndex = index);
                        },
                        onTapUp: (_) {
                          Future.delayed(const Duration(milliseconds: 150), () {
                            setState(() => _pressedIndex = null);
                          });
                        },
                        onTapCancel: () {
                          setState(() => _pressedIndex = null);
                        },
                        child: AnimatedScale(
                          scale: isPressed ? 0.97 : 1.0,
                          duration: const Duration(milliseconds: 150),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            color: const Color.fromRGBO(255, 182, 193, 1),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Text(
                                name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios,
                                  color: Colors.white, size: 18),
                              onTap: () {
                                // ✅ Arahkan ke subkategori sesuai
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => _getPage(name),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
