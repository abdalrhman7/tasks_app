import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/app_route/router.dart';
import 'package:task_app/core/widgets/CustomCircularProgressIndicator.dart';
import 'package:task_app/feature/auth/business_logic/auth_cubit.dart';
import 'package:task_app/feature/user_tasks_and_single_task/business_logic/delete_task_cubit/delete_task_cubit.dart';
import 'package:task_app/feature/user_tasks_and_single_task/business_logic/get_all_task_cubit/get_all_task_cubit.dart';
import 'package:task_app/feature/user_tasks_and_single_task/data/model/task_model.dart';

import '../../../../core/app_route/routes.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/function/main_snack_bar.dart';
import 'getStatusColor.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    String userType = BlocProvider.of<AuthCubit>(context).getUserType();
    var deleteTaskCubit = BlocProvider.of<DeleteTaskCubit>(context);
    var getAllTaskCubit = BlocProvider.of<GetAllTaskCubit>(context);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskModel.status!,
                    style: Style.textStyle18.copyWith(color: kMainColor),
                  ),
                  if (userType == 'admin' || userType == 'manager')
                    buildDeleteTaskBlocConsumer(
                        getAllTaskCubit, deleteTaskCubit),
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 70,
                    color: getStatusColor(taskModel.status!),
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

  BlocConsumer<DeleteTaskCubit, DeleteTaskState> buildDeleteTaskBlocConsumer(
      GetAllTaskCubit getAllTaskCubit, DeleteTaskCubit deleteTaskCubit) {
    return BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          mainSnackBar(context, 'Deleted task successfully');
          getAllTaskCubit.getAllTask();
        }
        if (state is DeleteTaskFailure) {
          mainSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is DeleteTaskLoading) {
          return const CustomCircularProgressIndicator();
        }
        return GestureDetector(
          onTap: () => deleteTaskCubit.deleteTask(taskId: taskModel.id!),
          child: const Icon(
            Icons.delete,
            color: kMainColor,
          ),
        );
      },
    );
  }
}
