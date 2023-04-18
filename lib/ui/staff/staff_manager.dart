import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:myproject_app/ui/staff/staff_item.dart';
import '../../models/staff.dart';

  var staffs = [
    Staff(
        id: 'NV01',
        name: 'Nguyen Van A',
        address: 'Ninh Kieu, Can Tho',
        phone: 0987654321,
        email: 'a123@gmail.com',
        avt: 'assets/images/avt/avt-1.jpg'),
    Staff(
        id: 'NV02',
        name: 'Nguyen Van B',
        address: 'Long My, Hau Giang',
        phone: 0987654334,
        email: 'b123@gmail.com',
        avt: 'assets/images/avt/avt-2.jpg'),
    Staff(
        id: 'NV03',
        name: 'Tran Van C',
        address: 'Ninh Kieu, Can Tho',
        phone: 0987654331,
        email: 'c123@gmail.com',
        avt: 'assets/images/avt/avt-3.jpg'),
    Staff(
        id: 'NV04',
        name: 'Nguyen Thi D',
        address: 'Cai Rang, Can Tho',
        phone: 0987774321,
        email: 'd123@gmail.com',
        avt: 'assets/images/avt/avt-4.jpg'),
    Staff(
        id: 'NV05',
        name: 'Nguyen Thi E',
        address: 'Di An, Binh Duong',
        phone: 0987666321,
        email: 'e123@gmail.com',
        avt: 'assets/images/avt/avt-5.jpg'),
    Staff(
        id: 'NV06',
        name: 'Truong Van F',
        address: 'Ninh Kieu, Can Tho',
        phone: 0987654389,
        email: 'f123@gmail.com',
        avt: 'assets/images/avt/avt-6.jpg'),
    Staff(
        id: 'NV07',
        name: 'Nguyen Van G',
        address: 'Thoi Lai, Can Tho',
        phone: 0987659821,
        email: 'G123@gmail.com',
        avt: 'assets/images/avt/avt-7.jpg'),
    Staff(
        id: 'NV08',
        name: 'Nguyen Van H',
        address: 'Ninh Kieu, Can Tho',
        phone: 0988654321,
        email: 'h123@gmail.com',
        avt: 'assets/images/avt/avt-8.jpg'),
  ];

  // int get itemCount {
  //   return _items.length;
  // }

  // List<Staff> get items {
  //   return [..._items];
  // }
  // void addStaff(Staff staff) {
  //   _items.add(
  //     staff.copyWith(id: 'p${DateTime.now().toIso8601String()}'),
  //   );
  //   notifyListeners();
  // }
  // void updateStaff(Staff staff) {
  //   final index = _items.indexWhere((item) => item.id == staff.id);
  //   _items[index] = staff;
  //   notifyListeners();
  // }

  // void deleteStaff(Staff staff) {
  //   final index = _items.indexWhere((item) => item.id == staff.id);
  //   _items.removeAt(index);
  //   notifyListeners();
  // }

