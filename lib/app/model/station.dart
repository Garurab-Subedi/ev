// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);

import 'dart:convert';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

String stationToJson(Station data) => json.encode(data.toJson());

class Station {
  final String? message;
  final List<RandomStation>? randomStation;

  Station({
    this.message,
    this.randomStation,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        message: json["message"],
        randomStation: json["randomStation"] == null
            ? []
            : List<RandomStation>.from(
                json["randomStation"]!.map((x) => RandomStation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "randomStation": randomStation == null
            ? []
            : List<dynamic>.from(randomStation!.map((x) => x.toJson())),
      };
}

class RandomStation {
  final int? stationId;
  final String? title;
  final String? openingtime;
  final String? images;
  final String? chagerType;
  final int? totalPorts;
  final int? availablePorts;
  final dynamic logoUrl;
  final int? rating;
  final int? ratingCount;
  final bool? isAvailable;
  final String? stationMessage;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? code;

  RandomStation({
    this.stationId,
    this.title,
    this.openingtime,
    this.images,
    this.chagerType,
    this.totalPorts,
    this.availablePorts,
    this.logoUrl,
    this.rating,
    this.ratingCount,
    this.isAvailable,
    this.stationMessage,
    this.latitude,
    this.longitude,
    this.address,
    this.code,
  });

  factory RandomStation.fromJson(Map<String, dynamic> json) => RandomStation(
        stationId: json["stationId"],
        title: json["title"],
        openingtime: json["openingtime"],
        images: json["images"],
        chagerType: json["chagerType"],
        totalPorts: json["totalPorts"],
        availablePorts: json["availablePorts"],
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        isAvailable: json["isAvailable"] == 1,
        stationMessage: json["StationMessage"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "stationId": stationId,
        "title": title,
        "openingtime": openingtime,
        "images": images,
        "chagerType": chagerType,
        "totalPorts": totalPorts,
        "availablePorts": availablePorts,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "isAvailable": isAvailable,
        "StationMessage": stationMessage,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "code": code,
      };
}

class Images {
  final String? type;
  final List<int>? data;

  Images({
    this.type,
    this.data,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        type: json["type"],
        data: json["data"] == null
            ? []
            : List<int>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
