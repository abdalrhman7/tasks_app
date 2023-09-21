import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';
import 'package:task_app/feature/add_new_task/business_logic/get_all_user_cubit/add_task_cubit.dart';
import 'package:task_app/feature/add_new_task/data/add_task_model/add_task_model.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/function/main_dialog.dart';
import '../../../../core/utilities/enum.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/defaultTextFormFiled.dart';
import '../../../../core/widgets/drop_down.dart';
import '../../../add_and_update_user/business_logic/add_new_user_cubit/add_new_user_cubit.dart';
import '../../../add_and_update_user/business_logic/get_all_user_cubit/get_all_user_cubit.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AddNewTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  DateRangePickerController datePikerController = DateRangePickerController();
  UserTypes userType = UserTypes.admin;

  String? employeeId;
  String? status = 'ahmed';

  @override
  void initState() {
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getAllUserCubit = BlocProvider.of<GetAllUserCubit>(context);
    var cubit = BlocProvider.of<AddTaskCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 50.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    AppStrings.addNewTask,
                    style: Style.textStyle30,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.createANewTask,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: kTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SfDateRangePicker(
                  controller: datePikerController,
                  todayHighlightColor: kMainColor,
                  selectionColor: kMainColor,
                  startRangeSelectionColor: kMainColor,
                  endRangeSelectionColor: kMainColor,
                  rangeSelectionColor: const Color(0xff5A55CA),
                  view: DateRangePickerView.month,
                  monthViewSettings:
                      const DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
                  selectionMode: DateRangePickerSelectionMode.range,
                  showActionButtons: true,
                ),
                //SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildTitleTextFormFiled(),
                        SizedBox(height: 20.h),
                        buildDescriptionTextFormFiled(),
                        SizedBox(height: 20.h),
                        BlocConsumer<GetAllUserCubit, GetAllUserState>(
                            listener: (context, state) {
                          // TODO: implement listener
                        }, builder: (context, state) {
                          if (state is AddNewUserLoading) {
                            return const CircularProgressIndicator();
                          }
                          return DropDownMenuComponent(
                            hint: 'Select User',
                            items: getAllUserCubit.usersList,
                            onChanged: (value) {},
                          );
                        }),
                        SizedBox(height: 20.h),
                        buildBlocConsumerMainButton(cubit),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _nameController,
      label: AppStrings.title,
      validate: (value) => MyValidators.nameValidator(value),
      //   type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildDescriptionTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _descriptionController,
      label: AppStrings.description,
      validate: (value) => MyValidators.nameValidator(value),
      // type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildBlocConsumerMainButton(AddTaskCubit cubit) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          MainDialog(
            context: context,
            title: 'success',
            content: 'Task Added successfully',
          ).showAlertDialog();
        }
        if (state is AddTaskFailure) {
          MainDialog(
            context: context,
            title: 'Error',
            content: state.errMessage,
          ).showAlertDialog();
        }
      },
      builder: (context, state) {
        return MainButton(
          onTap: () {
            validateAndSubmit(cubit);
          },
          text: AppStrings.create,
        );
      },
    );
  }

  void validateAndSubmit(AddTaskCubit cubit) {
    var startData = datePikerController.selectedRange?.startDate;
    var endData = datePikerController.selectedRange?.endDate;
    if (_formKey.currentState!.validate()) {
      AddTaskModel addTaskModel = AddTaskModel(
          name: _nameController.text,
          description: _descriptionController.text,
          startDate: "${startData?.year}-${startData?.month}-${startData?.day}",
          endDate: "${endData?.year}-${endData?.month}-${endData?.day}");
      cubit.addTask(addTaskModel: addTaskModel);
    }
  }
}
