import 'package:flutter/material.dart';
import './bill_manager.dart';
import 'package:myproject_app/models/bill.dart';
import './bill_detail_screen.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: BillManager().itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BillDetailScreen(
                        BillManager().items[index],
                      );
                    },
                  ),
                );
              },
              child: Text(
                BillManager().items[index].id as String,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Palatino',
                ),
              ));
        },
      ),
    );
  }
}
