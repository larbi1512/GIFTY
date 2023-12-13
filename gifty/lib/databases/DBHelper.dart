import 'dart:async';
import 'DBGifts_tags.dart';
import 'DBProductColor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'DBGift.dart';
import 'DBProvider.dart';
import 'DBProviders_tags.dart';
import 'DBTags.dart';
import 'DBUser.dart';
import 'DBUser_favorites.dart';
import 'DBcategory.dart';
import 'DBimage.dart';

class DBHelper {
  static const _database_name = "GIFTY.db";
  static const _database_version = 16;
  static var database;

  static Future getDatabase() async {
    if (database != null) {
      return database;
    }
    List sql_create_code = [
      DBUser.sql_code,
      DBProvider.sql_code,
      DBGift.sql_code,
      DBCategory.sql_code,
      DBImage.sql_code,
      DBTags.sql_code,
      DBProvidersTags.sql_code,
      DBGiftsTags.sql_code,
      DBProductColor.sql_code,
      DBUserFavorits.sql_code,
    ];
    database = openDatabase(
      join(await getDatabasesPath(), _database_name),
      onCreate: (database, version) {
        for (var sql_code in sql_create_code) database.execute(sql_code);
      },
      version: _database_version,
      onUpgrade: (database, oldVersion, newVersion) {
        print(">>>>>>>>>>>>>$oldVersion vs $newVersion");
        if (oldVersion != newVersion) {
          database.execute('DROP TABLE IF EXISTS providers_tags');
          database.execute('DROP TABLE IF EXISTS user_favorits');
          database.execute('DROP TABLE IF EXISTS users');
          database.execute('DROP TABLE IF EXISTS providers');
          database.execute('DROP TABLE IF EXISTS images');
          database.execute('DROP TABLE IF EXISTS categories');
          database.execute('DROP TABLE IF EXISTS tags');
          database.execute('DROP TABLE IF EXISTS product_color');
          database.execute('DROP TABLE IF EXISTS gifts');

          for (var sql_code in sql_create_code) database.execute(sql_code);
        }
      },
    );
    return database;
  }
}
