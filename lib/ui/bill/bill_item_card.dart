import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myproject_app/models/bill_model.dart';
import 'package:myproject_app/ui/bill/bill_manager.dart';
import 'package:provider/provider.dart';

import '../../resource/dialog.dart';

class BillItemCard extends StatefulWidget {
  final Bill bill;
  const BillItemCard(this.bill, {super.key});
  @override
  State<BillItemCard> createState() => _BillItemCardState();
}

class _BillItemCardState extends State<BillItemCard> {
  var _change = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.bill.id),
      background: Container(
        color: Theme.of(context).colorScheme.secondary,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        child: const Icon(
          Icons.delete_sweep_outlined,
          color: Colors.black54,
          size: 40,
        ),
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          'Do you want to remove bill ??',
        );
      },
      onDismissed: (direction) {
        context.read<BillManager>().deleteBill(widget.bill);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            builBillSumary(),
            if (_change) buildBillDetail(),
          ],
        ),
      ),
    );
  }

  Widget builBillSumary() {
    return ListTile(
      title: Text('${widget.bill.id}'),
      trailing: IconButton(
        icon: Icon(_change ? Icons.expand_less : Icons.expand_more),
        onPressed: () {
          setState(() {
            _change = !_change;
          });
        },
      ),
    );
  }

  Widget buildBillDetail() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: min(120, 200),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name: ${widget.bill.name}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Quantity: ${widget.bill.SoLuong}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Unit Price: ${widget.bill.DonGia}\$',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Total: ${widget.bill.ThanhTien}\$',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}