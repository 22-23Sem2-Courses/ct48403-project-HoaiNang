import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myproject_app/models/staff.dart';
import 'package:myproject_app/ui/staff/staff_manager.dart';
import 'package:provider/provider.dart';
import './edit_staff_screen.dart';

class StaffDetail extends StatefulWidget {
  final Staff staff;

  const StaffDetail({super.key, required this.staff});

  @override
  State<StaffDetail> createState() => _StaffDetailState();
}

class _StaffDetailState extends State<StaffDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Staff Detail',
          style: TextStyle(
            fontFamily: 'Palatino',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 233, 111, 4),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 20.0,
        ),
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.staff.avt),
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
              'Name: ${widget.staff.name}',
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
              'Phone: 0${widget.staff.phone}',
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
            Text(
              'Address: ${widget.staff.address}',
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
              'Email: ${widget.staff.email}',
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
                  builder: (context) => EditStaffScreen(widget.staff),
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
              context.read<StaffManager>().deleteStaff(widget.staff);
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

