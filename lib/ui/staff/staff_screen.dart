import 'package:flutter/material.dart';

import './staff_manager.dart';
// import './staff_detail.dart';
// import './edit_staff_screen.dart';
import './staff_item.dart';

// class StaffScreen extends StatefulWidget {
//   const StaffScreen({Key? key}) : super(key: key);
//   @override
//   State<StaffScreen> createState() => _StaffScreenState();
// }

// class _StaffScreenState extends State<StaffScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final staffs = context.select<StaffManager, List<Staff>>(
//         (staffManager) => staffManager.items);
//     return Consumer<StaffManager>(
//       builder: (ctx, staffManager, child) {
//         return Scaffold(
//           body: ListView.builder(
//             itemCount: staffManager.itemCount,
//             itemBuilder: (cxt, i) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (ctx) {
//                         return StaffDetail(
//                           staff: staffs[i],
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 child: StaffItem(staff: staffs[i]),
//               );
//             },
//           ),
//           floatingActionButton: FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => EditStaffScreen(null),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//   }
class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GridView(
    // ignore: sort_child_properties_last
    children: staffs
        .map((eachStaff) => StaffItem(
              staff: eachStaff,
            ))
        .toList(),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300,
      childAspectRatio: 2 / 3.5,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
      ),
    );
  }
}
