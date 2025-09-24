import 'product.dart';

class Cart {
  static final List<Product> items = [];

  static void add(Product product) {
    items.add(product);
  }

  static void remove(Product product) {
    items.remove(product);
  }

  static void clear() {
    items.clear();
  }
}
