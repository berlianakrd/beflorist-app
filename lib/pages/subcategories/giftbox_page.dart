import 'package:flutter/material.dart';
import '../../models/user.dart';

class GiftBoxPage extends StatefulWidget {
  final User currentUser;

  const GiftBoxPage({
    super.key,
    required this.currentUser,
  });

  @override
  State<GiftBoxPage> createState() => _GiftBoxPageState();
}

class _GiftBoxPageState extends State<GiftBoxPage> {
  final List<Map<String, String>> products = [
    {
      "name": "GiftBox Mawar Merah",
      "price": "Rp 75.000",
      "image": "assets/images/giftbox_mawar_merah.png",
      "stock": "Tersedia: 10 pcs",
      "description": "GiftBox berisi mawar merah segar, cocok untuk hadiah spesial."
    },
    {
      "name": "GiftBox Lily Putih",
      "price": "Rp 100.000",
      "image": "assets/images/giftbox_lily_putih.png",
      "stock": "Tersedia: 8 pcs",
      "description": "GiftBox elegan berisi lily putih, cocok untuk momen istimewa."
    },
    {
      "name": "GiftBox Mix",
      "price": "Rp 120.000",
      "image": "assets/images/giftbox_mix.png",
      "stock": "Tersedia: 5 pcs",
      "description": "GiftBox berisi berbagai bunga segar dan aksesoris cantik."
    },
    {
      "name": "GiftBox Coklat",
      "price": "Rp 120.000",
      "image": "assets/images/giftbox_coklat.png",
      "stock": "Tersedia: 10 pcs",
      "description": "GiftBox berisi aneka coklat premium, cocok untuk hadiah spesial."
    },
    {
      "name": "GiftBox Cookies & Brownies",
      "price": "Rp 150.000",
      "image": "assets/images/giftbox_cookies_brownies.png",
      "stock": "Tersedia: 8 pcs",
      "description": "GiftBox berisi cookies dan brownies lezat, dikemas cantik."
    },
    {
      "name": "GiftBox Mini Snack",
      "price": "Rp 75.000",
      "image": "assets/images/giftbox_mini_snack.png",
      "stock": "Tersedia: 15 pcs",
      "description": "GiftBox mini berisi snack favorit, cocok untuk teman atau kerabat."
    },
    {
      "name": "GiftBox Valentine",
      "price": "Rp 180.000",
      "image": "assets/images/giftbox_valentine.png",
      "stock": "Tersedia: 7 pcs",
      "description": "GiftBox spesial Valentine, berisi coklat dan bunga mini, cocok untuk pasangan."
    },
    {
      "name": "GiftBox Mini",
      "price": "Rp 50.000",
      "image": "assets/images/giftbox_mini.png",
      "stock": "Tersedia: 12 pcs",
      "description": "GiftBox mini cocok untuk hadiah kecil atau suvenir."
    },
    {
      "name": "GiftBox Eksklusif",
      "price": "Rp 200.000",
      "image": "assets/images/giftbox_eksklusif.png",
      "stock": "Tersedia: 3 pcs",
      "description": "GiftBox eksklusif dengan bunga premium dan dekorasi mewah."
    },
  ];

  void _addToCart(Map<String, String> product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${product['name']} ditambahkan ke keranjang 🛒"),
        backgroundColor: Colors.pink[300],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Text(
          'GiftBox',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _buildGrid(),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildCard(product);
      },
    );
  }

  Widget _buildCard(Map<String, String> product) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      product['image'] ?? "assets/images/beflorist.png",
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product['name'] ?? "Produk Tanpa Nama",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['price'] ?? "-",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product['stock'] ?? "Stok belum tersedia",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['description'] ?? "Deskripsi belum tersedia",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.touch_app, size: 32, color: Colors.pink),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[300],
                          minimumSize: const Size(200, 50),
                        ),
                        onPressed: () {
                          _addToCart(product);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text("Tambah ke Keranjang"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  product['image'] ?? "assets/images/beflorist.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product['name'] ?? "Produk Tanpa Nama",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                product['price'] ?? "-",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.pink),
                  onPressed: () => _addToCart(product),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
