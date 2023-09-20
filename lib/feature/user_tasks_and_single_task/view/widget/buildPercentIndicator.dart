import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget buildPercentIndicator(
    {required String value, required double percent, required Color color}) {
  return SizedBox(
    height: 5.h,
    child: CircularPercentIndicator(
      radius: 25.0,
      lineWidth: 8,
      percent: percent,
      center: Text(value),
      progressColor: color,
    ),
  );
}