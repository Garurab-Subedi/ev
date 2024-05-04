// To parse this JSON data, do
//
//     final chagerdetails = chagerdetailsFromJson(jsonString);

import 'dart:convert';

Chagerdetails chagerdetailsFromJson(String str) =>
    Chagerdetails.fromJson(json.decode(str));

String chagerdetailsToJson(Chagerdetails data) => json.encode(data.toJson());

class Chagerdetails {
  final List<Charger>? chargers;

  Chagerdetails({
    this.chargers,
  });

  factory Chagerdetails.fromJson(Map<String, dynamic> json) => Chagerdetails(
        chargers: json["chargers"] == null
            ? []
            : List<Charger>.from(
                json["chargers"]!.map((x) => Charger.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chargers": chargers == null
            ? []
            : List<dynamic>.from(chargers!.map((x) => x.toJson())),
      };
}

class Charger {
  final int? chargerId;
  final int? stationId;
  final String? chargerType;
  final String? status;
  final String? chargerStatus;
  final String? price;
  final DateTime? createdAt;
  final String? power;

  Charger({
    this.chargerId,
    this.stationId,
    this.chargerType,
    this.status,
    this.chargerStatus,
    this.price,
    this.createdAt,
    this.power,
  });

  factory Charger.fromJson(Map<String, dynamic> json) => Charger(
        chargerId: json["ChargerID"],
        stationId: json["stationId"],
        chargerType: json["ChargerType"],
        status: json["Status"],
        chargerStatus: json["ChargerStatus"],
        price: json["Price"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        power: json["power"],
      );

  Map<String, dynamic> toJson() => {
        "ChargerID": chargerId,
        "stationId": stationId,
        "ChargerType": chargerType,
        "Status": status,
        "ChargerStatus": chargerStatus,
        "Price": price,
        "CreatedAt": createdAt?.toIso8601String(),
        "power": power,
      };
}
