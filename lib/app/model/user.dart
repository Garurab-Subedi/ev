// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  final String? username;
  final String? email;
  final String? password;
  final String? role;

  Users({
    this.username,
    this.email,
    this.password,
    this.role,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "role": role,
      };
}
