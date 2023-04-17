import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../models/bill_model.dart';

class BillManager with ChangeNotifier {
  final List<Bill> _items = [
    Bill(
      id: 'HD01',
      name: 'Iced Cocoa',
      SoLuong: 1,
      DonGia: 5.00,
      ThanhTien: 5.00,
    ),
    Bill(
      id: 'HD02',
      name: 'Iced Coffee Three Layer',
      SoLuong: 2,
      DonGia: 7.00,
      ThanhTien: 14.00,
    ),
    Bill(
      id: 'HD03',
      name: 'Iced Milk Cocoa',
      SoLuong: 3,
      DonGia: 6.00,
      ThanhTien: 18.00,
    ),
    Bill(
      id: 'HD04',
      name: 'Passion Fruit',
      SoLuong: 3,
      DonGia: 5.00,
      ThanhTien: 15.00,
    ),
    Bill(
      id: 'HD05',
      name: 'Coconut Water',
      SoLuong: 3,
      DonGia: 6.50,
      ThanhTien: 19.50,
    ),
    Bill(
      id: 'HD06',
      name: 'Lipton',
      SoLuong: 3,
      DonGia: 6.80,
      ThanhTien: 20.40,
    ),
    Bill(
      id: 'HD07',
      name: 'Orange Juice',
      SoLuong: 3,
      DonGia: 2.80,
      ThanhTien: 8.40,
    ),
    Bill(
      id: 'HD08',
      name: 'Iced Pennywort',
      SoLuong: 5,
      DonGia: 3.80,
      ThanhTien: 19.00,
    ),
  ];
  int get billCount {
    return _items.length;
  }

  List<Bill> get bills {
    return [..._items];
  }

  void deleteBill(Bill bill) {
    final index = _items.indexWhere((item) => item.id == bill.id);
    _items.removeAt(index);
    notifyListeners();
  }
}