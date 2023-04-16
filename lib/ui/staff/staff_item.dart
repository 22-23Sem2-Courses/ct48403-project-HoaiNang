import 'package:flutter/material.dart';
import 'package:myproject_app/ui/staff/staff_manager.dart';
import 'package:provider/provider.dart';

import '../../models/staff.dart';
import '../../resource/dialog.dart';

class StaffItem extends StatelessWidget {
  final Staff staff;
  const StaffItem({
    required this.staff,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(staff.id),
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
          "Do you want to remove this staff?",
        );
      },
      onDismissed: (direction) {
        context.read<StaffManager>().deleteStaff(staff);
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
                image: AssetImage(staff.avt),
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
                  staff.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Palatino',
                  ),
                ),
                Text(
                  'Phone: ${staff.phone}',
                  style: const TextStyle(
                    fontSize: 18,
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
