import 'package:sqflite/sqflite.dart';

class SQLiteDatabase {
  SQLiteDatabase._();

  static Future<Database> get database async {
    var databasePath = await getDatabasesPath();
    String path = '$databasePath/database.db';

    final db = await openDatabase(path, version: 1, onCreate: onCreate);

    return db;
  }

  static Future<void> onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE products (
        id INTEGER PRIMARY KEY,
        name TEXT,
        desc TEXT,
        image TEXT,
        regularPrice REAL,
        price REAL,
        stock REAL,
        unit TEXT,
        sku TEXT,
        createdAt TEXT
        )
      ''');
    await db.execute('''
        CREATE TABLE transactions (
        id INTEGER PRIMARY KEY,
        referenceId TEXT UNIQUE,
        type TEXT,
        qrString TEXT,
        qrId TEXT,
        amount REAL,
        discount REAL,
        payAmount REAL,
        paymentType TEXT,
        createdAt TEXT
        )
      ''');
    await db.execute('''
        CREATE TABLE items (
        id INTEGER PRIMARY KEY,
        qty REAL,
        note TEXT,
        title TEXT,
        desc TEXT,
        image TEXT,
        regularPrice REAL,
        unit TEXT,
        sku TEXT,
        price REAL,
        stock REAL,
        transactionId REAL,
        FOREIGN KEY (transactionId) REFERENCES transactions(id)
        )
      ''');
  }
}
