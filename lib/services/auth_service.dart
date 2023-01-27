import 'dart:convert';

import 'package:shamoapp/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'https://shamoapp.ardhanurfan.my.id/api';

  Future<void> setTokenPreference(String token) async {
    final pref = await SharedPreferences.getInstance();
    await clearTokenPreference();
    pref.setString('token', token);
  }

  Future<String?> getTokenPreference() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }

  Future<void> clearTokenPreference() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('token')) {
      pref.clear();
    }
  }

  Future<UserModel> register(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user =
          UserModel.fromJson(data['user'], 'Bearer ${data['acess_token']}');
      await setTokenPreference(user.token);
      return user;
    } else {
      throw Exception("Gagal Register");
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user =
          UserModel.fromJson(data['user'], 'Bearer ${data['acess_token']}');
      await setTokenPreference(user.token);
      return user;
    } else {
      throw Exception("Gagal Login");
    }
  }

  Future<bool> logout({required String token}) async {
    var url = Uri.parse('$baseUrl/logout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      await clearTokenPreference();
      return true;
    } else {
      throw Exception("Gagal Logout");
    }
  }

  Future<UserModel> getUser({required String token}) async {
    var url = Uri.parse('$baseUrl/user');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data, token);
      return user;
    } else {
      throw Exception("Gagal Get User");
    }
  }
}
