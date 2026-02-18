import 'package:sqflite/sqflite.dart';
import '../database/database_helper.dart';
import '../models/model/asset.dart';


class HistoryAsset {
  static const String tableName = 'history_asset';

  static final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // 🔹 Insert
  Future<int> saveAsset(Asset asset) async {
    final db = await _dbHelper.database;
    return await db.insert(
      tableName,
      asset.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 🔹 Get all
  Future<List<Asset>> getAssets() async {
    final db = await _dbHelper.database;

    final result = await db.query(
      tableName,
      orderBy: 'id DESC',
    );

    return result.map((e) => Asset.fromJson(e)).toList();
  }

  // 🔹 Get by ID
  Future<Asset?> getAsset(int id) async {
    final db = await _dbHelper.database;

    final result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return Asset.fromJson(result.first);
    }
    return null;
  }

  // 🔹 Update
  Future<int> updateAsset(Asset asset) async {
    final db = await _dbHelper.database;

    return await db.update(
      tableName,
      asset.toJson(),
      where: 'id = ?',
      whereArgs: [asset.id],
    );
  }

  // 🔹 Delete
  Future<int> deleteAsset(int id) async {
    final db = await _dbHelper.database;

    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
