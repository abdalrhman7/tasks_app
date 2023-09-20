import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_app/core/app_route/router.dart';

import '../../../../core/utilities/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void startTimer() {
    Timer(const Duration(milliseconds: 100), () {
      navigateUser();
    });
  }

  void navigateUser() async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    flutterSecureStorage.read(key: 'token').then((value) {
      if (value != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.getAllDepartmentScreen);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.authScreen);
      }
    });
  }
}
