import 'package:gifty/databases/DBProductColor.dart';
import 'package:gifty/databases/DBProvider.dart';
import 'package:gifty/databases/DBcategory.dart';
import 'package:sqflite/sqflite.dart';
import '../config/assets.config.dart';
import 'DBHelper.dart';
import 'DBUser_favorites.dart';
import 'DBimage.dart';

class DBGift {
  static const tableName = 'gifts';

  static const sql_code = '''CREATE TABLE IF NOT EXISTS gifts (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             remote_id INTEGER,
             name TEXT,
             description TEXT,
             price REAL,
             provider_id INTEGER,
             category TEXT,
             create_date TEXT
           )
       ''';

  static Future<List<Map<String, dynamic>>> getAllGifts() async {
    final database = await DBHelper.getDatabase();

    var res = await database.rawQuery('''SELECT 
        gifts.id,
        gifts.name,
        gifts.remote_id,
        gifts.description,
        gifts.price,
        gifts.category,
        MAX(images.imagePath) as imagePath
        FROM ${tableName}
        LEFT JOIN images ON gifts.id = images.product_id
        GROUP BY gifts.id
        ORDER BY gifts.name ASC
          ''');

    List<Map<String, dynamic>> data = [];
    for (int i = 0; i < res.length; i++) {
      data.add(Map.of(res[i]));
      data[i]['isFavorite'] =
          await DBUserFavorits.isInUserFavorites(res[i]['id'], 1);
    }
    return data;
  }

  static Future<Map<String, dynamic>?> getProductById(int id) async {
    final database = await DBHelper.getDatabase();

    List<Map<String, dynamic>> res = await database.rawQuery('''SELECT 
            gifts.id ,
            gifts.name,
            gifts.description,
            gifts.price,
            gifts.provider_id,
            gifts.category,
            gifts.remote_id
          from ${tableName}
          where gifts.id=${id}
          ''');

    if (res == null) return null;
    Map<String, dynamic> data = Map.of(res[0]);
    List<Map<String, dynamic>> resImg = await database.rawQuery('''SELECT 
            images.id ,
            images.type,
            images.imagePath
          from images
          where product_id=${id}
          order by id ASC
          ''');

    var images = [];
    for (Map image in resImg) {
      images.add(image['imagePath']);
    }

    List<Map<String, dynamic>> resClrs = await database.rawQuery('''SELECT 
            product_color.id ,
            product_color.color
          from product_color
          where product_id=${id}
          order by id ASC
          ''');

    var colors = [];
    for (Map color in resClrs) {
      colors.add(color['color']);
    }

    List<Map<String, dynamic>> providerInfo = await database.rawQuery('''SELECT 
            id ,
            store_name,
            location,
            brand_pic
          from providers
          where id=${data['provider_id']}
          order by id ASC
          ''');

    print("*****************$providerInfo");

    // data['providerInfo'] = {
    //   'brand_pic': providerInfo['brand_pic'],
    //   'store_name': providerInfo['store_name'],
    //   'location': providerInfo['location']
    // };

    data['imageList'] = images;

    data['colorsList'] = colors;
    data['isFavorite'] = await DBUserFavorits.isInUserFavorites(data['id'], 1);
    data['providerInfo'] = {
      'brand_pic': Assets.images.providerImage,
      'store_name': "Bahdja telecom",
      'location': "Baba hsen, Algiers"
    };

    // data['providerInfo'] = Map.of(providerInfo[0]);
    return data;
  }

  // static Future<List<Map<String, dynamic>>> getgiftsToUpload() async {
  //   final database = await DBHelper.getDatabase();

  //   return database.rawQuery('''SELECT
  //           gifts.id as local_id,
  //           gifts.name,
  //           gifts.barcode,
  //           gifts.remote_id,
  //           categories.remote_id as category_id,
  //           companies.remote_id as company_id
  //         from ${tableName}
  //             left join categories on category_id=categories.id
  //             left join companies on company_id=companies.id
  //         order by gifts.name ASC
  //         ''');
  // }

  static Future<List<Map<String, dynamic>>> getAllProductsByKeyword(
      String keyword) async {
    print("kkkkkkkkkkkkkkkk$keyword");
    if (keyword.isEmpty || keyword.trim() == '') return getAllGifts();

    final database = await DBHelper.getDatabase();

    var res = await database.rawQuery('''SELECT 
        gifts.id,
        gifts.name,
        gifts.remote_id,
        gifts.description,
        gifts.price,
        gifts.category,
        product_color.color,
        MAX(images.imagePath) as imagePath
        FROM ${tableName}
        LEFT JOIN images ON gifts.id = images.product_id
        LEFT JOIN product_color ON gifts.id = product_color.product_id
        where LOWER(gifts.name) like '%${keyword.toLowerCase()}%' 
        OR LOWER(gifts.description) LIKE '%${keyword.toLowerCase()}%'
        OR LOWER(gifts.category) LIKE '%${keyword.toLowerCase()}%'
        OR LOWER(product_color.color) LIKE '%${keyword.toLowerCase()}%'
        GROUP BY gifts.id
        ORDER BY gifts.name ASC
          ''');

    List<Map<String, dynamic>> data = [];
    for (int i = 0; i < res.length; i++) {
      data.add(Map.of(res[i]));
      data[i]['isFavorite'] =
          await DBUserFavorits.isInUserFavorites(res[i]['id'], 1);
    }
    return data;
  }

  static Future<int> getAllCount() async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
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

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();

    String cat = "gifts";
    // String cat = (await DBProvider.getCategory(data['provider_id'])) ;

    Map<String, dynamic> prodData = {
      'name': data['name'],
      'description': data['description'],
      'price': data['price'],
      'provider_id': data['provider_id'],
      'category': cat,
    };

    //{name: utr, company_data: {id: 1, name: Hamoud, remote_id: 1}, type: Bread, images: [{type: file, imagePath: /data/user/0/com.example.product_information_collection/cache/scaled_66986a42-4e0c-4879-9f1b-2ccba70650138265343296283913485.jpg}]}
    int id = await database.insert(tableName, prodData,
        conflictAlgorithm: ConflictAlgorithm.replace);

    //  if(data['images'] == null){
    //     data['images'] = {
    //       "imagePath" : "assets/images/book.png",
    //     };
    //   }

    for (Map<String, dynamic> img in data['images']) {
      img['product_id'] = id.toString();
      await database.insert(DBImage.tableName, img,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    for (String color in data['colors']) {
      Map<String, dynamic> mapColor = {'color': color, 'product_id': id};
      await database.insert(DBProductColor.tableName, mapColor,
          conflictAlgorithm: ConflictAlgorithm.replace);
      // await DBProductColor.insertRecord(mapColor);
    }

    // Map<String, dynamic> category = {'name': cat};
    // await database.insert(DBCategory.tableName, category,
    //     conflictAlgorithm: ConflictAlgorithm.replace);
    print("fffffffffff$data dddddddddddddddddd$prodData");

    return id;
  }

  static Future<bool> deleteRecord(int id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery("""delete from  ${tableName}  where id=?""", [id]);
    return true;
  }
}