import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBGiftsTags {
  static const tableName = 'gifts_tags';

  static const sql_code = '''
         CREATE TABLE IF NOT EXISTS gifts_tags (
            gift_id INTEGER,
            tag_id INTEGER,
            remote_id INTEGER,
            create_date TEXT,
            PRIMARY KEY (gift_id, tag_id),
            FOREIGN KEY (gift_id) REFERENCES gifts(id) ON DELETE CASCADE,
            FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
           );''';

  static Future<List<Map<String, dynamic>>> getAllTagsOfGift(
      String gift_id) async {
    final database = await DBHelper.getDatabase();

    return database.rawQuery('''SELECT 
            tag_id ,
          from ${tableName}
          where gift_id='$gift_id'
          ''');
  }

  static Future<bool> updateRecord(
      int tag_id, int gift_id, Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    database.update(tableName, data,
        where: "tag_id=? and gift_id=?", whereArgs: [tag_id, gift_id]);
    return true;
  }

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    return await database.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> deleteRecord(int tag_id, int gift_id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery(
        """delete from  ${tableName}  where tag_id=? and gift_id=?""",
        [tag_id, gift_id]);
    return true;
  }
}
