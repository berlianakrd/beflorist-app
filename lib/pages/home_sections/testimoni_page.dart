import 'package:flutter/material.dart';
import '../../models/user.dart';

class TestimoniPage extends StatelessWidget {
  final User currentUser;

  const TestimoniPage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testimoni"),
        backgroundColor: const Color.fromRGBO(255, 182, 193, 1),
      ),
      body: const Center(
        child: Text(
          "Halaman Testimoni",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
