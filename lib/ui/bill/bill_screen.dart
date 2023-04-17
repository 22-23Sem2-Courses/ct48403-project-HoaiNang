import 'package:flutter/material.dart';
import './bill_manager.dart';
import 'package:myproject_app/models/bill_model.dart';
import 'bill_item_card.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    final billManager = BillManager();
    return Scaffold(
      body: ListView.builder(
        itemCount: billManager.billCount,
        itemBuilder: (ctx, i) => BillItemCard(billManager.bills[i]),
      ),
    );
  }
}
