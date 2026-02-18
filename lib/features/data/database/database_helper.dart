import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('fixed_assets.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE history_asset (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scat_id INTEGER,
      date TEXT,
      year INTEGER,
      pvjv TEXT,
      grn_id INTEGER,
      description TEXT NOT NULL,
      brand TEXT,
      model TEXT,
      serial_no TEXT,
      issue_no TEXT,
      price INTEGER NOT NULL,
      days INTEGER,
      code TEXT,
      type_id INTEGER NOT NULL,
      stype_id INTEGER,
      image_path TEXT,
      user_id INTEGER,
      ilocation_id INTEGER,
      islocation_id INTEGER
      )
    ''');
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
