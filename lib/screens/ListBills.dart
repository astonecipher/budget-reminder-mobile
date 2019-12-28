import '../models/bill.dart';
import 'package:flutter/material.dart';
import '../repositories/bill_repository.dart';
import '../widgets/bill_tile.dart';

class ListBills extends StatefulWidget {
  @override
  _ListBills createState() => _ListBills();
}

class _ListBills extends State<ListBills> {
  List<Bill> _bills = <Bill>[];
  final _service = new BillService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Navigation")),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: products, builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if(snapshot.hasData) {
              List<DocumentSnapshot>
              documents = snapshot.data.documents;

              List<Product>
              items = List<Product>();

              for(var i = 0; i < documents.length; i++) {
                DocumentSnapshot document = documents[i];
                items.add(Product.fromMap(document.data));
              }
              return ProductBoxList(items: items);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          ),
        )
    );
  }
