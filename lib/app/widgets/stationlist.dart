import 'package:cached_network_image/cached_network_image.dart';
import 'package:ev/app/modules/home/controllers/home_controller.dart';
import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/utils/baseurl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationList extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  // Function to generate image URL

  StationList({
    Key? key,
  }) : super(key: key); // Accessing HomeController

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Obx widget listens to changes in observables and rebuilds the UI accordingly
      if (homeController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(), // Show a loading indicator
        );
      } else {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              // Navigate to StationDetailsView with the station ID as a parameter
              Get.toNamed(Routes.NEAREST_LOCATION);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Station Image - CachedNetworkImage
                    CachedNetworkImage(
                      imageUrl:
                          getImageUrl(homeController.stationList[index].images),
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    // Image.network(
                    //     getImageUrl(homeController.stationList[index].images),
                    //     width: 80,
                    //     height: 80,
                    //     fit: BoxFit.cover),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            homeController.stationList[index]
                                .title!, // Accessing station title from the controller
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Charger Type: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  homeController.stationList[index].chagerType!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Address: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  homeController.stationList[index].address!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rating: ${homeController.stationList[index].ratingCount}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Available: ${homeController.stationList[index].isAvailable ?? false ? "true" : "false"}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          itemCount: homeController
              .stationList.length, // Use the length of the stationList
        );
      }
    });
  }
}
