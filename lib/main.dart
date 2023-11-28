import 'package:ed_tech/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'values/app_theme.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'values/app_constants.dart';
import 'values/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EdTech Assignment',
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.homeScreen,
      navigatorKey: AppConstants.navigationKey,
      routes: {
        AppRoutes.homeScreen: (context) => HomePage(),
        AppRoutes.loginScreen: (context) => const LoginPage(),
        AppRoutes.registerScreen: (context) => RegisterPage(),
      },
    );
  }
}
