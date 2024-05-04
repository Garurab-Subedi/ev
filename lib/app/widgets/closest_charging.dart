import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class ClosestChargingBanner extends StatelessWidget {
  const ClosestChargingBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 30 / 15,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.centerRight,
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: 200,
                child: FlutterMap(
                    options: MapOptions(initialCenter: currentLocation),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      ),
                      MarkerLayer(markers: [
                        Marker(
                            point: currentLocation,
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: blue),
                                child: const Icon(Icons.near_me,
                                    size: 18, color: white)))
                      ])
                    ]),
              ),
              Positioned(
                top: -50,
                left: -50,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration:
                      const BoxDecoration(color: white, shape: BoxShape.circle),
                ),
              ),
              Positioned(
                left: 10,
                top: 15,
                bottom: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find closest\ncharging station',
                      style: roboto.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.NEAREST_LOCATION);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Get Direction',
                            style: roboto.copyWith(fontSize: 13, color: white),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
