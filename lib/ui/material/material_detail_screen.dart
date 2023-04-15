import 'package:flutter/material.dart';

import '../../models/material.dart';

class MaterialDetailScreen extends StatelessWidget {
  const MaterialDetailScreen(
    this.material, {
    super.key,
  });

  final Materials material;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(material.name),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              child: Image.asset('${material.image}'),
            ),
            SizedBox(child: Text("Tên Sản Phẩm: ${material.name}")),
            SizedBox(child: Text("Số lượng nhập vào: ${material.SoLuongNhap}")),
            SizedBox(child: Text('Số lượng còn lại: ${material.SoLuongConLai}')),
            SizedBox(child: Text('Đơn vị tính: ${material.DonViTinh}')),
          ],
        )));
  }
  
}
