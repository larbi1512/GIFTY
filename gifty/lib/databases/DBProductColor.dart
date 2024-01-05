import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBProductColor {
  static const tableName = 'product_color';

  static const sql_code = '''
         CREATE TABLE IF NOT EXISTS product_color (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            remote_id INTEGER,
            product_id INTEGER,
            color TEXT,
            create_date TEXT,
            FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
           );''';

  static Future<List<dynamic>?> getColorsOfProduct(int product_id) async {
    final database = await DBHelper.getDatabase();

    List<dynamic> res = await database.rawQuery('''SELECT 
            color
          from ${tableName}
              where product_id='$product_id'
          ''');
    if (res == null || res.isEmpty) return null;
    return res ?? null;
  }

  static Future<bool> updateRecord(int id, Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    database.update(tableName, data, where: "id=?", whereArgs: [id]);
    return true;
  }

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    return await database.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> deleteRecord(int id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery("""delete from  ${tableName}  where id=?""", [id]);
    return true;
  }

  static Future<bool> deleteColors(int product_id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery(
        """delete from  ${tableName}  where product_id=?""", [product_id]);
    return true;
  }
}
