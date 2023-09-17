import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';
import 'package:task_app/feature/add_new_user/business_logic/add_new_user_cubit/add_new_user_cubit.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/utilities/enum.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/defaultTextFormFiled.dart';
import '../widget/radio_button_widget.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({super.key});

  @override
  State<AddNewUser> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AddNewUser> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  UserTypes userType = UserTypes.admin;

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
    var cubit = BlocProvider.of<AddNewUserCubit>(context);
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
                    AppStrings.addNewUser,
                    style: Style.textStyle30,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.createNewUserNow,
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
                        buildPhoneTextFormFiled(),
                        SizedBox(height: 20.h),
                        buildEmailTextFormFiled(),
                        SizedBox(height: 20.h),
                        buildPasswordTextFormFiled(),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all()),
                              child: Row(
                                children: [
                                  Radio<UserTypes>(
                                    value: UserTypes.admin,
                                    groupValue: userType,
                                    onChanged: (value) {
                                      setState(() {
                                        userType = value!;
                                      });
                                    },
                                  ),
                                  const Text('Admin'),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all()),
                              child: Row(
                                children: [
                                  Radio<UserTypes>(
                                    value: UserTypes.manager,
                                    groupValue: userType,
                                    onChanged: (value) {
                                      setState(() {
                                        userType = value!;
                                      });
                                    },
                                  ),
                                  const Text('Manager'),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all()),
                              child: Row(
                                children: [
                                  Radio<UserTypes>(
                                    value: UserTypes.user,
                                    groupValue: userType,
                                    onChanged: (value) {
                                      setState(() {
                                        userType = value!;
                                      });
                                    },
                                  ),
                                  const Text('User'),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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

  Widget buildEmailTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _emailController,
      label: AppStrings.email,
      validate: (value) => MyValidators.emailValidator(value),
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPhoneTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _phoneController,
      label: AppStrings.phone,
      validate: (value) => MyValidators.nameValidator(value),
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

  Widget buildBlocConsumerMainButton(AddNewUserCubit cubit) {
    return MainButton(
      onTap: () {
        validateAndSubmit(cubit);
      },
      color: kMainColor,
      text: AppStrings.create,
    );
  }

  void validateAndSubmit(AddNewUserCubit cubit) {
    // if (_formKey.currentState!.validate()) {
    //
    // }
    cubit.addNewUser(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
        userType: (userType == UserTypes.admin)
            ? 0
            : (userType == UserTypes.manager)
                ? 1
                : 2);
  }
}
