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

    if (response.statusCode == 200) {
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

  Future <Map<String, dynamic>> fetchItemProvider( int provider_id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/get_item_provider?provider_id=$provider_id'));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        print(decodedData);
        return  decodedData;
      } else {
        throw Exception('Failed to load provider data from Supabase');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
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

