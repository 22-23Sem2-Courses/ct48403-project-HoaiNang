import 'package:flutter/material.dart';
import 'package:myproject_app/models/staff.dart';
import 'package:provider/provider.dart';
import '../../resource/coffeeTheme.dart';
import './staff_manager.dart';
import './staff_detail.dart';
import './edit_staff_screen.dart';
import './staff_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final staffs = context.select<StaffManager, List<Staff>>(
        (staffManager) => staffManager.items);
    return Consumer<StaffManager>(
      builder: (ctx, staffManager, child) {
        return Scaffold(
          body: ListView.builder(
            itemCount: staffManager.itemCount,
            itemBuilder: (cxt, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return StaffDetail(
                          staff: staffs[i],
                        );
                      },
                    ),
                  );
                },
                child: StaffItem(staff: staffs[i]),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditStaffScreen(null),
                ),
              );
            },
          ),
        );
      },
    );
  }
  }

//   Widget buildDeleteButton(BuildContext context) {
//     return IconButton(
//       icon: const Icon(
//         Icons.delete,
//       ),
//       onPressed: () {
//         print('Delete a product');
//       },
//       color: Theme.of(context).colorScheme.error,
//     );
//   }

//   Widget buildEditButton(BuildContext context) {
//     return IconButton(
//       icon: const Icon(
//         Icons.edit,
//       ),
//       onPressed: () {
//         print('Go to edit product screen');
//       },
//       color: Theme.of(context).primaryColor,
//     );
//   }

//   Widget _buildItemCard(Staff staff) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 staff.name,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: 'Palatino',
//                 ),
//               ),
//               Row(
//                 children: [
//                   buildEditButton(context),
//                   buildDeleteButton(context),
//                 ],
//               )
//             ],
//           )),
//     );
//   }

