import 'package:flutter/material.dart';
import '../widgets/beflorist_drawer.dart';
import '../models/user.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class CartPage extends StatefulWidget {
  final User currentUser;

  const CartPage({super.key, required this.currentUser});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> cartItems = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  Future<void> _loadCart() async {
    setState(() => _loading = true);
    final saved = await CartService.getCart(); // List<Map<String, dynamic>>
    cartItems = saved.map((item) {
      // robust parsing price (handle int or "Rp 15.000")
      final rawPrice = item['price'];
      int priceInt = 0;
      if (rawPrice is int) {
        priceInt = rawPrice;
      } else if (rawPrice is String) {
        priceInt = int.tryParse(rawPrice.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      }
      final stockRaw = item['stock'];
      int stockInt = 0;
      if (stockRaw is int) stockInt = stockRaw;
      else if (stockRaw is String) {
        stockInt = int.tryParse(stockRaw.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      }
      return Product(
        name: item['name'] ?? '',
        price: priceInt,
        image: item['image'] ?? 'assets/images/beflorist.png',
        stock: stockInt,
      );
    }).toList();
    setState(() => _loading = false);
  }

  Future<void> _clearCart() async {
    await CartService.clearCart();
    setState(() {
      cartItems.clear();
    });
  }

  Future<void> _removeAt(int index) async {
    setState(() {
      cartItems.removeAt(index);
    });
    // sync CartService (clear + re-add)
    await CartService.clearCart();
    for (final p in cartItems) {
      await CartService.addToCart(p);
    }
  }

  int get totalPrice => cartItems.fold(0, (s, p) => s + (p.price));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BefloristDrawer(
        selectedIndex: 2, // misal posisi Order
        onItemSelected: (_) {},
        currentUser: widget.currentUser,
      ),
      appBar: AppBar(
        title: const Text("Keranjang"),
        backgroundColor: const Color.fromRGBO(255, 182, 193, 1),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: cartItems.isEmpty
                ? null
                : () async {
                    final ok = await showDialog<bool>(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: const Text("Kosongkan Keranjang?"),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(c, false), child: const Text("Batal")),
                          TextButton(onPressed: () => Navigator.pop(c, true), child: const Text("Ya")),
                        ],
                      ),
                    );
                    if (ok == true) await _clearCart();
                  },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : cartItems.isEmpty
                ? const Center(
                    child: Text("Keranjang masih kosong", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  )
                : Column(
                    children: [
                      Card(
                        color: const Color.fromRGBO(255, 182, 193, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total Harga", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                              Text("Rp ${totalPrice.toString()}", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final p = cartItems[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(p.image, width: 56, height: 56, fit: BoxFit.cover)),
                                title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text("Stok: ${p.stock}"),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Rp ${p.price}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                      onPressed: () => _removeAt(index),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
