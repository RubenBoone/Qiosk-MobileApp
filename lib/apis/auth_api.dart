import 'package:http/http.dart' as http;
import 'package:qiosk/globals.dart';
import 'dart:convert';

import 'package:qiosk/models/userlogin.dart';

class AuthApi {
  static String server = apiServer;
 
  static Future<UserLogin> authenticate(UserLogin user) async {
    var url = Uri.parse(server+'/Users/authenticate');

      final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
    if (response.statusCode == 200) {
      return UserLogin.fromJson(jsonDecode(response.body));
    } else{ 
      if(response.statusCode == 400) {
         return UserLogin(userID: -1, email: "", password: "", isActive: false,isAdmin: false,token: "");
    } else 
    {
      throw Exception('Failed to authenticate');
    }}
  }

}