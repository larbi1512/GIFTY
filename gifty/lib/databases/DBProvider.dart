import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBProvider {
  static const tableName = 'providers';
  static const sql_code = '''
         CREATE TABLE IF NOT EXISTS providers (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             remote_id INTEGER,
             store_name TEXT,
             email TEXT,
             password TEXT,
             location TEXT,
             phone_number INTEGER,
             facebook TEXT,
             instagram TEXT,
             website TEXT,
             brand_pic TEXT,
             category TEXT,
             create_date TEXT
           );''';
  static Future<List<Map<String, dynamic>>> getAllProviders() async {
    final database = await DBHelper.getDatabase();
    return database.rawQuery('''SELECT 

             id,
             remote_id,
             store_name,
             email,
             password,
             location ,
             phone_number,
             facebook ,
             instagram,
             website,
             brand_pic
          from ${tableName}
          ''');
  }

  static Future<int> getProviderByStoreName(String storeName) async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
            id  
          from ${tableName}
          where store_name='$storeName'
          ''');
    return res[0]['id'] ?? 0;
  }

  static Future<String> getCategory(int provider_id) async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
          category  
          from ${tableName}
          where id='$provider_id'
          ''');
    return res[0]['category'] ?? "category";
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
