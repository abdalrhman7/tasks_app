import 'package:flutter/material.dart';

import 'constants/text_style.dart';


ThemeData themeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xffF3FAF9),
    primaryColor: Colors.red,
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: const Color(0xffF3FAF9),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: Style.textStyle18.copyWith(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: Theme.of(context).textTheme.titleMedium,
      focusedBorder: const OutlineInputBorder(
       // borderRadius: BorderRadius.circular(2.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        //borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
       // borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      errorBorder: const OutlineInputBorder(
       // borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        //borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  );
}
