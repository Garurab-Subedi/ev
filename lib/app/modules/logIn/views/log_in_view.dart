import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/shared/theme.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  LogInView({Key? key}) : super(key: key);

  final loginController = Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: semibold.copyWith(fontSize: 18, color: darkerBlack),
                  ),
                  Text(
                    'Login to countinue your journey ',
                    style: regular.copyWith(fontSize: 12, color: darkerBlack),
                  ),
                ],
              ),
            ),
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 221,
                width: 221,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/onboarding4.png'))),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: GetBuilder<LogInController>(builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Email',
                        style: semibold.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        // width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: lineStroke,
                          ),
                        ),
                        child: TextField(
                          controller: controller.emailController,
                          autocorrect: false,
                          style: regular.copyWith(
                            fontSize: 12,
                            color: darkerBlack,
                          ),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(16, 0, 16, 10),
                              hintText: 'Enter Your Email'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        ' Password',
                        style: semibold.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        // width: Get.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: lineStroke,
                          ),
                        ),
                        child: TextField(
                          controller: controller.passwordController,
                          autocorrect: false,
                          obscureText: true,
                          style: regular.copyWith(
                            fontSize: 12,
                            color: darkerBlack,
                          ),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(16, 0, 16, 10),
                              hintText: 'Enter your password'),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.REGISTER);
                            },
                            child: Text(
                              'Forget Password?',
                              style:
                                  regular.copyWith(fontSize: 12, color: purple),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: controller.checklogin,
                        child: const SizedBox(
                          height: 50,
                          child: Center(
                            child: Text('logIn'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account',
                            style:
                                regular.copyWith(fontSize: 12, color: darkGrey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.REGISTER);
                            },
                            child: Text(
                              'Singup',
                              style:
                                  regular.copyWith(fontSize: 12, color: purple),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }),
              )
            ],
          )),
    );
  }
}
