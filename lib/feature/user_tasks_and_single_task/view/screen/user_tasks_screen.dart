import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/constants/text_style.dart';
import 'package:task_app/core/function/main_dialog.dart';
import 'package:task_app/core/widgets/CustomCircularProgressIndicator.dart';
import 'package:task_app/feature/user_tasks_and_single_task/business_logic/get_all_task_cubit/get_all_task_cubit.dart';
import 'package:task_app/feature/user_tasks_and_single_task/data/model/task_model.dart';
import 'package:task_app/feature/user_tasks_and_single_task/view/widget/task_card.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/drawer.dart';
import '../widget/buildPercentIndicator.dart';
import '../widget/build_calendar_time_line.dart';

class UserTasksScreen extends StatefulWidget {
  const UserTasksScreen({super.key});

  @override
  State<UserTasksScreen> createState() => _UserTasksScreenState();
}

class _UserTasksScreenState extends State<UserTasksScreen> {
  List<TaskModel> tasks = [];
  @override
  void initState() {
    BlocProvider.of<GetAllTaskCubit>(context).getAllTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          children: [
            buildCalendarTimeline(),
            SizedBox(height: 12.h),
            Expanded(
              child: BlocConsumer<GetAllTaskCubit, GetAllTaskState>(
                listener: (context, state) {
                  if (state is GetAllTaskFailure) {
                    MainDialog(
                        context: context,
                        title: 'Error',
                        content: state.errMessage);
                  }
                },
                builder: (context, state) {
                  if (state is GetAllTaskSuccess) {
                    tasks = state.tasks;
                    return buildTaskCardListView();
                  } else {
                    return const CustomCircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTaskCardListView() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: tasks.length,
      separatorBuilder: (context, index) => SizedBox(height: 8.h),
      itemBuilder: (context, index) => TaskCard(taskModel: tasks[index]),
    );
  }
}
