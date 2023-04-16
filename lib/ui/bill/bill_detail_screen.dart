import 'package:flutter/material.dart';

import '../../models/bill.dart';

class BillDetailScreen extends StatelessWidget {
  const BillDetailScreen(
    this.bill, {
    super.key,
  });

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(bill.id as String),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            const SizedBox(
              height: 250,
            ),
            SizedBox(
                child: Text(
              "Tên Sản Phẩm: ${bill.name}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
                decoration: TextDecoration.none,
                color: Colors.blue,
              ),
            )),
            SizedBox(
                child: Text(
              "Số lượng: ${bill.SoLuong}",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Palatino',
                  decoration: TextDecoration.none,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 13, 208, 78)),
            )),
            SizedBox(
                child: Text(
              'Đơn giá: ${bill.DonGia}\$',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Palatino',
                  decoration: TextDecoration.none,
                  decorationColor: Colors.redAccent,
                  decorationStyle: TextDecorationStyle.solid,
                  color: Color.fromARGB(255, 14, 226, 95)),
            )),
            SizedBox(
                child: Text(
              'Thành tiền: ${bill.ThanhTien}\$',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Palatino',
                  decoration: TextDecoration.none,
                  decorationColor: Colors.redAccent,
                  decorationStyle: TextDecorationStyle.solid,
                  color: Color.fromARGB(255, 10, 189, 55)),
            )),
          ],
        )));
  }
}
