import 'package:flutter/material.dart';
import '../../models/user.dart';

class ArtificialFlowersPage extends StatefulWidget {
  final User currentUser;

  const ArtificialFlowersPage({
    super.key,
    required this.currentUser,
  });

  @override
  State<ArtificialFlowersPage> createState() => _ArtificialFlowersPageState();
}

class _ArtificialFlowersPageState extends State<ArtificialFlowersPage> {
  // Daftar produk artificial flowers
  final List<Map<String, String>> products = [
    {
      "name": "Mawar Artificial Merah",
      "price": "Rp 30.000",
      "image": "assets/images/artificial_mawar_merah.png",
      "stock": "Tersedia: 25 pcs",
      "description": "Mawar artificial merah cantik, awet dan cocok untuk dekorasi."
    },
    {
      "name": "Mawar Artificial Putih",
      "price": "Rp 35.000",
      "image": "assets/images/artificial_mawar_putih.png",
      "stock": "Tersedia: 20 pcs",
      "description": "Mawar artificial putih elegan, tidak perlu perawatan."
    },
    {
      "name": "Lily Artificial Putih",
      "price": "Rp 40.000",
      "image": "assets/images/artificial_lily_putih.png",
      "stock": "Tersedia: 15 pcs",
      "description": "Lily putih artificial cantik, tahan lama untuk hiasan rumah."
    },
    {
      "name": "Tulip Artificial Merah",
      "price": "Rp 38.000",
      "image": "assets/images/artificial_tulip_merah.png",
      "stock": "Tersedia: 18 pcs",
      "description": "Tulip merah artificial, cocok untuk buket atau dekorasi."
    },
    {
      "name": "Krisan Artificial Kuning",
      "price": "Rp 20.000",
      "image": "assets/images/artificial_krisan_kuning.png",
      "stock": "Tersedia: 30 pcs",
      "description": "Krisan kuning artificial ceria, awet dan mudah ditata."
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
          'Artificial Flowers',
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
