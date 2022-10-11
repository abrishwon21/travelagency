import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/models/activity.dart';
import 'package:travel_app/models/tour_model.dart';

const SERVER_IP = 'http://192.168.1.167:5000';
final storage = FlutterSecureStorage();

Future attemptLogIn(apiEndPoint, user) async {
  var res = await http.post(
    Uri.parse("http://127.0.0.1:8000/auth" "$apiEndPoint"),
    body: json.encode(user),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (res.statusCode == 201) {
    // storage.write(key: "jwt", value: res.body);
    var body = json.decode(res.body);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = body['user']['id'];
    await prefs.setString('token', body['token']);
    await prefs.setInt('id', id);
    return "Successfully Logged In";
    // var email = json.decode(res.body)['user']['email'];
    // return res.body;
  } else {
    return 'bad credentials';
  }

  return null;
}

Future<int> attemptSignUp(String username, String password) async {
  var res = await http.post(Uri.parse('http://127.0.0.1:8000/auth/signup/'),
      body: {"username": username, "password": password});
  return res.statusCode;
}

// fetching activities
Future getActivities(apiEndPoint) async {
  var res =
      await http.get(Uri.parse('http://127.0.0.1:8000/tours' '$apiEndPoint'));
  if (res.statusCode == 200) {
    final item = json.decode(res.body) as List;
    List<Activity> act = item.map((e) => Activity.fromJson(e)).toList();
    return act;
  }else{

  }
  return res.statusCode;
}
// fetching tours
// fetching activities
Future getTours(apiEndPoint) async {
  var res =
      await http.get(Uri.parse('http://127.0.0.1:8000' '$apiEndPoint'));
  if (res.statusCode == 200) {
    final item = json.decode(res.body) as List;
    List<Tour> tour = item.map((e) => Tour.fromJson(e)).toList();
    return tour;
  }else{
    
  }
  return res.statusCode;
}
