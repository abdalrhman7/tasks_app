import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';

Widget buildCalendarTimeline() {
  return CalendarTimeline(
    showYears: true,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 1, 15),
    lastDate: DateTime(2028, 11, 20),
    onDateSelected: (date) => print(date),
    leftMargin: 20,
    monthColor: kMainColor,
    dayColor: kMainColor,
    dayNameColor: Colors.white,
    activeDayColor: Colors.white,
    activeBackgroundDayColor: kMainColor,
    dotsColor: Colors.white,
    locale: 'en',
  );
}