import 'package:flutter/material.dart';
import 'package:travel_app/services/api_services.dart';

class User extends ChangeNotifier {
  String email = "";
  String pwd = "";
  bool isLoading = false;
  Map user = {"username": "", "password": ""};
  //login
  Future login(user) async {
    const String apiEndPoint = '/login';
    isLoading = true;
    notifyListeners();
    var result = await attemptLogIn(apiEndPoint, user);
    isLoading = false;
    notifyListeners();
    return result;
  }

  Future<String?> signIn(String emailTxt, String pwdTxt) async {
    email = emailTxt;
    pwd = pwdTxt;
    String? re = await attemptLogIn(email, pwd);
    notifyListeners();

    return re;
  }

  Future<int?> signUp(String emailTxt, String pwdTxt) async {
    email = emailTxt;
    pwd = pwdTxt;
    int re = await attemptSignUp(email, pwd);
    notifyListeners();

    return re;
  }
}
