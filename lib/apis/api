import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import '../models/kiosk.dart';

class Api {
  static String server = 'https://qioskdotnetapi.azurewebsites.net/api';
 
 static Future<List<User>> fetchUsers() async {
    var url = Uri.https(server, '/users');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<List<Kiosk>> fetchKiosks() async {
    var url = Uri.https(server, '/kiosks');

    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((kiosk) => Kiosk.fromJson(kiosk)).toList();
    } else {
      throw Exception('Failed to load Kiosks');
    }
  }
}