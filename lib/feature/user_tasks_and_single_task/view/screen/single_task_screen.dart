import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/constants/text_style.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../data/model/task_model.dart';
import '../../data/model/task_status_enum.dart';
import '../widget/buildPercentIndicator.dart';

class SingleTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  const SingleTaskScreen({super.key, required this.taskModel});

  @override
  State<SingleTaskScreen> createState() => _SingleTaskScreenState();
}

class _SingleTaskScreenState extends State<SingleTaskScreen> {
  var initValue = TaskStatus.newTask;
  TaskStatus taskStatus = TaskStatus.newTask;
  List statusList = [
    'New',
    'Processing',
    'Canceled',
    'Completed',
    'Not Completed',
    'Expired',
  ];
  List<TaskStatus> taskStatusList = [
    TaskStatus.newTask,
    TaskStatus.processing,
    TaskStatus.canceled,
    TaskStatus.completed,
    TaskStatus.notCompleted,
    TaskStatus.expired,
  ];

  @override
  Widget build(BuildContext context) {
    var taskModel = widget.taskModel;
    return Scaffold(
      appBar: BuildCustomAppBar(
        widgets: [
          buildPercentIndicator(
              value: '9/10', percent: 0.4, color: Colors.green),
          SizedBox(
            width: 8.w,
          ),
          buildPercentIndicator(
              value: '8/10', percent: 0.6, color: Colors.orangeAccent),
          SizedBox(
            width: 8.w,
          ),
          buildPercentIndicator(
              value: '7/10', percent: 0.8, color: Colors.redAccent),
          SizedBox(
            width: 8.w,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            SizedBox(height: 28.h),
            Text(
              maxLines: 2,
              taskModel.name!,
              style: Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 160.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff7C808A),
              ),
              child: Center(
                child: Text(
                  'IMAGE',
                  style: Style.textStyle60
                      .copyWith(color: const Color(0xff091E4A)),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Text(
                  'Assigned by',
                  style: Style.textStyle20.copyWith(color: kTextColor),
                ),
                const Spacer(),
                Text(
                  'Due date',
                  style: Style.textStyle20.copyWith(color: kTextColor),
                ),
                const Icon(Icons.edit, color: kTextColor),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Text(
                  taskModel.creator!.name!,
                  style:
                      Style.textStyle20.copyWith(fontWeight: FontWeight.bold , color: kTextColor),
                ),
                const Spacer(),
                Text(
                  taskModel.startDate!,
                  style:
                      Style.textStyle20.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 120.h,
              child: GridView.builder(
                itemCount: statusList.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 8 / 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return buildStatusContainer(
                      statusList[index], taskStatusList[index]);
                },
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  taskModel.description!,
                  style:
                      Style.textStyle20.copyWith(fontWeight: FontWeight.bold , overflow: TextOverflow.visible),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Tap to edit',
                  style: Style.textStyle11.copyWith(color: kTextColor),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              AppStrings.designA20minute,
              style: Style.textStyle12
                  .copyWith(color: kTextColor, overflow: TextOverflow.visible),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusContainer(String title, TaskStatus taskStatus) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), border: Border.all()),
      child: Row(
        children: [
          Radio<TaskStatus>(
            value: initValue,
            groupValue: taskStatus,
            onChanged: (value) {
              setState(() {
                initValue = taskStatus;
              });
            },
          ),
          Text(title),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
