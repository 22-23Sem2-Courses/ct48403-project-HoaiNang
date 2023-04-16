import '../../models/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'p1',
        name: 'Iced Cocoa',
        price: 5.00,
        imgUrl: 'assets/product/1.png',
        desc: 'San pham nay ngon !!!'),
    Product(
        id: 'p2',
        name: 'Iced Milk Cocoa',
        price: 6.00,
        imgUrl: 'assets/product/2.jpg',
        desc: 'San pham nay ngon !!!'),
    Product(
        id: 'p3',
        name: 'Iced Coffee Three Layer',
        price: 7.00,
        imgUrl: 'assets/product/3.jpg',
        desc: 'San pham nay ngon !!!'),
    Product(
      id: 'p4',
      name: 'Iced Coffee',
      price: 2.00,
      imgUrl: 'assets/product/4.png',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
        id: 'p5',
        name: 'Iced Milk Coffee',
        price: 6.80,
        imgUrl: 'assets/product/5.jpg',
        desc: 'San pham nay ngon !!!'),
    Product(
      id: 'p6',
      name: 'Iced Fresh Milk Coffee',
      price: 6.80,
      imgUrl: 'assets/product/6.jpg',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p7',
      name: 'Passion Fruit',
      price: 5.00,
      imgUrl: 'assets/product/7.jpg',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p8',
      name: 'Coconut Water',
      price: 6.50,
      imgUrl: 'assets/product/8.jpg',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p9',
      name: 'Lipton',
      price: 6.80,
      imgUrl: 'assets/product/9.jpg',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p10',
      name: 'Light Coffee',
      price: 5.00,
      imgUrl: 'assets/product/10.jpg',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p11',
      name: 'Fight Milo',
      price: 5.50,
      imgUrl: 'assets/product/11.jpg',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p12',
      name: 'Iced Fresh Water',
      price: 4.30,
      imgUrl: 'assets/product/12.jpg',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p13',
      name: 'Orange Juice',
      price: 2.80,
      imgUrl: 'assets/product/13.jpg',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p14',
      name: 'Iced Pennywort',
      price: 3.80,
      imgUrl: 'assets/product/14.png',
      desc: 'San pham nay ngon !!!',
    ),
    Product(
      id: 'p15',
      name: 'Peach Tea',
      price: 4.80,
      imgUrl: 'assets/product/15.jpg',
      desc: 'San pham nay ngon !!!',
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