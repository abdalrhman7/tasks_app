import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';
import 'package:task_app/feature/deparment/data/model/manger_model.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/defaultTextFormFiled.dart';
import '../../business_logic/update_deparment_cubit/update_department_cubit.dart';
import '../widgets/drop_down.dart';

class UpdateDepartmentScreen extends StatefulWidget {
  const UpdateDepartmentScreen({super.key});

  @override
  State<UpdateDepartmentScreen> createState() => _UpdateDepartmentScreenState();
}

class _UpdateDepartmentScreenState extends State<UpdateDepartmentScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  String? mangerId;
  String? departmentName = 'Department5';

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UpdateDepartmentCubit>(context);
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
                    color: const Color(0xff7C808A),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        BlocConsumer<UpdateDepartmentCubit,
                            UpdateDepartmentState>(listener: (context, state) {
                          // TODO: implement listener
                        }, builder: (context, state) {
                          if (state is UpdateDepartmentLoading) {
                            return const CircularProgressIndicator();
                          }
                          return DropDownMenuComponent(
                            hint: ' name',
                            items: cubit.departments,
                            onChanged: (value) {
                            },
                          );
                        }),
                        SizedBox(height: 20.h),
                        BlocConsumer<UpdateDepartmentCubit,
                            UpdateDepartmentState>(listener: (context, state) {
                          // TODO: implement listener
                        }, builder: (context, state) {
                          if (state is UpdateDepartmentLoading) {
                            return const CircularProgressIndicator();
                          }
                          return DropDownMenuComponent(
                            hint: 'Assigned Manger',
                            items: cubit.mangers,
                            onChanged: (value) {
                              mangerId = value;
                              print(
                                  '${mangerId}666666666666666666666666666666666');
                            },
                          );
                        }),
                        SizedBox(height: 20.h),
                        buildBlocConsumerMainButton(cubit),
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

  Widget buildNameTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _nameController,
      label: AppStrings.name,
      validate: (value) => MyValidators.nameValidator(value),
      textInputAction: TextInputAction.done,
    );
  }

  Widget buildBlocConsumerMainButton(UpdateDepartmentCubit cubit) {
    return MainButton(
      onTap: () {
        validateAndSubmit(cubit);
      },
      color: kMainColor,
      text: AppStrings.update,
    );
  }

  void validateAndSubmit(UpdateDepartmentCubit cubit) {
    if (_formKey.currentState!.validate()) {
      cubit.updateDepartment(
        name: 'Department5',
        mangerId: mangerId!,
      );
    }
  }
}
