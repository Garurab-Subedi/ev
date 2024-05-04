import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.screens[controller.currentIndex.value],
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: Colors.deepPurpleAccent[700],
          selectedItemColor: Colors.deepPurpleAccent,
          onTap: (int val) {
            controller.currentIndex.value = val;
          },
          currentIndex: controller.currentIndex.value,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(icon: Icons.list, title: 'Bookings'),
            FloatingNavbarItem(icon: Icons.shopping_cart, title: 'Cart'),
            FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
          ],
        ),
      ),
    );
  }
}
