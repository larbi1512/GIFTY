import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBUserFavorits {
  static const tableName = 'user_favorits';

  static const sql_code = '''
         CREATE TABLE IF NOT EXISTS user_favorits (
            user_id INTEGER,
            product_id INTEGER,
            remote_id INTEGER,
            create_date TEXT,
            PRIMARY KEY (user_id, product_id),
            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
            FOREIGN KEY (product_id) REFERENCES gifts(id) ON DELETE CASCADE
           );''';

  static Future<List<Map<String, dynamic>>> getAllFavoritsOfUser(
      String user_id) async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
            product_id ,
          from ${tableName}
          where user_id='$user_id'
          ''');
    return res[0]['product_id'] ?? 0;
  }

  static Future<bool> updateRecord(
      int user_id, int product_id, Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    database.update(tableName, data,
        where: "user_id=? and product_id=?", whereArgs: [user_id, product_id]);
    return true;
  }

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    return await database.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> deleteRecord(int user_id, int product_id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery(
        """delete from  ${tableName}  where user_id=? and product_id=?""",
        [user_id, product_id]);
    return true;
  }
}
