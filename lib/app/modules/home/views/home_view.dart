import 'package:ev/app/modules/logIn/controllers/log_in_controller.dart';
import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/utils/shared_preds.dart';
import 'package:ev/app/widgets/button.dart';
import 'package:ev/app/widgets/closest_charging.dart';
import 'package:ev/app/widgets/searh_station.dart';
import 'package:ev/app/widgets/stationlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final LogInController _loginController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ev-point'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Guarab Subedi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Navigate to Home
                Get.back();
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile
                // Get.toNamed(Routes.PROFILE);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings
                // Get.toNamed(Routes.SETTINGS);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Handle user logout
                // SharedPrefs.clearUserData();
                _loginController.logout();
                Get.offAllNamed(Routes.LOG_IN);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SearchStation(),
                const SizedBox(height: 10),
                StationList(),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ClosestChargingBanner(),
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle logout
      //     // SharedPrefs.clearUserData();
      //     _loginController.logout();
      //     Get.offAllNamed(Routes.LOG_IN);
      //   },
      //   child: const Icon(Icons.logout),
      // ),
      bottomNavigationBar: FloatingButton(
        activeColor: Colors.blue,
        inActiveColor: Colors.blue.withOpacity(0.5),
        onChange: (index) {
          print(index);
        },
      ),
    );
  }
}
