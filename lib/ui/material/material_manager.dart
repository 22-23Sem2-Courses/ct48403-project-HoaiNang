import 'package:flutter/material.dart';

import '../../models/materials.dart';

class MaterialManager with ChangeNotifier{
  final List<Materials> _items = [
    Materials(
        id: 'NL01',
        name: 'Cà phê Trung Nguyên',
        SoLuongNhap: 1000,
        SoLuongConLai: 700,
        DonViTinh: 'Gói',
        image: 'assets/images/material/cf-1.jpg'),
    Materials(
        id: 'NL02',
        name: 'Cà phê Chồn',
        SoLuongNhap: 1000,
        SoLuongConLai: 600,
        DonViTinh: 'Gói',
        image: 'assets/images/material/cf-2.jpg'),
    Materials(
        id: 'NL03',
        name: 'Cà phê Phin Deli',
        SoLuongNhap: 1000,
        SoLuongConLai: 750,
        DonViTinh: 'Gói',
        image: 'assets/images/material/cf-3.jpg'),
    Materials(
        id: 'NL04',
        name: 'Đường cát trắng',
        SoLuongNhap: 1000,
        SoLuongConLai: 700,
        DonViTinh: 'Kg',
        image: 'assets/images/material/sugar-white.jpg'),
    Materials(
        id: 'NL05',
        name: 'Đường cát vàng',
        SoLuongNhap: 1000,
        SoLuongConLai: 600,
        DonViTinh: 'Kg',
        image: 'assets/images/material/sugar-yellow.jpg'),
    Materials(
        id: 'NL06',
        name: 'Sữa tươi Vinamilk',
        SoLuongNhap: 10000,
        SoLuongConLai: 7000,
        DonViTinh: 'Hộp',
        image: 'assets/images/material/vinamilk.jpg'),
    Materials(
        id: 'NL07',
        name: 'Sữa Ông Thọ',
        SoLuongNhap: 10000,
        SoLuongConLai: 6000,
        DonViTinh: 'Hộp',
        image: 'assets/images/material/ongtho.jpg'),
  ];
  int get itemCount {
    return _items.length;
  }

  List<Materials> get items {
    return [..._items];
  }
  void addMaterial(Materials materials) {
    _items.add(
      // ignore: unnecessary_string_interpolations
      materials.copyWith(id: 'p${DateTime.now().toIso8601String()}'),
    );
    notifyListeners();
  }
  void updateMaterial(Materials materials) {
    final index = _items.indexWhere((item) => item.id == materials.id);
    _items[index] = materials;
    notifyListeners();
  }

  void deleteMaterial(Materials materials) {
    final index = _items.indexWhere((item) => item.id == materials.id);
    _items.removeAt(index);
    notifyListeners();
  }
}
