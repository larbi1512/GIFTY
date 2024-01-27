import 'package:gifty/constants/endpoints.dart';
import 'package:gifty/databases/DBProductColor.dart';
import 'package:gifty/services/api_service.dart';
import 'package:sqflite/sqflite.dart';
import '../config/assets.config.dart';
import 'DBHelper.dart';
import 'DBUser_favorites.dart';
import 'DBimage.dart';

class DBGift {
  static const tableName = 'gifts';
  static ApiService apiService = ApiService(api_endpoint);

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
        MAX(images.imagePath) as imagePath,
        MAX(images.type) as type
        FROM ${tableName}
        LEFT JOIN images ON gifts.remote_id = images.product_id
        GROUP BY gifts.id
        ORDER BY gifts.name ASC
          ''');

    List<Map<String, dynamic>> data = [];
    for (int i = 0; i < res.length; i++) {
      data.add(Map.of(res[i]));
      data[i]['isFavorite'] =
          await DBUserFavorits.isInUserFavorites(res[i]['id'], 1);
    }
    print('\nooooooooooooooooooo $data');
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
          where gifts.remote_id=${id}
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
      print("uuuuuuuuuuuuuuuuuuu $image");
      images.add({'imagePath': image['imagePath'], 'type': image['type']});
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

     int providerId = data['provider_id'];
     print("before : ");
     print(providerId);
     Map<String, dynamic> providerInfo = await apiService.fetchItemProvider(providerId);
     print("after : ");


    // List<Map<String, dynamic>> providerInfo = await database.rawQuery('''SELECT 
    //         id ,
    //         store_name,
    //         location,
    //         brand_pic
    //       from providers
    //       where id=${data['provider_id']}
    //       order by id ASC
    //       ''');
    print("   ");
    print("**********************************$providerInfo");

    // data['providerInfo'] = {
    //   'brand_pic': providerInfo['brand_pic'],
    //   'store_name': providerInfo['store_name'],
    //   'location': providerInfo['location']
    // };

    data['imageList'] = images;

    data['colorsList'] = colors;
    data['isFavorite'] = await DBUserFavorits.isInUserFavorites(data['id'], 1);
    data['providerInfo'] = {
      'brand_pic': providerInfo['provider_info']['brand_pic'],
      'store_name': providerInfo['provider_info']['store_name'],
      'location': providerInfo['provider_info']['location']
    };

    // data['providerInfo'] = Map.of(providerInfo[0]);
    print("data : ");
    print("\n******************$data \n");
    return data;
  }

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
        MAX(images.imagePath) as imagePath,
        MAX(images.type) as type
        FROM ${tableName}
        LEFT JOIN images ON gifts.remote_id = images.product_id
        LEFT JOIN product_color ON gifts.remote_id = product_color.product_id
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
    print("data in get by keyword: $data");
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

  // static Future<bool> syncGifts(List<dynamic> remote_data) async {
  //   List local_data = await getAllGifts();
  //   Map index_remote = {};
  //   List local_ids = [];
  //   for (Map item in local_data) {
  //     index_remote[item['remote_id']] = item['id'];
  //     local_ids.add(item['id']);
  //   }

  //   for (Map item in remote_data) {
  //     print("\nitem in remote: $item");
  //     if (index_remote.containsKey(item['id'])) {
  //       int local_id = index_remote[item['id']];
  //       await updateRecord(local_id, {
  //         'name': item['name'],
  //         'description': item['description'],
  //         'price': item['price'],
  //         'category': item['category']
  //       });

  //       await DBProductColor.deleteColors(item['id']);
  //       for (var color in item['colors']) {
  //         Map<String, dynamic> mapColor = {
  //           'color': color['color'],
  //           'product_id':
  //               // id
  //               color['product_id']
  //         };
  //         print(
  //             "\n************** DBProductColor.insertRecord(mapColor) $mapColor \n");
  //         await DBProductColor.insertRecord(mapColor);
  //       }

  //       await DBImage.deleteImages(item['id']);
  //       for (Map<String, dynamic> img in item['images']) {
  //         // img['product_id'] = local_id.toString();
  //         print("\n************** DBImage.insertRecord(img) $img \n");
  //         await DBImage.insertRecord(img);
  //       }

  //       local_ids.remove(local_id);
  //     } else {
  //       print(
  //           "\n************** insertRecord(item as Map<String, dynamic> $item \n");
  //       await insertRecord(item as Map<String, dynamic>
  //           //   {
  //           //   'name': item['name'],
  //           //   'description': item['description'],
  //           //   'price': item['price'],
  //           //   'provider_id': item['provider_id'],
  //           //   'category': item['category'],
  //           //   'remote_id': item['id']

  //           // }
  //           );
  //     }
  //   }
  //   //Remote Local gifts...
  //   //There is a RISK ? in case items pending with old data?
  //   for (int local_id in local_ids) await deleteRecord(local_id);
  //   return true;
  // }

  static Future<bool> syncGifts(List<dynamic> remote_data) async {
    List local_data = await getAllGifts();
    for (Map item in local_data) {
      deleteRecord(item['id']);
    }

    var limit = 20;
    var counter = 0;

    for (Map item in remote_data) {
      print("\nitem in remote: $item");
      await DBProductColor.deleteColors(item['id']);
      await DBImage.deleteImages(item['id']);
      await insertRecord(item as Map<String, dynamic>);
      counter = counter + 1;
      if (counter >= limit) {
        break;
      }
    }
    return true;
  }

  static Future<bool> updateRecord(int id, Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    database.update(tableName, data, where: "id=?", whereArgs: [id]);
    return true;
  }

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();

    print('\nparameter data0: $data');

    String cat = "gifts";
    // String cat = (await DBProvider.getCategory(data['provider_id'])) ;

    Map<String, dynamic> prodData = {
      'remote_id': data['id'],
      'name': data['name'],
      'description': data['description'],
      'price': data['price'],
      'provider_id': data['provider_id'],
      'category': data['category'] ?? cat,
    };

    print('\nprodData : $prodData');

    //{name: utr, company_data: {id: 1, name: Hamoud, remote_id: 1}, type: Bread, images: [{type: file, imagePath: /data/user/0/com.example.product_information_collection/cache/scaled_66986a42-4e0c-4879-9f1b-2ccba70650138265343296283913485.jpg}]}
    int id = await database.insert(tableName, prodData,
        conflictAlgorithm: ConflictAlgorithm.replace);

    //  if(data['images'] == null){
    //     data['images'] = {
    //       "imagePath" : "assets/images/book.png",
    //     };
    //   }
    print('\nparameter data of images: ${data['images']}');

    for (Map<String, dynamic> img in data['images']) {
      // img['product_id'] = id.toString();
      var imgInsert = {
        'create_date': img['create_date'],
        'imagepath': img['imagepath'],
        'product_id': img['product_id'],
        'type': img['type']
      };
      await database.insert(DBImage.tableName, imgInsert,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    for (var color in data['colors']) {
      Map<String, dynamic> mapColor = {
        'color': color['color'],
        'product_id':
            // id
            color['product_id']
      };
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
