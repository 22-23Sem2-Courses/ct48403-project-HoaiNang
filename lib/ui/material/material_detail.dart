import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myproject_app/models/materials.dart';
import 'package:myproject_app/ui/material/material_manager.dart';
import 'package:provider/provider.dart';
import './edit_material_screen.dart';

class MaterialDetail extends StatefulWidget {
  final Materials materials;

  const MaterialDetail({super.key, required this.materials});

  @override
  State<MaterialDetail> createState() => _MaterialDetailState();
}

class _MaterialDetailState extends State<MaterialDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Material Detail',
          style: TextStyle(
            fontFamily: 'Palatino',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 2, 153, 20),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 20.0,
        ),
        color: Color.fromARGB(255, 55, 230, 61),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.materials.image),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.5, 0.5),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    )
                  ]),
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tên nguyên liệu: ${widget.materials.name}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontFamily: 'Palatino',
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Số lượng nhập vào: ${widget.materials.SoLuongNhap}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino',
                  decoration: TextDecoration.none,
                  decorationColor: Colors.redAccent,
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Số lượng còn lại: ${widget.materials.SoLuongConLai}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Đơn vị tính: ${widget.materials.DonViTinh}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Palatino',
                  decoration: TextDecoration.none,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      floatingActionButton: Menu(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Menu() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22),
      backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
            child: const Icon(
              Icons.edit_note,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(255, 43, 43, 43),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditMaterialScreen(widget.materials),
                ),
              );
            },
            label: 'Edit',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: const Color.fromARGB(255, 43, 43, 43)),
        SpeedDialChild(
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(255, 43, 43, 43),
            onTap: () {
              context.read<MaterialManager>().deleteMaterial(widget.materials);
              Navigator.of(context).pop();
            },
            label: 'Delete',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: const Color.fromARGB(255, 43, 43, 43))
      ],
    );
  }
}
