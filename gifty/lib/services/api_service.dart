import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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

  Future<void> inserUser(Map<String , dynamic> userData) async{
    try{
       final response = await http.post(
        Uri.parse('$baseUrl/api/insert_user'),
        body: json.encode(userData),
         headers: {'Content-Type': 'application/json'},
       );

        if (response.statusCode != 200) {
        throw Exception('Failed to insert user into Supabase');
      }

    }catch(e){
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
}
