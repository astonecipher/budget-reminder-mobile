import 'package:flutter/material.dart';
import '../models/bill.dart';

class BillTile extends StatelessWidget {
  final Bill _bill;
  BillTile(this._bill);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_bill.name),
        subtitle: Text(_bill.description + "\nDue Date: " + _bill.dueDate.toString() + " of every month."),
      ),
      Divider()
    ],
  );
}