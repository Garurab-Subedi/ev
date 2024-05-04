// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final int? userId;
  final String? username;
  final String? email;
  final String? password;
  final dynamic profile;
  final int? verification;
  final String? otp;
  final String? userType;
  final String? address;

  User({
    this.userId,
    this.username,
    this.email,
    this.password,
    this.profile,
    this.verification,
    this.otp,
    this.userType,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["UserID"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        profile: json["profile"],
        verification: json["verification"],
        otp: json["otp"],
        userType: json["userType"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "username": username,
        "email": email,
        "password": password,
        "profile": profile,
        "verification": verification,
        "otp": otp,
        "userType": userType,
        "address": address,
      };
}
