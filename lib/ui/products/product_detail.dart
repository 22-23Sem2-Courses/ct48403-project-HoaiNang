import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myproject_app/ui/products/product_manager.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import './edit_product_screen.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(
            fontFamily: 'Palatino',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 40.0,
        ),
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.product.imgUrl),
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
              widget.product.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'Palatino',
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Price: ${widget.product.price}\$',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Palatino',
                  decoration: TextDecoration.none,
                  decorationColor: Colors.redAccent,
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Description",
              style: TextStyle(
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
              widget.product.desc,
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
                  builder: (context) => EditProductScreen(widget.product),
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
              context.read<ProductManager>().deleteProduct(widget.product);
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
