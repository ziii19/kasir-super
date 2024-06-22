import 'package:flutter/material.dart';
import 'package:kasir_super/core/core.dart';
import '../models/model.dart';

class ProductService {
  ProductService._();

  static Future<List<ProductModel>> getAll(String search) async {
    try {
      var db = await SQLiteDatabase.database;

      final data = await db.query(
        'products',
        where: "name LIKE ?",
        whereArgs: ["%$search%"],
      );

      return data.map(ProductModel.fromJson).toList();
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<bool> create(ProductModel product) async {
    try {
      var db = await SQLiteDatabase.database;

      await db.insert('products', product.toJson());

      return true;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<bool> update(ProductModel product) async {
    try {
      var db = await SQLiteDatabase.database;

      await db.update('products', product.toJson(),
          where: "id = ?", whereArgs: [product.id]);

      return true;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<bool> delete(int id) async {
    try {
      var db = await SQLiteDatabase.database;

      await db.delete('products', where: "id = ?", whereArgs: [id]);

      return true;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
