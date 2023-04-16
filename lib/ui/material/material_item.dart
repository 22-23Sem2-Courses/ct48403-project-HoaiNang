import 'package:flutter/material.dart';
import 'package:myproject_app/ui/material/material_manager.dart';
import 'package:provider/provider.dart';

import '../../models/materials.dart';
import '../../resource/dialog.dart';

class MaterialItem extends StatelessWidget {
  final Materials materials;
  const MaterialItem({
    required this.materials,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(materials.id),
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
          "Do you want to remove your material?",
        );
      },
      onDismissed: (direction) {
        context.read<MaterialManager>().deleteMaterial(materials);
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
                image: AssetImage(materials.image),
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
                  materials.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Palatino',
                  ),
                ),
                const Text(
                  "Nguyên liệu đạt chuẩn chất lượng",
                  style: TextStyle(
                    fontSize: 12,
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
