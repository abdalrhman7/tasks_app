import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/utilities/enum.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/defaultTextFormFiled.dart';
import '../widget/radio_button_widget.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<UpdateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;


  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var cubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 48.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    AppStrings.updateUserDetails,
                    style: Style.textStyle30,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.updateUserAndGiveThemIdentity,
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
                        SizedBox(height: 18.h),
                        buildEmailTextFormFiled(),
                        SizedBox(height: 18.h),
                        buildPhoneTextFormFiled(),
                        SizedBox(height: 18.h),
                        buildPasswordTextFormFiled(),
                        SizedBox(height: 18.h),
                        departmentNameTextFormFiled(),
                        SizedBox(height: 18.h),
                        const RadioButtonsWidget(),
                        SizedBox(height: 18.h),
                        buildBlocConsumerMainButton(),
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
      validate: (value) => MyValidators.emailValidator(value),
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildEmailTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _emailController,
      label: AppStrings.phone,
      validate: (value) => MyValidators.emailValidator(value),
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPhoneTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _phoneController,
      label: AppStrings.email,
      validate: (value) => MyValidators.emailValidator(value),
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPasswordTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _passwordController,
      label: AppStrings.password,
      validate: (value) => MyValidators.passwordValidator(value),
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      isPassword: true,
    );
  }

  Widget departmentNameTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _passwordController,
      label: AppStrings.departmentName,
      validate: (value) => MyValidators.passwordValidator(value),
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      isPassword: true,
    );
  }

  Widget buildBlocConsumerMainButton() {
    return MainButton(
      onTap: () {
        //validateAndSubmit(cubit);
      },
      color: kMainColor,
      text: AppStrings.create,
    );
  }

// void validateAndSubmit(AuthCubit cubit) {
//   if (_formKey.currentState!.validate()) {
//     cubit.login(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
//   }
// }
}




