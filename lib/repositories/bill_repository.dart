import 'dart:convert';
import '../models/bill.dart';
import '../data/database.dart';

class BillService {

  Future <List<Bill>> getBills() async {
    return  SQLiteDbProvider.db.getAll();
  }

  Future<int> addBill(Bill newBill) async {
    return 500;
  }
}
