import 'package:ev/app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OPT code Verification',
                    style: semibold.copyWith(fontSize: 21),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We have sent an OTP code to Phone number ********09. Enter the OTP code below to continue.',
                    style: regular.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 68,
                        height: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                          onSaved: (pin1) {},
                          decoration: const InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          controller: controller.otpController,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 68,
                        height: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: const InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          controller: controller.otpController,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 68,
                        height: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: const InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          controller: controller.otpController,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 68,
                        height: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: const InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          controller: controller.otpController,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        "Didn't receive email?",
                        style: regular.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You can resend code in",
                              style: regular.copyWith(fontSize: 12)),
                          Text(
                            '48s',
                            style: regular.copyWith(
                                fontSize: 12, color: Colors.blue),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
