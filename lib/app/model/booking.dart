// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  final List<UserBooking>? userBookings;

  Booking({
    this.userBookings,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        userBookings: json["userBookings"] == null
            ? []
            : List<UserBooking>.from(
                json["userBookings"]!.map((x) => UserBooking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userBookings": userBookings == null
            ? []
            : List<dynamic>.from(userBookings!.map((x) => x.toJson())),
      };
}

class UserBooking {
  final int? bookingId;
  final int? userId;
  final int? stationId;
  final int? chargerId;
  final String? startTime;
  final String? endTime;
  final String? arrivalTime;
  final String? paymentStatus;
  final String? paymentMethod;
  final int? paymentAmount;
  final String? bookingStatus;

  UserBooking({
    this.bookingId,
    this.userId,
    this.stationId,
    this.chargerId,
    this.startTime,
    this.endTime,
    this.arrivalTime,
    this.paymentStatus,
    this.paymentMethod,
    this.paymentAmount,
    this.bookingStatus,
  });

  factory UserBooking.fromJson(Map<String, dynamic> json) => UserBooking(
        bookingId: json["BookingID"],
        userId: json["UserID"],
        stationId: json["stationId"],
        chargerId: json["ChargerID"],
        startTime: json["StartTime"],
        endTime: json["EndTime"],
        arrivalTime: json["ArrivalTime"],
        paymentStatus: json["PaymentStatus"],
        paymentMethod: json["PaymentMethod"],
        paymentAmount: json["PaymentAmount"],
        bookingStatus: json["BookingStatus"],
      );

  Map<String, dynamic> toJson() => {
        "BookingID": bookingId,
        "UserID": userId,
        "stationId": stationId,
        "ChargerID": chargerId,
        "StartTime": startTime,
        "EndTime": endTime,
        "ArrivalTime": arrivalTime,
        "PaymentStatus": paymentStatus,
        "PaymentMethod": paymentMethod,
        "PaymentAmount": paymentAmount,
        "BookingStatus": bookingStatus,
      };
}
