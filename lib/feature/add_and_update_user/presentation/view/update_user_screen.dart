import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';
import 'package:task_app/feature/add_and_update_user/data/model/update_user_model.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/function/main_dialog.dart';
import '../../../../core/utilities/enum.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widgets/defaultTextFormFiled.dart';
import '../../../../core/widgets/drop_down.dart';
import '../../business_logic/add_new_user_cubit/add_new_user_cubit.dart';
import '../../business_logic/get_all_user_cubit/get_all_user_cubit.dart';
import '../../business_logic/update_user_cubit/update_user_cubit.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<UpdateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  String? departmentId;
  String name = 'hassan';

  UserTypes userType = UserTypes.admin;
  var initValue = UserTypes.admin;
  UserTypes taskStatus = UserTypes.admin;
  List usersList = [
    'Admin',
    'Manager',
    'User',
  ];
  List<UserTypes> usersTypesList = [
    UserTypes.admin,
    UserTypes.manager,
    UserTypes.user,
  ];

  @override
  void initState() {
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getAllUserCubit = BlocProvider.of<GetAllUserCubit>(context);
    var updateUserCubit = BlocProvider.of<UpdateUserCubit>(context);
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
                        BlocConsumer<GetAllUserCubit, GetAllUserState>(
                            listener: (context, state) {
                          // TODO: implement listener
                        }, builder: (context, state) {
                          if (state is AddNewUserLoading) {
                            return const CircularProgressIndicator();
                          }
                          return DropDownMenuComponent(
                            hint: ' name',
                            items: getAllUserCubit.usersList,
                            onChanged: (value) {},
                          );
                        }),
                        SizedBox(height: 18.h),
                        buildEmailTextFormFiled(),
                        SizedBox(height: 18.h),
                        buildPhoneTextFormFiled(),
                        SizedBox(height: 18.h),
                        buildPasswordTextFormFiled(),
                        SizedBox(height: 18.h),
                        BlocConsumer<GetAllUserCubit, GetAllUserState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            if (state is GetAllUserLoading) {
                              return const CircularProgressIndicator();
                            }
                            return DropDownMenuComponent(
                              hint: 'Department name',
                              items: getAllUserCubit.mangers,
                              onChanged: (value) {
                                departmentId = value;
                                print(
                                    '${departmentId}666666666666666666666666666666666');
                              },
                            );
                          },
                        ),
                        SizedBox(height: 18.h),
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120,
                            childAspectRatio: 8 / 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 4,
                          ),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return buildUserTypeRadioButtons(
                                usersList[index], usersTypesList[index]);
                          },
                        ),
                        SizedBox(height: 18.h),
                        buildBlocConsumerMainButton(updateUserCubit),
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

  Widget buildUserTypeRadioButtons(String title, UserTypes userTypes) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio<UserTypes>(
            value: initValue,
            groupValue: userTypes,
            onChanged: (value) {
              setState(() {
                initValue = userTypes!;
              });
            },
          ),
          Text(title),
        ],
      ),
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

  Widget buildBlocConsumerMainButton(UpdateUserCubit cubit) {
    return BlocConsumer<UpdateUserCubit, UpdateUserState>(
      listener: (context, state) {
        if (state is UpdateUserSuccess) {
          MainDialog(
            context: context,
            title: 'success',
            content: 'User Update successfully',
          ).showAlertDialog();
        }
        if (state is UpdateUserFailure) {
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
          color: kMainColor,
          text: AppStrings.update,
        );
      },
    );
  }

  void validateAndSubmit(UpdateUserCubit cubit) {
    if (_formKey.currentState!.validate()) {
      UpdateUserModel updateUserModel = UpdateUserModel(
        name: name,
        email: _emailController.text,
        password: _passwordController.text,
        phone: _phoneController.text,
        userType: (userType == UserTypes.admin)
            ? 0
            : (userType == UserTypes.manager)
                ? 1
                : 2,
      );
      print('${updateUserModel.phone}+++++++++++++++++++++++++++++');
      cubit.updateUser(
        updateUserModel: updateUserModel,
      );
    }
  }
}
