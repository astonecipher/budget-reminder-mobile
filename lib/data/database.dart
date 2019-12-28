import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/bill.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();

  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "BillNotifierDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Bill ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "description TEXT,"
          "balance REAL,"
          "dueDate INT,"
          "notifyBefore INT)");

      await db.execute(
          "INSERT INTO Bill ('id', 'name', 'description', 'balance', 'dueDate', 'notifyBefore')"
          "values (?, ?, ?, ?, ?, ?)",
          [1, "Amazon Card", "Amazon Store Card", "1500", 15, 0]);

      await db.execute(
          "INSERT INTO Bill ('id', 'name', 'description', 'balance', 'dueDate', 'notifyBefore')"
          "values (?, ?, ?, ?, ?, ?)",
          [2, "Capital One", "Credit Card", "1100", 18, 1]);

      await db.execute(
          "INSERT INTO Bill ('id', 'name', 'description', 'balance', 'dueDate', 'notifyBefore')"
          "values (?, ?, ?, ?, ?, ?)",
          [3, "Rent", "Rental Payment", "1500", 1, 0]);
    });
  }

  Future<List<Bill>> getAll() async {
    final db = await database;
    List<Map> results =
        await db.query("Bill", columns: Bill.columns, orderBy: "dueDate ASC");

    List<Bill> bills = new List();
    results.forEach((result) {
      Bill bill = Bill.fromMap(result);
      bills.add(bill);
    });
    return bills;
  }

  Future<Bill> getBillById(int id) async {
    final db = await database;
    var result = await db.query("Bill", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? Bill.fromMap(result.first) : Null;
  }

  insert(Bill bill) async {
    final db = await database;
    var maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Product");

    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT Into Bill (id, name, description, balance, dueDate, notifyBefore)"
        " VALUES (?, ?, ?, ?, ?, ?)",
        [
          id,
          bill.name,
          bill.description,
          bill.balance,
          bill.dueDate,
          bill.notifyBefore
        ]);
    return result;
  }

  update(Bill bill) async {
    final db = await database;
    var result = await db
        .update("Bill", bill.toMap(), where: "id = ?", whereArgs: [bill.id]);
    return result;
  }

  delete(int id) async {
    final db = await database;
    db.delete("Bill", where: "id = ?", whereArgs: [id]);
  }
}
