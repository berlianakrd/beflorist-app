import 'package:flutter/material.dart';
import '../../models/user.dart';

class BouquetPage extends StatefulWidget {
  final User currentUser;

  const BouquetPage({
    super.key,
    required this.currentUser,
  });

  @override
  State<BouquetPage> createState() => _BouquetPageState();
}

class _BouquetPageState extends State<BouquetPage> {
  final List<Map<String, String>> products = [
{
    "name": "Bouquet Coklat",
    "price": "Rp 180.000",
    "image": "assets/images/bouquet_coklat.png",
    "stock": "Tersedia: 8 pcs",
    "description": "Bouquet unik berisi coklat premium yang cantik dikemas, cocok untuk hadiah manis."
  },
  {
    "name": "Bouquet Artificial Flowers",
    "price": "Rp 200.000",
    "image": "assets/images/bouquet_artifical_flowers.png",
    "stock": "Tersedia: 12 pcs",
    "description": "Bouquet bunga artificial yang awet dan cantik, cocok untuk dekorasi dan hadiah jangka panjang."
  },
  {
    "name": "Bouquet Dried Flowers",
    "price": "Rp 120.000",
    "image": "assets/images/bouquet_dried_flowers.png",
    "stock": "Tersedia: 15 pcs",
    "description": "Bouquet bunga kering cantik yang tahan lama, ideal untuk dekorasi rumah atau hadiah."
  },
  {
    "name": "Bouquet Fresh Flowers",
    "price": "Rp 250.000",
    "image": "assets/images/bouquet_fresh_flowers.png",
    "stock": "Tersedia: 5 pcs",
    "description": "Bouquet bunga segar pilihan, cocok untuk ucapan selamat, ulang tahun, atau Valentine."
  },
  {
    "name": "Bouquet Custom",
    "price": "Rp 120.000",
    "image": "assets/images/bouquet_custom.png",
    "stock": "Tersedia: 15 pcs",
    "description": "Bouquet yang bisa dikustom sesuai permintaan, gabungan bunga dan aksesoris favorit."
  },
  {
    "name": "Bouquet Graduation",
    "price": "Rp 250.000",
    "image": "assets/images/bouquet_graduation.png",
    "stock": "Tersedia: 5 pcs",
    "description": "Bouquet spesial untuk wisuda, kombinasi bunga cerah dan dekorasi ucapan selamat."
  },
  {
    "name": "Bouquet Money",
    "price": "Rp 120.000",
    "image": "assets/images/bouquet_money.png",
    "stock": "Tersedia: 15 pcs",
    "description": "Bouquet kreatif berisi uang atau voucher, hadiah unik untuk teman atau keluarga."
  },
  {
    "name": "Bouquet Snack",
    "price": "Rp 250.000",
    "image": "assets/images/bouquet_snack.png",
    "stock": "Tersedia: 5 pcs",
    "description": "Bouquet lucu berisi snack dan kue kecil, cocok untuk anak-anak atau hadiah ringan."
  },
  {
    "name": "Bouquet Wedding",
    "price": "Rp 120.000",
    "image": "assets/images/bouquet_wedding.png",
    "stock": "Tersedia: 15 pcs",
    "description": "Bouquet cantik untuk pernikahan, kombinasi bunga segar dan dekorasi elegan."
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
          'Bouquet',
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
