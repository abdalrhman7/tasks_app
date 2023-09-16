import 'package:flutter/material.dart';
import 'package:task_app/core/constants/app_color.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: kMainColor,),);
  }
}