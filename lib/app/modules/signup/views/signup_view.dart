import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/shared/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello there',
                        style: semibold.copyWith(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Please enter your phone number. You will receive an OPT code in the next step fo the verfivation process',
                        style: regular.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Phone number',
                        style: semibold.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your mobile number',
                                labelText: 'Moble number'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'I agree to EVPoint Public \nAgreement,Terms, Privacy, \nPolicy and confirm that I am \nover 18 years old',
                                style: regular.copyWith(
                                    fontSize: 12, color: darkGrey),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.OTP);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: Get.width * 0.9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              child: Text(
                                'Continue',
                                style: semibold.copyWith(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
