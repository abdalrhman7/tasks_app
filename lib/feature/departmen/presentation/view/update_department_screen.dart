import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/defaultTextFormFiled.dart';
import '../../../home_screen/business_logic/home_screen_cubit.dart';
import '../../business_logic/update_deparment_cubit/update_department_cubit.dart';
import '../../../../core/widgets/drop_down.dart';

class UpdateDepartmentScreen extends StatefulWidget {
  const UpdateDepartmentScreen({super.key});

  @override
  State<UpdateDepartmentScreen> createState() => _UpdateDepartmentScreenState();
}

class _UpdateDepartmentScreenState extends State<UpdateDepartmentScreen> {
  String? mangerId;
  String? departmentName = 'Department5';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UpdateDepartmentCubit>(context);
    var getAllDepartment = BlocProvider.of<HomeScreenCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    AppStrings.updateDepartment,
                    style: Style.textStyle30,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.updateDepartmentDetails,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: kTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                  child: Column(
                    children: [
                      DropDownMenuComponent(
                        hint: ' name',
                        items: getAllDepartment.departments,
                        onChanged: (value) {
                          // departmentName = value;
                          // print(departmentName);
                        },
                      ),
                      SizedBox(height: 20.h),
                      BlocBuilder<UpdateDepartmentCubit, UpdateDepartmentState>(
                          builder: (context, state) {
                        if (state is UpdateDepartmentLoading) {
                          return const CircularProgressIndicator();
                        }
                        return DropDownMenuComponent(
                          hint: 'Assigned Manger',
                          items: cubit.mangers,
                          onChanged: (value) {
                            mangerId = value;
                          },
                        );
                      }),
                      SizedBox(height: 20.h),
                      buildBlocConsumerMainButton(cubit),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBlocConsumerMainButton(UpdateDepartmentCubit cubit) {
    return MainButton(
      onTap: () {
        cubit.updateDepartment(
          name: 'Department5',
          mangerId: mangerId!,
        );
      },
      color: kMainColor,
      text: AppStrings.update,
    );
  }
}
