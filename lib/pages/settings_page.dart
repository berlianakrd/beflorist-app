import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan"),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          // Ubah Tema
          SwitchListTile(
            title: const Text("Mode Gelap"),
            subtitle: const Text("Aktifkan / Nonaktifkan tema gelap"),
            secondary: const Icon(Icons.dark_mode),
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
              // TODO: integrasi dengan theme global app
            },
          ),

          const Divider(),

          // Notifikasi
          SwitchListTile(
            title: const Text("Notifikasi"),
            subtitle: const Text("Aktifkan / Nonaktifkan notifikasi"),
            secondary: const Icon(Icons.notifications),
            value: _isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                _isNotificationEnabled = value;
              });
            },
          ),

          const Divider(),

          // Tentang Aplikasi
          ListTile(
            leading: const Icon(Icons.info, color: Colors.blue),
            title: const Text("Tentang Aplikasi"),
            subtitle: const Text("Informasi singkat aplikasi Beflorist"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Beflorist",
                applicationVersion: "1.0.0",
                applicationIcon: const Icon(Icons.local_florist),
                children: [
                  const Text(
                    "Beflorist adalah aplikasi toko bunga online untuk memesan bunga, gift box, dan hampers dengan mudah.",
                  ),
                ],
              );
            },
          ),

          const Divider(),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () {
              // TODO: sambungkan dengan sistem login
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Berhasil logout")),
              );
            },
          ),
        ],
      ),
    );
  }
}
