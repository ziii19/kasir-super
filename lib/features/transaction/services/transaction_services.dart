import 'package:flutter/material.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/transaction/models/models.dart';

class TransactionServices {
  TransactionServices._();

  static Future<List<TransactionModel>> getAll(TypeEnum? type) async {
    try {
      final db = await SQLiteDatabase.database;

      final results = await db.rawQuery('''
    SELECT * FROM transactions INNER JOIN items ON transactions.id = items.transactionId WHERE transactions.type LIKE ?
    ORDER BY transactions.createdAt DESC
    ''', ["%${type?.name ?? ''}%"]);

      List<TransactionModel> transactions = [];

      for (var element in results) {
        final index = transactions
            .indexWhere((e) => e.referenceId == element['referenceId']);

        if (index < 0) {
          transactions.add(TransactionModel.fromJson(element));
        } else {
          transactions[index] = transactions[index].copyWith(element);
        }
      }

      return transactions;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<TransactionModel> detail(String referenceId) async {
    try {
      final db = await SQLiteDatabase.database;

      final results = await db.rawQuery('''
    SELECT * FROM transactions INNER JOIN items ON transactions.id = items.transactionId WHERE transactions.referenceId = ?
    ''', [referenceId]);

      return TransactionModel.fromJson(results.first);
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<TransactionModel> insert(TransactionModel transaction) async {
    try {
      final db = await SQLiteDatabase.database;

      final id = await db.insert('transactions', transaction.toJson());

      for (var element in transaction.items) {
        await db.insert('items', element.changeId(id).toJson());
      }

      return transaction;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<TransactionModel> update(TransactionModel transaction) async {
    try {
      final db = await SQLiteDatabase.database;

      await db.update(
        'transactions',
        transaction.toJson(),
        where: 'referenceId = ?',
        whereArgs: [transaction.referenceId],
      );

      return transaction;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
