import 'package:flutter/material.dart';
import '../../models/user.dart';

class HampersPage extends StatefulWidget {
  final User currentUser;

  const HampersPage({
    super.key,
    required this.currentUser,
  });

  @override
  State<HampersPage> createState() => _HampersPageState();
}

class _HampersPageState extends State<HampersPage> {
  final List<Map<String, String>> products = [
    {
      "name": "Hampers Coklat Premium",
      "price": "Rp 200.000",
      "image": "assets/images/hampers_coklat.png",
      "stock": "Tersedia: 10 pcs",
      "description": "Hampers berisi coklat premium dan snack lezat, cocok untuk hadiah spesial."
    },
    {
      "name": "Hampers Makanan Ringan",
      "price": "Rp 150.000",
      "image": "assets/images/hampers_snack.png",
      "stock": "Tersedia: 12 pcs",
      "description": "Hampers berisi snack favorit dan minuman ringan, dikemas cantik."
    },
    {
      "name": "Hampers Bunga & Coklat",
      "price": "Rp 250.000",
      "image": "assets/images/hampers_bunga_coklat.png",
      "stock": "Tersedia: 5 pcs",
      "description": "Hampers kombinasi bunga segar dan coklat premium, hadiah sempurna untuk pasangan."
    },
    {
      "name": "Hampers Mini",
      "price": "Rp 100.000",
      "image": "assets/images/hampers_mini.png",
      "stock": "Tersedia: 20 pcs",
      "description": "Hampers mini berisi snack dan aksesoris kecil, cocok untuk teman atau kerabat."
    },
    {
      "name": "Hampers Spesial Valentine",
      "price": "Rp 300.000",
      "image": "assets/images/hampers_valentine.png",
      "stock": "Tersedia: 3 pcs",
      "description": "Hampers Valentine berisi coklat, bunga mini, dan aksesoris romantis."
    },
    {
      "name": "Hampers Lebaran 1",
      "price": "Rp 250.000",
      "image": "assets/images/hampers_lebaran1.png",
      "stock": "Tersedia: 8 pcs",
      "description": "Hampers Hari Raya berisi kue kering, coklat, dan kurma."
    },
    {
      "name": "Hampers Lebaran 2",
      "price": "Rp 300.000",
      "image": "assets/images/hampers_lebaran2.png",
      "stock": "Tersedia: 5 pcs",
      "description": "Hampers mewah berisi parcel makanan ringan dan minuman kemasan."
    },
    {
      "name": "Hampers Idul Fitri",
      "price": "Rp 200.000",
      "image": "assets/images/hampers_idulfitri.png",
      "stock": "Tersedia: 12 pcs",
      "description": "Hampers khusus Idul Fitri dengan kombinasi snack, kue kering, dan coklat."
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
          'Hampers',
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
