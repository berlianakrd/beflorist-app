import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/user.dart';
import '../widgets/beflorist_drawer.dart';

class HelpPage extends StatelessWidget {
  final User currentUser;

  const HelpPage({super.key, required this.currentUser});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Tidak bisa membuka $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BefloristDrawer(
        selectedIndex: 6,
        onItemSelected: (_) {},
        currentUser: currentUser,
      ),
      appBar: AppBar(
        title: const Text("Bantuan"),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Butuh Bantuan? 🤝", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text(
            "Berikut beberapa pertanyaan umum dan cara menghubungi kami jika Anda membutuhkan bantuan lebih lanjut.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          const ExpansionTile(
            title: Text("Bagaimana cara memesan produk?"),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Pilih produk, klik tombol keranjang, lalu lanjutkan ke halaman Keranjang untuk pembayaran.",
                  style: TextStyle(color: Colors.black87),
                ),
              )
            ],
          ),
          const ExpansionTile(
            title: Text("Apakah bisa custom?"),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("Ya, hubungi admin via WhatsApp untuk request custom.", style: TextStyle(color: Colors.black87)),
              )
            ],
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.green),
            title: const Text("WhatsApp"),
            subtitle: const Text("+62 857-3880-6544"),
            onTap: () => _launchUrl("https://wa.me/6285738806544"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.pink),
            title: const Text("Email"),
            subtitle: const Text("beflorist@gmail.com"),
            onTap: () => _launchUrl("mailto:beflorist@gmail.com"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.public, color: Colors.blue),
            title: const Text("Instagram"),
            subtitle: const Text("@berlianakrd"),
            onTap: () => _launchUrl("https://www.instagram.com/berlianakrd"),
          ),
        ],
      ),
    );
  }
}
