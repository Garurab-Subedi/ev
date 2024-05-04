import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/shared/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../widgets/onboarding_widgets.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.indicator,
            onPageChanged: ((value) {
              controller.page.value = value;
              print(controller.page.value);
            }),
            children: const [
              // ignore: sized_box_for_whitespace
              // onBoardingWidgets(
              //   image: 'assets/images/onbaording3.png',
              //   title: '',
              //   subtitle:
              //       'Carchargo is peer-peer EV charging network that lets you access other electric vehicle owner chargers and earn money be renting out yours',
              // ),
              onBoardingWidgets(
                image: 'assets/images/onbaording2.png',
                title: 'Find and locate charging stations neay you',
                subtitle:
                    'Find available charging points easily and reserve your charging spot.',
              ),
              onBoardingWidgets(
                image: 'assets/images/onboarding1.png',
                title: 'Sit back and relax, let your EV charge',
                subtitle:
                    'Reach the charging station at your time and charge your EV vehicle comfortably.',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0.8, -0.87),
            child: GestureDetector(
                onTap: () {
                  controller.indicator.jumpToPage(3);
                },
                child: const Text('Skip')),
          ),
          Obx(
            () => Container(
              alignment: const Alignment(0, 0.90),
              child: controller.page.value != 1
                  ? SmoothPageIndicator(
                      controller: controller.indicator,
                      count: 2,
                      effect: const SlideEffect(
                          activeDotColor: Colors.blue,
                          dotColor: Colors.black38,
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 8.0,
                          radius: 4.0),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.LOG_IN);
                      },
                      child: Container(
                        height: 55,
                        width: Get.width * 0.9,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue),
                        child: Text(
                          'Getting started',
                          style: semibold.copyWith(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
