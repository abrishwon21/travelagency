// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.email,
        required this.username,
        required this.password,
    });

    String email;
    String username;
    String password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
    };
}
