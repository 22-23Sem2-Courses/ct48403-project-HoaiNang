import 'package:flutter/material.dart';
import 'package:myproject_app/ui/products/product_manager.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../resource/dialog.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(product.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: const Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          "Do you want to remove your product!!",
        );
      },
      onDismissed: (direction) {
        context.read<ProductManager>().deleteProduct(product);
      },
      child: _buildItemCard(),
    );
  }

  Widget _buildItemCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage(product.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Palatino',
                  ),
                ),
                Text(
                  'Price: ${product.price}\$',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Palatino',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
