import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBProvidersTags {
  static const tableName = 'providers_tags';

  static const sql_code = '''
         CREATE TABLE IF NOT EXISTS providers_tags (
            provider_id INTEGER,
            tag_id INTEGER,
            remote_id INTEGER,
            create_date TEXT,
            PRIMARY KEY (provider_id, tag_id),
            FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE CASCADE,
            FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
           );''';

  static Future<List<Map<String, dynamic>>> getAllTagsOfProvider(
      String provider) async {
    final database = await DBHelper.getDatabase();

    return database.rawQuery('''SELECT 
            tag_id ,
          from ${tableName}
          where provider_id='$provider'
          ''');
  }

  static Future<bool> updateRecord(
      int provider_id, int tag_id, Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    database.update(tableName, data,
        where: "provider_id=? and tag_id=?", whereArgs: [provider_id, tag_id]);
    return true;
  }

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    return await database.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> deleteRecord(int provider_id, int tag_id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery(
        """delete from  ${tableName}  where provider_id=? and tag_id=?""",
        [provider_id, tag_id]);

    return true;
  }
}
