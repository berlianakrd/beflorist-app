import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class CartService {
  static const String cartKey = "cart_items";

  // Simpan produk (replace semua cart sekaligus)
  static Future<void> saveCart(List<Map<String, dynamic>> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    String cartJson = jsonEncode(cartItems);
    await prefs.setString(cartKey, cartJson);
  }

  // Ambil produk
  static Future<List<Map<String, dynamic>>> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    String? cartJson = prefs.getString(cartKey);
    if (cartJson != null) {
      List decoded = jsonDecode(cartJson);
      return decoded.map((e) => Map<String, dynamic>.from(e)).toList();
    }
    return [];
  }

  // Tambah produk (bisa Map atau Product)
  static Future<void> addToCart(dynamic product) async {
    final cartItems = await getCart();

    if (product is Product) {
      cartItems.add({
        'name': product.name,
        'price': product.price,
        'stock': product.stock,
        'image': product.image,
      });
    } else if (product is Map<String, dynamic>) {
      cartItems.add(product);
    }

    await saveCart(cartItems);
  }

  // Hapus produk berdasarkan index
  static Future<void> removeFromCart(int index) async {
    final cartItems = await getCart();
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
      await saveCart(cartItems);
    }
  }

  // Hapus semua produk
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartKey);
  }
}
