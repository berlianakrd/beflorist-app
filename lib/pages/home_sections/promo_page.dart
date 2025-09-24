import 'package:flutter/material.dart';
import '../../models/user.dart';

class PromoPage extends StatelessWidget {
  final User currentUser;

  const PromoPage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> promos = [
      {
        "title": "Diskon 20% Fresh Flowers 🌹",
        "description": "Nikmati keindahan bunga segar dengan potongan harga spesial!",
        "image": "assets/images/promo_fresh_flowers.png"
      },
      {
        "title": "Gift Box Coklat + Bunga 🍫🌸",
        "description": "Paket spesial untuk hadiah romantis, hanya Rp 99.000!",
        "image": "assets/images/promo_giftbox.png"
      },
      {
        "title": "Hampers Lebaran 🎁",
        "description": "Lengkapi suasana hari raya dengan hampers cantik dari Beflorist.",
        "image": "assets/images/promo_hampers.png"
      },
      {
        "title": "Papan Bunga Diskon 15% 💐",
        "description": "Kirim ucapan selamat atau duka dengan papan bunga elegan.",
        "image": "assets/images/promo_papanbunga.png"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Promo Spesial",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: promos.length,
        itemBuilder: (context, index) {
          final promo = promos[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar promo
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    promo["image"] ?? "assets/images/beflorist.png",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promo["title"] ?? "Promo Tanpa Judul",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        promo["description"] ?? "-",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[300],
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${promo['title']} dipilih 🎉",
                                ),
                                backgroundColor: Colors.pink[300],
                              ),
                            );
                          },
                          icon: const Icon(Icons.local_offer),
                          label: const Text("Lihat Detail"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
