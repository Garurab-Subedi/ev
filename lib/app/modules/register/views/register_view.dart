import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/shared/theme.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  final registerController = Get.put(RegisterController());

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create your Account',
                    style: semibold.copyWith(
                      fontSize: 18,
                      color: darkerBlack,
                    ),
                  ),
                  Text('Create your account to start a journey',
                      style: regular.copyWith(
                        fontSize: 10,
                        color: Colors.black,
                      )),
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
                        image: AssetImage('assets/images/onboarding4.png'),
                        scale: 1)),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: GetBuilder<RegisterController>(builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
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
                          controller: controller.usernameController,
                          autocorrect: false,
                          style: regular.copyWith(
                            fontSize: 12,
                            color: darkerBlack,
                          ),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(16, 0, 16, 10),
                              hintText: 'Enter Your Username'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                              hintText: ' Enter a password'),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () => controller.checkRegister,
                        child: const SizedBox(
                          height: 50,
                          child: Center(
                            child: Text('Register'),
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
                            'Already have a account?',
                            style:
                                regular.copyWith(fontSize: 12, color: darkGrey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.LOG_IN);
                            },
                            child: Text(
                              'Sing In',
                              style:
                                  regular.copyWith(fontSize: 12, color: purple),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }),
              ),
            ],
          )),
    );
  }
}
