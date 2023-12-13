import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBUser {
  static const tableName = 'users';
  static const sql_code = '''
         CREATE TABLE IF NOT EXISTS users (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             remote_id INTEGER,
             username TEXT,
             name TEXT,
             surname TEXT,
             email TEXT,
             password TEXT,
             wilaya TEXT,
             phone_number INTEGER,
             profile_pic TEXT,
             create_date TEXT
           );''';
  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final database = await DBHelper.getDatabase();

    return database.rawQuery('''SELECT 
              id,
             remote_id,
             user_name,
             name,
             surname,
             email,
             password,
             wilaya,
             phone_number,
             profile_pic

          from ${tableName}
          ''');
  }

  static Future<int> getUserByUserName(String userName) async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
            id  
          from ${tableName}
          where user_name='$userName'
          ''');
    return res[0]['id'] ?? 0;
  }

  static Future<int> getAllCount() async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
            count(id) as cc
          from ${tableName}
          order by name ASC
          ''');
    return res[0]['cc'] ?? 0;
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
}
