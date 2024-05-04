// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  final LocationClass? location;

  Location({
    this.location,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        location: json["location"] == null
            ? null
            : LocationClass.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
      };
}

class LocationClass {
  final int? locationId;
  final int? userId;
  final String? locationName;
  final double? latitude;
  final double? longitude;
  final DateTime? createdAt;

  LocationClass({
    this.locationId,
    this.userId,
    this.locationName,
    this.latitude,
    this.longitude,
    this.createdAt,
  });

  factory LocationClass.fromJson(Map<String, dynamic> json) => LocationClass(
        locationId: json["LocationID"],
        userId: json["UserID"],
        locationName: json["LocationName"],
        latitude: json["Latitude"]?.toDouble(),
        longitude: json["Longitude"]?.toDouble(),
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "LocationID": locationId,
        "UserID": userId,
        "LocationName": locationName,
        "Latitude": latitude,
        "Longitude": longitude,
        "CreatedAt": createdAt?.toIso8601String(),
      };
}
