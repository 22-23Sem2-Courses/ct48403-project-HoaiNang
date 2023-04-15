import 'package:flutter/material.dart';

import '../../models/staff.dart';

class StaffDetailScreen extends StatelessWidget {
  const StaffDetailScreen(
    this.staff, {
    super.key,
  });

  final Staff staff;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(staff.name),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              child: Image.asset('${staff.avt}'),
            ),
            SizedBox(
              child: Text("Address: ${staff.address}"),
            ),
            SizedBox(child: Text("Email: ${staff.email}")),
            SizedBox(child: Text('Phone: 0${staff.phone}')),
          ],
        )));
  }
  
}

