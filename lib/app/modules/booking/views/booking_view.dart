import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Charger'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.startTimeController,
              decoration: const InputDecoration(
                labelText: 'Start Time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.endTimeController,
              decoration: const InputDecoration(
                labelText: 'End Time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.arrivalTimeController,
              decoration: const InputDecoration(
                labelText: 'Arrival Time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Pass stationId and chargerId to checkBooking method
                controller.checkBooking(
                  Get.arguments['selectedStationId'],
                  Get.arguments['selectedChargerId'],
                ); // Replace with actual stationId and chargerId
              },
              child: const Text('Make Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
