import 'package:flutter/material.dart';
import 'package:task_app/core/constants/app_color.dart';

void mainSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    backgroundColor: kMainColor,
    content: Text(title),
    duration: const Duration(milliseconds: 700),
  ));
}
