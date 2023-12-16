import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBUserCart {
  static const tableName = 'user_cart';

  static const sql_code = '''
         CREATE TABLE IF NOT EXISTS user_cart (
            user_id INTEGER,
            product_id INTEGER,
            title TEXT,
            remote_id INTEGER,
            amount INTEGER,
            price INTEGER,
            PRIMARY KEY (user_id, product_id),
            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
            FOREIGN KEY (product_id) REFERENCES gifts(id) ON DELETE CASCADE
           );''';


static Future<List<Map<String, dynamic>>> getAllCarItemsOfUser(int user_id) async {
  final database = await DBHelper.getDatabase();

  List<Map<String, dynamic>> res = await database.rawQuery('''
    SELECT 
      title , amount , price
    FROM $tableName
    WHERE user_id=?
  ''', [user_id]);

  return res;
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
        """delete from  $tableName  where user_id=? and product_id=?""",
        [user_id, product_id]);
    return true;
  }
}
