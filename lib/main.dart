import 'package:ev/app/routes/app_pages.dart';
import 'package:ev/app/utils/shared_preds.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:khalti_flutter/localization/khalti_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManagement.init();
  var token = MemoryManagement.getToken();
  runApp(
    KhaltiScope(
      publicKey: 'test_public_key_6822422fee944a48a2800fc7161461f8',
      builder: (context, navigatorKey) => GetMaterialApp(
        // navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: "Application",
        defaultTransition: Transition.cupertino,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ne', 'NP'),
        ],
        localizationsDelegates: const [
          KhaltiLocalizations.delegate,
        ],
        initialRoute: token == null
            ? Routes.SPLASH_SCREEN
            //   (role != null &&

            : Routes.HOME,
        getPages: AppPages.routes,
      ),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return FutureBuilder<Map<String, dynamic>>(
//     //   future: SharedPrefs.getUserData(),
//     //   builder: (context, snapshot) {
//     //     if (snapshot.connectionState == ConnectionState.waiting) {
//     //       return const Center(child: CircularProgressIndicator());
//     //     } else {
//     //       final token = snapshot.data?['token'] ?? '';
//     //       final userType = snapshot.data?['userType'] ?? '';

//     //       // Navigate based on token and userType
//     //       final initialRoute = (token.isNotEmpty && userType.isNotEmpty)
//     //           ? Routes.HOME
//     //           : Routes.SPLASH_SCREEN;

//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: "EV",
//             initialRoute: token == null ? Routes.LOG_IN : Routes.HOME,
//             getPages: AppPages.routes,
//           );
//         }
//       },
//     );
//   }
// }
