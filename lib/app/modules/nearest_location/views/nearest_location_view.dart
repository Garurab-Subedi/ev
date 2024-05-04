import 'package:carousel_slider/carousel_slider.dart';
import 'package:ev/app/model/station.dart';
import 'package:ev/app/modules/home/controllers/home_controller.dart';
import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/widgets/Custome_marker.dart';
import 'package:ev/app/widgets/consts.dart';
import 'package:ev/app/widgets/nearest_location.dart';
import 'package:ev/app/widgets/zoom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:geocoding/geocoding.dart';

import '../controllers/nearest_location_controller.dart';

class NearestLocationView extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final nearestController = Get.put(NearestLocationController());
  final MapController mapController = MapController(); // Add map controller

  NearestLocationView({super.key});

  Future<String> _getLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        return placemarks.first.locality ?? 'Unknown Location';
      }
    } catch (e) {
      print('Error reverse geocoding: $e');
    }
    return 'Unknown Location';
  }

  Future<Position> _getCurrentLocation() async {
    bool permissionGranted = await Geolocator.isLocationServiceEnabled();
    if (!permissionGranted) {
      return Future.error("Location services are disabled");
    }

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 165,
        leading: Row(
          children: [
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.HOME),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.black,
                    ),
                    Text(
                      'Nearest location',
                      style: roboto.copyWith(fontSize: 10, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  border: Border.all(color: white),
                ),
                child: const Icon(
                  CupertinoIcons.slider_horizontal_3,
                  color: black,
                  size: 15,
                ),
              ),
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: roboto.copyWith(color: white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder<Position>(
        future: _getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error fetching location: ${snapshot.error}'));
          } else {
            Position currentLocation = snapshot.data!;
            return FutureBuilder<String>(
              future: _getLocationName(
                  currentLocation.latitude, currentLocation.longitude),
              builder: (context, locationNameSnapshot) {
                if (locationNameSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (locationNameSnapshot.hasError) {
                  return Center(
                      child: Text(
                          'Error fetching location name: ${locationNameSnapshot.error}'));
                } else {
                  final currentLocationName = locationNameSnapshot.data;

                  return Obx(() {
                    return Stack(
                      children: [
                        FlutterMap(
                          mapController: mapController,
                          options: MapOptions(
                            center: LatLng(currentLocation.latitude,
                                currentLocation.longitude),
                            zoom: 13.0,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  width: 120,
                                  height: 28,
                                  point: LatLng(currentLocation.latitude,
                                      currentLocation.longitude),
                                  alignment: Alignment.topCenter,
                                  child: RippleWave(
                                    color: blue,
                                    child: CustomMarker(
                                      color: white,
                                      widget1: Positioned(
                                        right: 0,
                                        child: Image.asset(
                                          'assets/bmw_i8.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      widget2: const Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Icon(
                                          Icons.radar_rounded,
                                          color: blue,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            MarkerLayer(
                              markers:
                                  homeController.stationList.map((station) {
                                return Marker(
                                  point: LatLng(
                                      station.latitude!, station.longitude!),
                                  width: 15,
                                  height: 15,
                                  child: CustomMarker(
                                    color: Colors.red,
                                    widget1: const Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    widget2: Text(
                                      station.title!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const ZoomButton(
                              alignment: Alignment(1, -.75),
                              maxZoom: 19,
                              minZoom: 5,
                              padding: 5,
                            ),
                          ],
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 5,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 0, 5, 2.5),
                                child: Card(
                                  color: CupertinoColors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.place_rounded,
                                          size: 6,
                                          color: white,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          currentLocationName ??
                                              'Unknown Location',
                                          style: roboto.copyWith(
                                            color: white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              CarouselSlider.builder(
                                itemCount: homeController.stationList.length,
                                itemBuilder: (context, index, realIndex) {
                                  final station =
                                      homeController.stationList[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigate to StationDetailsView with the selected station as an argument
                                        Get.toNamed(Routes.STATION_DETAILS,
                                            arguments: station);
                                      },
                                      child: NearestLocationItem(
                                        station: station,
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  viewportFraction: 0.9,
                                  aspectRatio: 16 / 7,
                                  padEnds: false,
                                  onPageChanged: (index, reason) {
                                    final selectedStation =
                                        homeController.stationList[index];
                                    final stationLocation = LatLng(
                                        selectedStation.latitude!,
                                        selectedStation.longitude!);
                                    mapController.move(stationLocation, 13.0);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
                }
              },
            );
          }
        },
      ),
    );
  }
}
