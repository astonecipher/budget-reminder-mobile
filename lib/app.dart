import 'package:flutter/material.dart';
// import 'screens/ListBills.dart';
import 'screens/home.dart';

class BillListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Bill Reminder',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black
    ),
    home: Home(),
//      onPressed: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => SecondRoute()),
//        );
//      }
  );
}