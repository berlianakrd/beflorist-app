import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/beflorist_drawer.dart';

class AccountPage extends StatelessWidget {
  final User currentUser;

  const AccountPage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BefloristDrawer(
        selectedIndex: 5,
        onItemSelected: (_) {},
        currentUser: currentUser,
      ),
      appBar: AppBar(
        title: const Text("Akun Saya"),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(radius: 50, backgroundImage: AssetImage("assets/images/profile.png")),
                const SizedBox(height: 12),
                Text(currentUser.username, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                currentUser.email.isEmpty ? "Email belum diatur" : currentUser.email,
                style: const TextStyle(color: Colors.grey),
              ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.pink),
            title: const Text("Edit Profil"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: navigasi ke halaman edit profile
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.pink),
            title: const Text("Ubah Password"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.pink),
            title: const Text("Riwayat Pesanan"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.pink),
            title: const Text("Keluar"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // TODO: lakukan logout
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
