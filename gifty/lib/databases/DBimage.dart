import 'DBHelper.dart';

class DBImage {
  static const tableName = 'images';

  static const sql_code =
      '''CREATE TABLE IF NOT EXISTS images (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             remote_id INTEGER,
             product_id INTEGER,
             type TEXT,
             imagePath TEXT,
             create_date TEXT
           )
       ''';

  static Future<Map<String, dynamic>?> getSingleImageToUpload() async {
    final database = await DBHelper.getDatabase();

    List<Map<String, dynamic>> res = await database.rawQuery(
        '''SELECT 
            images.id,
            images.type,
            images.imagePath,
            gifts.id as product_id
          from ${tableName}
              left join gifts on product_id=gifts.id
          order by images.id  ASC
          limit 1
          ''');
    if (res == null || res.isEmpty) return null;
    return res[0] ?? null;
  }

  static Future<Map<String, dynamic>?> getImagesOfProduct() async {
    final database = await DBHelper.getDatabase();

    List<Map<String, dynamic>> res = await database.rawQuery(
        '''SELECT 
            images.id,
            images.type,
            images.imagePath,
            gifts.remote_id as product_id
          from ${tableName}
              left join gifts on product_id=gifts.id
          order by images.id  ASC
          ''');
    if (res == null || res.isEmpty) return null;
    return res[0] ?? null;
  }

  static Future<int> getAllCount() async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery(
        '''SELECT 
            count(id) as cc
          from ${tableName}
          ''');
    return res[0]['cc'] ?? 0;
  }

  static Future<bool> updateRecord(int id, Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    database.update(tableName, data, where: "id=?", whereArgs: [id]);
    return true;
  }

  static Future<bool> deleteRecord(int id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery("""delete from  ${tableName}  where id=?""", [id]);
    return true;
  }
}
