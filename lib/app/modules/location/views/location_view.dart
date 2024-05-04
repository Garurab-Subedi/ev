import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Location'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              // controller: locationNameController,
              controller: controller.locationNameController,
              decoration: const InputDecoration(
                labelText: 'Location Name',
              ),
            ),
            TextField(
              // controller: latitudeController,
              controller: controller.latitudeController,
              decoration: const InputDecoration(
                labelText: 'Latitude',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.longitudeController,
              // controller:
              decoration: const InputDecoration(
                labelText: 'Longitude',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.addLocation(),
              child: const Text('Add Location'),
            ),
          ],
        ),
      ),
    );
  }
}
