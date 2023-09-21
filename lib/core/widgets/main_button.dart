import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';


class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool hasCircularBorder;
  final Color? color;

  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.hasCircularBorder = false,  this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: kMainColor,
          shape: hasCircularBorder
              ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          )
              : null,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
