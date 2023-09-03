import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/shared/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/check_sign_controller.dart';

class CheckSignView extends GetView<CheckSignController> {
  const CheckSignView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width,
                  height: 275,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/onboarding4.png'),
                        scale: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(70, 10, 10, 0),
                        child: Text(
                          "Let's you in ",
                          style: semibold.copyWith(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 55,
                    width: Get.height * 0.9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blue,
                            blurRadius: 4,
                            offset: Offset(4, 8)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/google.png'),
                          )),
                        ),
                        Text(
                          'Continue with Google',
                          style: regular.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 55,
                      width: Get.height * 0.9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 4,
                              offset: Offset(4, 8)),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/facebook.png'),
                                    scale: 1.75)),
                          ),
                          Text(
                            'Continue with Facebook',
                            style: regular.copyWith(fontSize: 14),
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'or',
                  style: regular.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Container(
                    height: 55,
                    width: Get.width * 0.9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: Text(
                      'Sign In with mobile number',
                      style:
                          semibold.copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dont'n have a account?",
                style: regular.copyWith(fontSize: 12, color: darkGrey),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SIGNUP);
                },
                child: Text(
                  'Sign Up',
                  style: regular.copyWith(fontSize: 12, color: Colors.blue),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
