import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:supabase/supabase.dart';

import '../databases/DBGift.dart';

var SUPABASE_URL = 'https://zkfovcmkaobvsceazqat.supabase.co';
final SupabaseClient supabase = SupabaseClient(SUPABASE_URL,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InprZm92Y21rYW9idnNjZWF6cWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2NjIwNDIsImV4cCI6MjAxODIzODA0Mn0.p7nCDkbdLK9WnfrmELj8zDk4dfTsP1DveSMHeGnrPpA');

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<dynamic>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/get_users'));

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        print("heeeeere");
        print(decodedData);
        List<dynamic> userList = decodedData['users'];
        return userList;
      } else {
        throw Exception('Failed to load data from Supabase');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> inserUser(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/insert_user'),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to insert user into Supabase');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl/api/data'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the data
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> advanced_search(
      Map<dynamic, dynamic> searchTags) async {
    var tags = [];

    if (searchTags != null && searchTags.isNotEmpty) {
      searchTags.forEach((tagName, valuesList) {
        print('aaaaaaaaaaaa tag: ($tagName): ($valuesList)');
        if (valuesList != null && valuesList.isNotEmpty) {
          // get gift_id from gift_tags where tag_name = tagName and tag_value in valuesList that have
          for (var value in valuesList) {
            tags.add({'tag_name': tagName, 'tag_value': value});
          }
        }
      });
    }

    print("\naaaaaaaaaaaaaaaaaaaa80");
    if (tags.isNotEmpty) {
      // final searchResealt = await http.post(
      //   Uri.parse('$baseUrl/gifts.getSearchResult'),
      //   body: json.encode(tags),
      //   headers: {'Content-Type': 'application/json'},
      // );
      // print('ssssss searchResealt: $searchResealt');
      // if (searchResealt.statusCode == 200) {
      //   // If the server returns a 200 OK response, parse the data
      //   print(
      //       'ssssss decoded result: ${json.decode(searchResealt.body)['gifts']}');
      //   return json.decode(searchResealt.body)['gifts'] ??
      //       [
      //         {
      //           'id': 68,
      //           'name': 'gidt dok',
      //           'remote_id': 34,
      //           'description': 'desc dok',
      //           'price': 234.0,
      //           'category': 'gifts',
      //           'imagePath': null,
      //           'type': null,
      //           'isFavorite': false
      //         }
      //       ] as List<Map<String, dynamic>>;
      // } else {
      //   // If the server did not return a 200 OK response,
      //   // throw an exception.
      //   throw Exception('Failed to load data');
      // }

      final allGifts = await fetchGifts();

      print('vvvvvvvvv allGifts: $allGifts');
      var resultGifts = [];
      for (var gift in allGifts) {
        gift['count'] = 0;
        print('vvvvvvvvv gift: $gift');
        if (gift['tags'].isNotEmpty) {
          for (var tag in gift['tags']) {
            print('vvvvvvvvv tag: $tag');
            print('vvvvvvvvv tags: $tags');
            // if (tags.contains(
            //     {'tag_name': tag['tag_name'], 'tag_value': tag['tag_value']}))
            //     searchTags.forEach((tagName, valuesList)
            for (var mytag in tags) {
              print(
                  'vvvvvvvvv tags.length: ${tags.length} tags: ${mytag['tag_name']}   ${mytag['tag_value']}');
              print('vvvvvvvvv tag: ${tag['tag_name']}   ${tag['tag_value']}');

              if (tag['tag_name'] == mytag['tag_name'] &&
                  tag['tag_value'] == mytag['tag_value']) {
                print('vvvvvvvvv0 contains gift count ${gift['count']}');
                gift['count'] = gift['count'] + 1;
                print(
                    'vvvvvvvvv1 contains gift count ${gift['count']}  ${tags.length}');
                if (gift['count'] >= tags.length || gift['count'] >= 3) {
                  print('vvvvvvvvv resultGifts2: $resultGifts');
                  print('vvvvvvvvv contains gift count ${gift['count']}');
                  print('vvvvvvvvv gift[images] ${gift['images']}');
                  gift['imagePath'] = gift['images'][0]['imagepath'];
                  gift['type'] = gift['images'][0]['type'];
                  gift['remote_id'] = gift['id'];
                  // resultGifts.add(gift);
                  print('vvvvvvvvv gift 2 ${gift}');

                  bool giftAlreadyExists = resultGifts.any((existingGift) =>
                      existingGift['id'] ==
                      gift['id']); // Replace 'id' with the actual identifier

                  print('vvvvvvvvv giftAlreadyExists ${giftAlreadyExists}');

                  if (!giftAlreadyExists) {
                    resultGifts.add(gift);
                  }

                  print('vvvvvvvvv resultGifts: $resultGifts');
                  break;
                }
              }
              ;
            }
          }
        }
      }
      print('vvvvvvvvv resultGifts: $resultGifts');
      return resultGifts;
    } else {
      // If no result
      return [];
    }
  }

  Future<Map<String, dynamic>> sendData(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/data'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to send data');
    }
  }

  Future<List<dynamic>> fetchGifts() async {
    final response = await http.get(Uri.parse('$baseUrl/gifts.get'));
    print("vvvvvvvvvvvvv${response.statusCode}");

    if (response.statusCode == 200) {
      print("uuuuuuuuuuuuuuuuuuuuuuu${json.decode(response.body)['gifts']}");
      return json.decode(response.body)['gifts'];
    } else {
      throw Exception('Failed to load gifts');
    }
  }

  Future<void> addGift(Map<String, dynamic> newGift) async {
    try {
      print("\naaaaaaaaaaaaaaaaaaaa");
      final response = await http.post(
        Uri.parse('$baseUrl/gifts.add'),
        body: json.encode(newGift),
        headers: {'Content-Type': 'application/json'},
      );

      print("\naaaaaaaaaaaaaaaaaaaa2  $response \n ${response.statusCode}");

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to add gift, statusCode: ${response.statusCode}');
      }

      String responseBody = response.body;
      print("\naaaaaaaaaaaaaaaaaaaa2.1  $responseBody \n");

      Map<String, dynamic> parsedJson = jsonDecode(responseBody);
      print("\naaaaaaaaaaaaaaaaaaaa2.2  $parsedJson \n");

      int gift_id = parsedJson['id'];
      print("\naaaaaaaaaaaaaaaaaaaa3");

      var colors = [];
      for (var color in newGift['colors']) {
        colors.add({'product_id': gift_id, 'color': color});
      }
      print("\naaaaaaaaaaaaaaaaaaaa4");

      final responseColor = await http.post(
        Uri.parse('$baseUrl/colors.add'),
        body: json.encode(colors),
        headers: {'Content-Type': 'application/json'},
      );
      print("\naaaaaaaaaaaaaaaaaaaa5");

      for (var img in newGift['images']) {
        img['product_id'] = gift_id;
        img['type'] = 'url';
        print("\naaaaaaaaaaaaaaaaaaaa5.1");
        var imageFile = File(img['imagePath']);

        // Upload the image to Supabase storage
        var imageUrl = await supabase.storage.from('gifts_images').upload(
            img['imageName'] ?? "image",
            imageFile); //need to handle existing name
        print("\naaaaaaaaaaaaaaaaaaaa5.15 \n");
        print(imageUrl);
        // img['imageUrl'] = imageUrl;
        img['imageUrl'] = '${SUPABASE_URL}//storage/v1/object/public/$imageUrl';
        print("\nurl:               ${img['imageUrl']}");
      }
      print("\naaaaaaaaaaaaaaaaaaaa6");

      final responsePaths = await http.post(
        Uri.parse('$baseUrl/images.add'),
        body: json.encode(newGift['images']),
        headers: {'Content-Type': 'application/json'},
      );

      print("\naaaaaaaaaaaaaaaaaaaa7");

      var tags = [];

      if (newGift['tags'] != null && newGift['tags'].isNotEmpty) {
        newGift['tags'].forEach((tagName, valuesList) {
          print('aaaaaaaaaaaa tag: ($tagName): ($valuesList)');
          if (valuesList != null && valuesList.isNotEmpty) {
            for (var value in valuesList) {
              tags.add({
                'gift_id': gift_id,
                'tag_name': tagName,
                'tag_value': value
              });
            }
          }
        });
      }

      print("\naaaaaaaaaaaaaaaaaaaa8");
      if (tags.isNotEmpty) {
        final responseTags = await http.post(
          Uri.parse('$baseUrl/tags.add'),
          body: json.encode(tags),
          headers: {'Content-Type': 'application/json'},
        );
      }
      print("\naaaaaaaaaaaaaaaaaaaa9");

      // print("\naaaaaaaaaaaaaaaaaaaa4");

      // final responseColor = await http.post(
      //   Uri.parse('$baseUrl/colors.add'),
      //   body: json.encode(colors),
      //   headers: {'Content-Type': 'application/json'},
      // );
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> getGiftById(int giftId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/gifts/$giftId'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['gift'];
    } else {
      throw Exception('Failed to get gift by ID');
    }
  }

  Future<void> updateGift(int giftId, Map<String, dynamic> updatedGift) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/api/gifts/$giftId'),
        body: json.encode(updatedGift),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update gift');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> deleteGift(int giftId) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/api/gifts/$giftId'));

      if (response.statusCode != 200) {
        throw Exception('Failed to delete gift');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<bool> service_sync_gifts() async {
    print("Running Cron Service to get gifts");
    List<dynamic>? remote_data = await fetchGifts();
    print("\nremote_data is : $remote_data");

    if (remote_data != null) {
      await DBGift.syncGifts(remote_data as List<dynamic>);
      return true;
    }
    return false;
  }

  // Future<String> uploadImage(imageBytes) async {
  //   try {
  //     print("\nfunction upload was called front");
  //     final response = await http
  //         .post(Uri.parse('$baseUrl/upload'), body: {'image': imageBytes});
  //     print("\nfunction upload was called back");
  //     String responseBody = response.body;
  //     print("\nfunction upload was called1");
  //     Map<String, dynamic> parsedJson = jsonDecode(responseBody);

  //     String image_url = parsedJson['image_url'];
  //     print("\nfunction upload was called2: $image_url");

  //     if (response.statusCode == 200) {
  //       final decodedData = json.decode(response.body);
  //       return image_url;
  //     } else {
  //       throw Exception('Failed to load data from Supabase');
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }

  // Future<void> uploadImage(img) async {
  //   var uri = Uri.parse('$baseUrl/upload');

  //   var imageFile = File(img['imagePath']);

  //   var stream = http.ByteStream(imageFile.openRead());
  //   var length = await imageFile.length();
  //   var multipartFile = http.MultipartFile('image', stream, length,
  //       filename: path.basename(imageFile.path));

  //   var request = http.MultipartRequest('POST', uri)..files.add(multipartFile);

  //   try {
  //     var response = await http.Response.fromStream(await request.send());

  //     if (response.statusCode == 200) {
  //       print('Image uploaded successfully');
  //       var imageUrl = response
  //           .body; // Assuming the server sends the image URL in the response
  //       print('Image uploaded successfully. URL: $imageUrl');
  //       img['imageUrl'] = imageUrl;
  //     } else {
  //       print('Failed to upload image. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error uploading image: $error');
  //   }
  // }
}
