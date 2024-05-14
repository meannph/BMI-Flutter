import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static const _databaseName = 'ProductDb.db';
  static const _databaseVersion = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory dataDir = await getApplicationDocumentsDirectory();

    String dbPath = join(dataDir.path, _databaseName);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateTable);
  }

  Future _onCreateTable(Database db, int version) async {
    //create tables
    // SQLite not have BOOLEAN (use INT 0, 1 instead)
    // replace NUMERIC on double
    await db.execute('''
      CREATE TABLE ${Product.tableName}(
        ${Product.colBMI} TEXT PRIMARY KEY,
        ${Product.colCondition} TEXT NOT NULL,
        ${Product.colWater} TEXT NOT NULL,
       
      )
      ''');
  }

  // insert product
  Future<int> insertProduct(Product product) async {
    Database db = await database;
    return await db.insert(
      Product.tableName,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


// retrieve all product
  Future<List<Product>> fetchProducts() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(Product.tableName);
    if (maps.isEmpty) {
      return [];
    } else {
      return List.generate(maps.length, (index) {
        return Product(
          bmi: maps[index][Product.colBMI],
          condition: maps[index][Product.colCondition],
          water: maps[index][Product.colWater],
        );
      });
    }
  }

//   //Change from QuerySnapshot to List<Product> and change how it does stuff
//   Future<List<Product>> searchProduct(String name) async {
//     Database db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(Product.tableName,
//         where: '${Product.colName} LIKE ?', whereArgs: ['%$name%']);
//     if (maps.isEmpty) {
//       return [];
//     } else {
//       return List.generate(maps.length, (index) {
//         return Product(
//           name: maps[index][Product.colName],
//           description: maps[index][Product.colDescription],
//           lastname: maps[index][Product.colLastname],
//           avg: maps[index][Product.colAvg],
//           price: maps[index][Product.colPrice] + 0.0,  // convert int to double
//           favorite: maps[index][Product.colFavorite],
//         );
//       });
//     }
//   }
// }
}