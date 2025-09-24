import 'package:flutter/material.dart';
import '../../models/user.dart';

class FreshFlowersPage extends StatefulWidget {
  final User currentUser;

  const FreshFlowersPage({
    super.key,
    required this.currentUser,
  });

  @override
  State<FreshFlowersPage> createState() => _FreshFlowersPageState();
}

class _FreshFlowersPageState extends State<FreshFlowersPage> {
  final List<Map<String, String>> products = [
    {
      "name": "Mawar Merah",
      "price": "Rp 15.000",
      "image": "assets/images/mawar_merah.png",
      "stock": "Tersedia: 20 pcs",
      "description": "Mawar merah segar, simbol cinta dan kasih sayang."
    },
    {
      "name": "Mawar Putih",
      "price": "Rp 18.000",
      "image": "assets/images/mawar_putih.png",
      "stock": "Tersedia: 15 pcs",
      "description": "Mawar putih melambangkan kesucian dan ketulusan hati."
    },
    {
      "name": "Mawar Pink",
      "price": "Rp 18.000",
      "image": "assets/images/mawar_pink.png",
      "stock": "Tersedia: 10 pcs",
      "description": "Mawar pink manis, simbol kelembutan dan kehangatan perasaan."
    },
    {
      "name": "Mawar Biru",
      "price": "Rp 20.000",
      "image": "assets/images/mawar_biru.png",
      "stock": "Tersedia: 5 pcs",
      "description": "Mawar biru langka, simbol misteri dan keajaiban."
    },
    {
      "name": "Lily Putih",
      "price": "Rp 25.000",
      "image": "assets/images/lily_putih.png",
      "stock": "Tersedia: 12 pcs",
      "description": "Lily putih elegan, cocok untuk dekorasi atau hadiah istimewa."
    },
    {
      "name": "Lily Pink",
      "price": "Rp 27.000",
      "image": "assets/images/lily_pink.png",
      "stock": "Tersedia: 8 pcs",
      "description": "Lily pink cantik, menambah kesan manis dan lembut."
    },
    {
      "name": "Tulip Merah",
      "price": "Rp 25.000",
      "image": "assets/images/tulip_merah.png",
      "stock": "Tersedia: 18 pcs",
      "description": "Tulip merah segar, melambangkan cinta sejati."
    },
    {
      "name": "Krisan Putih",
      "price": "Rp 10.000",
      "image": "assets/images/krisan_putih.png",
      "stock": "Tersedia: 25 pcs",
      "description": "Krisan putih, simbol ketulusan dan keindahan alami."
    },
    {
      "name": "Krisan Kuning",
      "price": "Rp 10.000",
      "image": "assets/images/krisan_kuning.png",
      "stock": "Tersedia: 20 pcs",
      "description": "Krisan kuning ceria, menambah keceriaan di ruangan."
    },
    {
      "name": "Krisan Pink",
      "price": "Rp 10.000",
      "image": "assets/images/krisan_pink.png",
      "stock": "Tersedia: 15 pcs",
      "description": "Krisan pink lembut, simbol kelembutan dan kasih sayang."
    },
    {
      "name": "Anyelir",
      "price": "Rp 10.000 – Rp 20.000",
      "image": "assets/images/anyelir.jpg",
      "stock": "Tersedia: 30 pcs",
      "description": "Anyelir berwarna-warni, cocok untuk buket atau dekorasi cantik."
    },
    {
      "name": "Gerbera",
      "price": "Rp 7.000 – Rp 15.000",
      "image": "assets/images/gerbera.jpg",
      "stock": "Tersedia: 40 pcs",
      "description": "Gerbera ceria, menambah keceriaan di setiap suasana."
    },
    {
      "name": "Baby’s Breath",
      "price": "Rp 50.000 – Rp 150.000 / ikat",
      "image": "assets/images/babys_breath.jpg",
      "stock": "Tersedia: 10 ikat",
      "description": "Baby’s Breath lembut, sering digunakan sebagai filler buket bunga."
    },
    {
      "name": "Anggrek",
      "price": "Rp 25.000 – Rp 300.000",
      "image": "assets/images/anggrek.jpg",
      "stock": "Tersedia: 8 pcs",
      "description": "Anggrek eksotis, bunga elegan untuk hadiah spesial."
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
          'Fresh Flowers',
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
        // Modal detail lengkap muncul
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
                  // Tambahkan ikon tangan di samping tombol
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
