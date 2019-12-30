import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test_api/interfaces/idatastore.dart';
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
  var _service = new IDataStore();

//  Bill _bill = new Bill();
  final name = TextEditingController();
  final description = TextEditingController();
  final dueDate = TextEditingController();
  final notifyBefore = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    description.dispose();
    dueDate.dispose();
    notifyBefore.dispose();

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
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: name,
            )
        ),
        Text("Nickname"),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: description,
            )
        ),
        Text('Description'),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: dueDate,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            )
        ),
        Text('Day Due'),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: notifyBefore,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            )
        ),
        Text('Notify me days prior'),
        SizedBox(
          width: double.infinity,
          // height: double.infinity,
          child: RaisedButton(
            child: Text("Add"),
            onPressed: () {
              print(name.text);
              Bill _bill = new Bill(null, name.text, description.text, null, int.parse(dueDate.text), int.parse(notifyBefore.text));
              var response = BillSQLiteDbProvider.db.addNewBill(_bill);
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("New Bill added to list!\n${response.toString()}"),
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
