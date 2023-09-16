import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';

import '../../../../core/app_route/router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/function/main_dialog.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/defaultTextFormFiled.dart';
import '../../business_logic/auth_cubit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
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
                    AppStrings.welcomeBack,
                    style: Style.textStyle30,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.loginToAccessYourAssigned,
                  style: TextStyle(
                    fontSize: 20.sp,
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
                        buildEmailTextFormFiled(),
                        SizedBox(height: 20.h),
                        buildPasswordTextFormFiled(),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              AppStrings.keepMeLoggedIn,
                              style: Style.textStyle16,
                            ),
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

  Widget buildEmailTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _emailController,
      label: AppStrings.email,
      hintText: AppStrings.enterYourEmail,
      validate: (value) => MyValidators.emailValidator(value),
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  DefaultTextFormFiled buildPasswordTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _passwordController,
      label: AppStrings.password,
      hintText: AppStrings.enterYourPassword,
      validate: (value) => MyValidators.passwordValidator(value),
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      isPassword: true,
    );
  }

  Widget buildBlocConsumerMainButton(AuthCubit cubit) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          MainDialog(
            context: context,
            title: 'Error',
            content: state.errMessage,
          ).showAlertDialog();
        }
        if (state is AuthSuccess) {
          Navigator.of(context).pushNamed(AppRoutes.homeScreen);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          onTap: () {
            validateAndSubmit(cubit);
          },
          color: kMainColor,
          text: AppStrings.login,
        );
      },
    );
  }

  void validateAndSubmit(AuthCubit cubit) {
    if (_formKey.currentState!.validate()) {
      cubit.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }
}
