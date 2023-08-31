import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider with ChangeNotifier {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "orderdb.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE orders (
            staff_id TEXT,
            department_id TEXT,
            order_id TEXT PRIMARY KEY,
            order_data TEXT,
            order_for_date DATETIME,
            order_datetime DATETIME,
            synced BOOLEAN DEFAULT 0
          )
        ''');
    });
  }

  Future<void> insertData(order) async {
    final db = await database;
    await db.insert('orders', order,
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }
}
