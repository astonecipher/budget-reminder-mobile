import 'package:flutter/material.dart';
import 'package:flutter_app_test_api/screens/add_bill.dart';
import 'app.dart';
import 'screens/home.dart';
import 'screens/add_bill.dart';
import 'screens/ListBills.dart';
void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => ListBills(),
      // When navigating to the "/second" route, build the SecondScreen widget.
//      '/bills': (context) => Home(),
//      '/addBill': (context) => AddBill(),
    },
  ));
}






