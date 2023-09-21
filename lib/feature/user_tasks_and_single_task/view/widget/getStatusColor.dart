import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';

Color getStatusColor(String status) {
  switch (status) {
    case 'new':
      return kMainColor;

    case 'processing':
      return Colors.orange;

    case 'completed':
      return Colors.teal;

    case 'notcompleted':
      return Colors.red;

    case 'canceled':
      return Colors.green;
    case 'expired':
      return Colors.redAccent;

    default:
      return const Color(0xff5a55ca);
  }
}