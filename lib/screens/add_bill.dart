import 'package:flutter/material.dart';
import '../models/bill.dart';
import '../repositories/bill_repository.dart';
// import 'home.dart';


class AddBill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add New Bill',
      home: BillForm(),
    );
  }
}
class BillForm extends StatefulWidget {
  @override
  _AddBillFormState createState() => _AddBillFormState();
}

class _AddBillFormState extends State<BillForm> {
  var _service = new BillService();

//  Bill _bill = new Bill();
  final name = TextEditingController();
  final description = TextEditingController();
  final dueDate = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    description.dispose();
    dueDate.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Add New Bill'),
    ),
    body:
    Column(
      children: [
        Text("Bill Name"),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: name,
            )
        ),
        Text('Description'),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: description,
            )
        ),
        Text('Day Due'),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: dueDate,
            )
        ),
        SizedBox(
          width: double.infinity,
          // height: double.infinity,
          child: RaisedButton(
            child: Text("Add"),
            onPressed: () {
              print(name.text);
//              Bill _bill = new Bill('0', name.text, description.text, dueDate.text);
//              var response = _service.addBill(_bill);
//              _bill.dispose();
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the

//                    content: Text("Return code from service was : ${response}"),

                  );
                },
              );
            },
          ),
        )
      ],
    ),
  );
}
