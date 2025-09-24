import 'package:flutter/material.dart';
import '../../models/user.dart';

class PapanBungaPage extends StatefulWidget {
  final User currentUser;

  const PapanBungaPage({
    super.key,
    required this.currentUser,
  });

  @override
  State<PapanBungaPage> createState() => _PapanBungaPageState();
}

class _PapanBungaPageState extends State<PapanBungaPage> {
  final List<Map<String, String>> products = [
    {
      "name": "Papan Bunga Ucapan Selamat",
      "price": "Rp 500.000",
      "image": "assets/images/papan_bunga_selamat.png",
      "stock": "Tersedia: 5 pcs",
      "description": "Papan bunga dengan ucapan selamat, cocok untuk perayaan atau opening."
    },
    {
      "name": "Papan Bunga Duka Cita",
      "price": "Rp 450.000",
      "image": "assets/images/papan_bunga_duka.png",
      "stock": "Tersedia: 3 pcs",
      "description": "Papan bunga untuk duka cita, dihias elegan dengan bunga segar."
    },
    {
      "name": "Papan Bunga Anniversary",
      "price": "Rp 600.000",
      "image": "assets/images/papan_bunga_anniversary.png",
      "stock": "Tersedia: 4 pcs",
      "description": "Papan bunga untuk ulang tahun pernikahan atau anniversary, lengkap dengan dekorasi cantik."
    },
    {
      "name": "Papan Bunga Hari Raya",
      "price": "Rp 550.000",
      "image": "assets/images/papan_bunga_hariraya.png",
      "stock": "Tersedia: 6 pcs",
      "description": "Papan bunga spesial untuk Hari Raya, dihias dengan bunga dan ornamen warna-warni."
    },
    {
      "name": "Papan Bunga Pernikahan",
      "price": "Rp 700.000",
      "image": "assets/images/papan_bunga_pernikahan.png",
      "stock": "Tersedia: 2 pcs",
      "description": "Papan bunga mewah untuk pernikahan, bunga segar dan dekorasi elegan."
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
          'Papan Bunga',
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
                      product['image'] ?? "assets/images/placeholder.png",
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
                  product['image'] ?? "assets/images/placeholder.png",
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
