import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';
import 'package:task_app/feature/deparment/business_logic/new_deparment_cubit/new_department_cubit.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/function/main_dialog.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/defaultTextFormFiled.dart';

class NewDepartmentScreen extends StatefulWidget {
  const NewDepartmentScreen({super.key});

  @override
  State<NewDepartmentScreen> createState() => _NewDepartmentScreenState();
}

class _NewDepartmentScreenState extends State<NewDepartmentScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NewDepartmentCubit>(context);
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
                    AppStrings.newDepartment,
                    style: Style.textStyle30,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.createANewDepartment,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: kTextColor,
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
                        buildNameTextFormFiled(),
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
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildBlocConsumerMainButton(NewDepartmentCubit cubit) {
    return BlocConsumer<NewDepartmentCubit, NewDepartmentState>(
      listener: (context, state) {
        if (state is NewDepartmentFailure) {
          MainDialog(
            context: context,
            title: 'Error',
            content: state.errMessage,
          ).showAlertDialog();
        }
      },
      builder: (context, state) {
        if (state is NewDepartmentLoading) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          onTap: () {
            validateAndSubmit(cubit);
          },
          color: kMainColor,
          text: AppStrings.create,
        );
      },
    );
  }

  void validateAndSubmit(NewDepartmentCubit cubit) {
    if (_formKey.currentState!.validate()) {
      cubit.storeDepartment(
        name: _nameController.text,
      );
    }
  }
}
