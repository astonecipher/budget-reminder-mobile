import 'package:flutter/material.dart';
import '../models/bill.dart';
import '../repositories/bill_repository.dart';
import '../widgets/bill_tile.dart';


class Home extends StatelessWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}

//class _HomeState extends State<Home> {
//  List<Bill> _bills = <Bill>[];
//  var _service = new BillService();
//  @override
//  void initState() {
//    super.initState();
//    listenForBills();
//  }

//  void listenForBills() async {
//    final List<Bill> stream = await _service.getBills();
//    _bills.addAll((Bill bills) => setState(() => _bills.add(bill))
//    );
//  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Your Bill Notifications'),
        ),
        body: Text('Home Page'), // ListView.builder(
//          itemCount: _bills.length,
//          itemBuilder: (context, index) => BillTile(_bills[index]),
//        ),
      );

}

//
//class FirstRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('First Route'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('Open route'),
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => Home()),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}