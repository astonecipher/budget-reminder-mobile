import 'package:flutter_app_test_api/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test_api/repositories/bill_repository.dart';
import 'package:flutter_app_test_api/widgets/bill_tile.dart';
import 'package:flutter_app_test_api/interfaces/idatastore.dart';

class ListBills extends StatefulWidget {
  @override
  _ListBills createState() => _ListBills();
}

class _ListBills extends State<ListBills> {
  // TODO add DI for this
//  final _service = new IDataStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bill Notification List")),
      body: FutureBuilder<List<Bill>>(
        future: BillSQLiteDbProvider.db. getAllBills(),
        builder: (BuildContext context, AsyncSnapshot<List<Bill>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Bill item = snapshot.data[index];
                return ListTile(
                  title: Text(item.name),
                  leading: Text(item.description),

//                  trailing: Checkbox(
//                    onChanged: (bool value) {
//                      DBProvider.db.blockClient(item);
//                      setState(() {});
//                    },
//                    value: item.blocked,
//                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No Data Returned"));
          }
        },
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () async {
//          Client rnd = testClients[math.Random().nextInt(testClients.length)];
//          await DBProvider.db.newClient(rnd);
//          setState(() {});
//        },
//      ),
    );
  }
}
