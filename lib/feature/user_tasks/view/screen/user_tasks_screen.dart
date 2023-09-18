import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/constants/text_style.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class UserTasksScreen extends StatelessWidget {
  const UserTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        widgets: [
          buildPercentIndicator(value: '40', percent: 0.4, color: Colors.green),
          SizedBox(
            width: 8.w,
          ),
          buildPercentIndicator(
              value: '60', percent: 0.6, color: Colors.orangeAccent),
          SizedBox(
            width: 8.w,
          ),
          buildPercentIndicator(
              value: '80', percent: 0.8, color: Colors.redAccent),
          SizedBox(
            width: 8.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          children: [
            buildCalendarTimeline(),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
                itemBuilder: (context, index) => buildTaskCard(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTaskCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 7,
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New',
              style: Style.textStyle18.copyWith(color: kMainColor),
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 5,
                  height: 70,
                  color: const Color(0xff5A55CA),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a High-Intensity Interval...',
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Design a 20-minute HIIT workout routine.',
                      maxLines: 1,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'starts 12/9/2023 - ends 16/9/2023',
                  style:
                      Style.textStyle14.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

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
      //   selectableDayPredicate: (date) => date.day != 23,
      locale: 'en',
    );
  }

  Widget buildPercentIndicator(
      {required String value, required double percent, required Color color}) {
    return SizedBox(
      height: 5.h,
      child: CircularPercentIndicator(
        radius: 25.0,
        lineWidth: 8,
        percent: percent,
        center: Text('$value%'),
        progressColor: color,
      ),
    );
  }
}

// Container(
// padding:
// EdgeInsets.symmetric(horizontal: 18.sp, vertical: 8.sp),
// height: 120.h,
// width: double.infinity,
// decoration: const BoxDecoration(
// color: kWhiteColor,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(28),
// bottomRight: Radius.circular(28),
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'New',
// style: Style.textStyle16.copyWith(color: kMainColor),
// ),
// SizedBox(height: 8.h),
// Container(
// margin: const EdgeInsets.only(right: 10),
// height: 1,
// width: double.infinity,
// color: const Color(0xff7C808A),
// ),
// ],
// ),
// ),
