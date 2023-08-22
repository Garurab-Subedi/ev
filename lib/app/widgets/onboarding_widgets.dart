import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/theme.dart';

class onBoardingWidgets extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  const onBoardingWidgets({
    super.key,
    this.image,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Column(children: [
        Container(
          height: Get.height * 0.60,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('$image'), scale: 1)),
        ),
        Container(
          height: Get.height * 0.30,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.white),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$title',
                style: semibold.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('$subtitle',
                  style: regular.copyWith(fontSize: 12, color: darkGrey),
                  textAlign: TextAlign.center),
            ],
          ),
        )
      ]),
    );
  }
}
