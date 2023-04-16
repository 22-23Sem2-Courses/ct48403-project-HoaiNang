import '../../models/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'p1',
        name: 'coffee',
        price: 3.20,
        imgUrl: 'assets/mag4.png',
        desc: 'San pham nay ngon !!!'),
    Product(
        id: 'p2',
        name: 'tea',
        price: 1.20,
        imgUrl: 'assets/mag4.png',
        desc: 'San pham nay ngon !!!'),
    Product(
        id: 'p3',
        name: 'milk coffee',
        price: 6.80,
        imgUrl: 'assets/mag4.png',
        desc: 'San pham nay ngon !!!'),
    Product(
      id: 'p4',
      name: 'development',
      price: 15.00,
      imgUrl: 'assets/mag4.png',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
        id: 'p5',
        name: 'Iced Milk Coffee',
        price: 6.80,
        imgUrl: 'assets/mag4.png',
        desc: 'San pham nay ngon !!!'),
    Product(
      id: 'p6',
      name: 'Iced Fresh Milk Coffee',
      price: 6.80,
      imgUrl: 'assets/mag4.png',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
        id: 'p3',
        name: 'milk coffee',
        price: 6.80,
        imgUrl: 'assets/mag4.png',
        desc: 'San pham nay ngon !!!'),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  void addProduct(Product product) {
    _items.add(
      // ignore: unnecessary_string_interpolations
      product.copyWith(id: 'p${DateTime.now().toIso8601String()}'),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    _items[index] = product;
    notifyListeners();
  }

  void deleteProduct(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    _items.removeAt(index);
    notifyListeners();
  }
}
