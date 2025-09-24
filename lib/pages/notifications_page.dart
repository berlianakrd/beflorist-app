import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(255, 182, 193, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text(
          "Belum ada notifikasi 📭",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
