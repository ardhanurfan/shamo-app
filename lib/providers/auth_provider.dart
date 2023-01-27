import 'package:flutter/material.dart';
import 'package:shamoapp/models/user_model.dart';
import 'package:shamoapp/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    try {
      UserModel user = await AuthService().register(
          name: name, username: username, email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout({required String token}) async {
    try {
      return await AuthService().logout(token: token);
    } catch (e) {
      return false;
    }
  }

  Future<bool> getUser({required String token}) async {
    try {
      UserModel user = await AuthService().getUser(token: token);
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}
