import 'package:ev/app/model/chager.dart';
import 'package:ev/app/modules/station_details/controllers/station_details_controller.dart';
import 'package:ev/app/model/station.dart';

import 'package:ev/app/widgets/Custome_marker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:ripple_wave/ripple_wave.dart';

import 'package:ev/app/widgets/api_osrm.dart';
import 'package:ev/app/widgets/consts.dart';

class StationDetailsView extends StatelessWidget {
  final RandomStation selectedStation;
  final StationDetailsController controller =
      Get.put(StationDetailsController());

  Charger? selectedCharger;

  StationDetailsView({Key? key, required this.selectedStation})
      : super(key: key);

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<List<LatLng>> fetchPolyline(LatLng start, LatLng end) async {
    ApiOSRM api = ApiOSRM();
    try {
      List<LatLng>? polylinePoints = await api.getRoutes(
          start.longitude.toString(),
          start.latitude.toString(),
          end.longitude.toString(),
          end.latitude.toString());
      return polylinePoints ?? [];
    } catch (e) {
      print('Error fetching polyline: $e');
      return [];
    }
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
              onTap: () => Get.back(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back, size: 20, color: Colors.black),
                    Text(
                      'Details',
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  border: Border.all(color: white),
                ),
                child: const Icon(Icons.favorite_outline_rounded,
                    color: black, size: 20),
              ),
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration:
                      const BoxDecoration(color: blue, shape: BoxShape.circle),
                  child: Text('2', style: roboto.copyWith(color: white)),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder<Position>(
        future: getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error fetching location: ${snapshot.error}'));
          } else {
            Position currentLocation = snapshot.data!;
            LatLng start =
                LatLng(currentLocation.latitude, currentLocation.longitude);
            LatLng end =
                LatLng(selectedStation.latitude!, selectedStation.longitude!);

            return FutureBuilder<List<LatLng>>(
              future: fetchPolyline(start, end),
              builder: (context, polylineSnapshot) {
                if (polylineSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (polylineSnapshot.hasError) {
                  return Center(
                      child: Text(
                          'Error fetching polyline: ${polylineSnapshot.error}'));
                } else {
                  List<LatLng> polylinePoints = polylineSnapshot.data!;

                  return Column(
                    children: [
                      // Top half of the screen: Map view
                      Expanded(
                        child: FlutterMap(
                          options: MapOptions(center: end, zoom: 15.0),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            ),
                            PolylineLayer(
                              polylines: [
                                Polyline(
                                  points: polylinePoints,
                                  color: Colors.blue,
                                  strokeWidth: 5.0,
                                ),
                              ],
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
                              markers: [
                                Marker(
                                  point: end,
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
                                      selectedStation.title!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Divider and TabView with "Info" and "Charger"
                      const Divider(),
                      DefaultTabController(
                        length: 2,
                        child: Expanded(
                          child: Column(
                            children: [
                              const TabBar(
                                tabs: [
                                  Tab(
                                    text: "Info",
                                  ),
                                  Tab(
                                    text: "Charger",
                                  ),
                                ],
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.black,
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    // Info tab: Station information and facilities
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              selectedStation.title!,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Description: ${selectedStation.address}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Facilities: ${selectedStation.availablePorts}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Obx is used to observe chagerDetails from the controller
                                    SingleChildScrollView(
                                      child: Obx(() {
                                        // Observe chagerDetails from the controller
                                        Chagerdetails? chagerDetails =
                                            controller.chagerDetails.value;

                                        // Check if data is loading
                                        if (controller.isLoading.value) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }

                                        // Filter chargers based on selected station ID
                                        List<Charger>? filteredChargers =
                                            chagerDetails?.chargers
                                                ?.where((charger) =>
                                                    charger.stationId ==
                                                    selectedStation.stationId)
                                                .toList();

                                        // Check if there are any chargers for the selected station
                                        if (filteredChargers == null ||
                                            filteredChargers.isEmpty) {
                                          return const Center(
                                              child: Text(
                                                  'Charger not available on this station'));
                                        }

                                        // Define a way to handle when a charger is selected
                                        // For example, you can update selectedCharger when a charger is tapped

                                        // Display list of filtered chargers with containers to separate each item
                                        return SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    filteredChargers.length,
                                                itemBuilder: (context, index) {
                                                  Charger charger =
                                                      filteredChargers[index];

                                                  // Create a container to separate each charger list item
                                                  return GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10,
                                                          horizontal: 13),
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 2,
                                                            blurRadius: 6,
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      child: ListTile(
                                                        title: Text(
                                                          'Charger ID: ${charger.chargerId}',
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        subtitle: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    'Charger Type: ${charger.chargerType}',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child: Text(
                                                                    'Status: ${charger.status}',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    'Charger Status: ${charger.chargerStatus}'),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                      'Booking Price: Rs${charger.price}',
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              'Power: ${charger.power}',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            const SizedBox(
                                                                height: 8),
                                                            ElevatedButton(
                                                              onPressed: charger
                                                                          .chargerStatus ==
                                                                      'Booking'
                                                                  ? null // Disable button if charger is booking
                                                                  : () {
                                                                      if (charger
                                                                              .chargerStatus ==
                                                                          'Booking') {
                                                                        // Display Snackbar when attempting to book an already booked charger
                                                                        Get.snackbar(
                                                                          'Booking',
                                                                          'Charger already booked',
                                                                          snackPosition:
                                                                              SnackPosition.BOTTOM,
                                                                          backgroundColor:
                                                                              Colors.red,
                                                                          colorText:
                                                                              Colors.white,
                                                                        );
                                                                      } else {
                                                                        // Navigate to booking page if the charger is available
                                                                        Get.toNamed(
                                                                          '/booking',
                                                                          arguments: {
                                                                            'selectedStationId':
                                                                                selectedStation.stationId,
                                                                            'selectedChargerId':
                                                                                charger.chargerId,
                                                                          },
                                                                        );
                                                                      }
                                                                    },
                                                              child: Text(charger
                                                                          .chargerStatus ==
                                                                      'Booking'
                                                                  ? 'Booked'
                                                                  : 'Book Charger'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
