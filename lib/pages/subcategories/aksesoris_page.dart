import 'package:flutter/material.dart';
import '../../models/user.dart';

class AksesorisPage extends StatefulWidget {
  final User currentUser;

  const AksesorisPage({
    super.key,
    required this.currentUser,
  });

  @override
  State<AksesorisPage> createState() => _AksesorisPageState();
}

class _AksesorisPageState extends State<AksesorisPage> {
  // Daftar produk aksesoris lengkap
  final List<Map<String, String>> products = [
    {
      "name": "Vase Kaca",
      "price": "Rp 50.000",
      "image": "assets/images/vase_kaca.png",
      "stock": "Tersedia: 15 pcs",
      "description": "Vase kaca elegan, cocok untuk menampilkan buket bunga favoritmu."
    },
    {
      "name": "Pita Hias",
      "price": "Rp 10.000",
      "image": "assets/images/pita_hias.png",
      "stock": "Tersedia: 50 pcs",
      "description": "Pita hias cantik untuk membungkus buket atau hampers."
    },
    {
      "name": "Dekorasi Kertas",
      "price": "Rp 5.000",
      "image": "assets/images/dekorasi_kertas.png",
      "stock": "Tersedia: 100 pcs",
      "description": "Dekorasi kertas warna-warni, mempercantik buket bunga."
    },
    {
      "name": "Kotak Hadiah",
      "price": "Rp 30.000",
      "image": "assets/images/kotak_hadiah.png",
      "stock": "Tersedia: 25 pcs",
      "description": "Kotak hadiah berkualitas, siap untuk menyimpan buket atau aksesoris."
    },
    {
      "name": "Ribbon Satin",
      "price": "Rp 15.000",
      "image": "assets/images/ribbon_satin.png",
      "stock": "Tersedia: 40 pcs",
      "description": "Ribbon satin lembut, menambah kesan elegan pada dekorasi bunga."
    },
    {
      "name": "Bunga Kering Mini",
      "price": "Rp 12.000",
      "image": "assets/images/bunga_kering_mini.png",
      "stock": "Tersedia: 60 pcs",
      "description": "Bunga kering mini cantik, bisa dijadikan dekorasi meja atau hiasan dinding."
    },
    {
      "name": "Keranjang Rotan",
      "price": "Rp 35.000",
      "image": "assets/images/keranjang_rotan.png",
      "stock": "Tersedia: 20 pcs",
      "description": "Keranjang rotan serbaguna, cocok untuk menyimpan bunga atau hadiah."
    },
    {
      "name": "Gunting Bunga",
      "price": "Rp 25.000",
      "image": "assets/images/gunting_bunga.png",
      "stock": "Tersedia: 30 pcs",
      "description": "Gunting bunga berkualitas, memudahkan merapikan bunga."
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
          'Aksesoris',
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
        // Modal detail muncul saat card ditekan
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
