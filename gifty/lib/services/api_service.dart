import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../databases/DBGift.dart';

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

  Future<List<Map<String, dynamic>>> fetchGifts() async {
    final response = await http.get(Uri.parse('$baseUrl/gifts.get'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['gifts'];
    } else {
      throw Exception('Failed to load gifts');
    }
  }

  Future<void> addGift(Map<String, dynamic> newGift) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/gifts.add'),
        body: {'new_gift': json.encode(newGift)},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to add gift');
      }
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
    List? remote_data = await fetchGifts();

    if (remote_data != null) {
      await DBGift.syncGifts(remote_data as List<Map<String, dynamic>>);
      return true;
    }
    return false;
  }
}
