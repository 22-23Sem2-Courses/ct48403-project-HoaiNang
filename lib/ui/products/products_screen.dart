import 'package:flutter/material.dart';
import 'package:myproject_app/ui/products/product_detail.dart';
import 'package:myproject_app/ui/products/product_item.dart';
import 'package:myproject_app/ui/products/product_manager.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../resource/coffeeTheme.dart';
import 'edit_product_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductManager, List<Product>>(
        (productManager) => productManager.items);
    return Consumer<ProductManager>(
      builder: (ctx, productManager, child) {
        return Scaffold(
          body: ListView.builder(
            itemCount: productManager.itemCount,
            itemBuilder: (cxt, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return ProductDetail(
                          product: products[i],
                        );
                      },
                    ),
                  );
                },
                child: ProductItem(product: products[i]),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProductScreen(null),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
