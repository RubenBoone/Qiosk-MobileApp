import 'package:http/http.dart' as http;
import 'package:qiosk/globals.dart';
import 'package:qiosk/models/userkiosk.dart';
import 'dart:convert';
import '../models/user.dart';
import '../models/kiosk.dart';

class KioskApi {
  static String server = apiServer;

  static Future<User> fetchUser(int id, String token) async {
    var url = Uri.parse(server + '/users/' + id.toString());

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<List<Kiosk>> fetchKiosks() async {
    var url = Uri.parse(server + '/kiosks');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((kiosk) => Kiosk.fromJson(kiosk)).toList();
    } else {
      throw Exception('Failed to load Kiosks');
    }
  }

  static Future<List<UserKiosk>> fetchUserKiosk(
      int userID, String token) async {
    var url = Uri.parse(server + '/userkiosks/specific/' + userID.toString());

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((userkiosk) => UserKiosk.fromJson(userkiosk))
          .toList();
    } else {
      throw Exception('Failed to load Kiosks');
    }
  }
}
