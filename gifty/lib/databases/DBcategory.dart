import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBCategory {
  static const tableName = 'categories';

  static const sql_code = '''
         CREATE TABLE IF NOT EXISTS categories (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             remote_id INTEGER,
             name TEXT,
             create_date TEXT
           );''';
  static Future<List<Map<String, dynamic>>> getAllCategories() async {
    final database = await DBHelper.getDatabase();

    return database.rawQuery('''SELECT 
            id ,
            name,
            remote_id
          from ${tableName}
          ''');
  }

  static Future<int> getCategoryByName(String name) async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
            id  
          from ${tableName}
          where name='$name'
          ''');
    return res[0]['id'] ?? 0;
  }

  static Future<Map<String, dynamic>> getCategoryById(int id) async {
    final database = await DBHelper.getDatabase();

    List<Map<String, dynamic>> res = await database.query(tableName,
        columns: ['id', 'name', 'remote_id'], where: 'id = ?', whereArgs: [id]);

    return res.first;
    // // Check if there is a result
    // if (res.isNotEmpty) {
    //   // Return the first result
    //   return res.first;
    // }
    // else {
    //   // Return null or handle the case where there is no matching category
    //   return null;
    // }
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

  static Future<bool> syncCategories(
      List<Map<String, dynamic>> remote_data) async {
    List local_data = await getAllCategories();
    Map index_remote = {};
    List local_ids = [];
    for (Map item in local_data) {
      index_remote[item['remote_id']] = item['id'];
      local_ids.add(item['id']);
    }

    for (Map item in remote_data) {
      if (index_remote.containsKey(item['id'])) {
        int local_id = index_remote[item['id']];
        await updateRecord(local_id, {'name': item['name']});
        local_ids.remove(local_id);
      } else {
        await insertRecord({'name': item['name'], 'remote_id': item['id']});
      }
    }
    //Remote Local Categories...
    //There is a RISK ? in case items pending with old data?
    for (int local_id in local_ids) await deleteRecord(local_id);
    return true;
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
