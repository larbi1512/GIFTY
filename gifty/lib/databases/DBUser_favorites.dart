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

  static Future<List> getIdFavoritsOfUser(int user_id) async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
            product_id 
          from ${tableName}
          where user_id='$user_id'
          ''');

    var result = [];
    for (Map product in res) {
      result.add(product['product_id']);
    }
    return result;
  }

  static Future<List> getAllFavoritsOfUser(int user_id) async {
    final database = await DBHelper.getDatabase();

    var res = await database.rawQuery('''SELECT 
        gifts.id,
        gifts.name,
        gifts.remote_id,
        gifts.description,
        gifts.price,
        categories.name as type,
        MAX(images.imagePath) as imagePath
        FROM ${tableName}
        left join gifts on user_favorits.product_id=gifts.id
        LEFT JOIN images ON gifts.id = images.product_id
        left join categories on category_id=categories.id
        where user_favorits.user_id='$user_id'
        GROUP BY gifts.id
        ORDER BY gifts.name ASC
          ''');
    return res;
  }

  static Future<bool> isInUserFavorites(int product_id, int user_id) async {
    var favorites = await getIdFavoritsOfUser(user_id);
    return (favorites.contains(product_id));
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
    getIdFavoritsOfUser(1);
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
