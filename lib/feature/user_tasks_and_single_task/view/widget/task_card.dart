import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/app_route/router.dart';
import 'package:task_app/feature/user_tasks_and_single_task/data/model/task_model.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/text_style.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.singleTaskScreen,
          arguments: {'taskModel': taskModel}),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 7,
        color: kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.status!,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.name!,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 240.w,
                        child: Text(
                          taskModel.description!,
                          style: Style.textStyle14.copyWith(color: kTextColor),
                        ),
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
                  Row(
                    children: [
                      Text(
                        'stars  ${taskModel.startDate!}',
                        style: Style.textStyle14
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '- ends ${taskModel.endDate!}',
                        style: Style.textStyle14
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
