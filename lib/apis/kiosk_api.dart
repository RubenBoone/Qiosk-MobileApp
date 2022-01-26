import 'package:http/http.dart' as http;
import 'package:qiosk/globals.dart';
import 'dart:convert';
import '../models/user.dart';
import '../models/kiosk.dart';

class KioskApi {
  static String server = apiServer;
 
 static Future<List<User>> fetchUsers() async {
    var url = Uri.parse(server+'/users');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<List<Kiosk>> fetchKiosks() async {
    var url = Uri.parse(server+'/kiosks');

    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((kiosk) => Kiosk.fromJson(kiosk)).toList();
    } else {
      throw Exception('Failed to load Kiosks');
    }
  }
}