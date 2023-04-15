import '../../models/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'p1',
        name: 'coffee',
        price: 3.20,
        imgUrl: 'assets/product/1.png',
        desc: 'Sanr pham nay ngon !!!'),
    Product(
        id: 'p2',
        name: 'tea',
        price: 1.20,
        imgUrl: 'assets/product/2.jpg',
        desc: 'Sanr pham nay ngon !!!'),
    Product(
        id: 'p3',
        name: 'milk coffee',
        price: 6.80,
        imgUrl: 'assets/product/3.jpg',
        desc: 'Sanr pham nay ngon !!!'),
    Product(
      id: 'p4',
      name: 'development',
      price: 15.00,
      imgUrl: 'assets/product/4.png',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
        id: 'p5',
        name: 'milk coffee',
        price: 6.80,
        imgUrl: 'assets/product/5.jpg',
        desc: 'Sanr pham nay ngon !!!'),
    Product(
      id: 'p6',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/6.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p7',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/7.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p8',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/8.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p9',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/9.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p10',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/10.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p11',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/11.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p12',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/12.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p13',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/13.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p14',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/14.png',
      desc: 'Sanr pham nay ngon !!!',
    ),
    Product(
      id: 'p15',
      name: 'milk coffee',
      price: 6.80,
      imgUrl: 'assets/product/15.jpg',
      desc: 'Sanr pham nay ngon !!!',
    ),
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
