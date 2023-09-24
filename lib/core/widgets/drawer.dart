import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_route/router.dart';
import '../../feature/auth/business_logic/auth_cubit.dart';
import '../app_route/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userType = BlocProvider.of<AuthCubit>(context).getUserType();

    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 42.h),
          if (userType == 'admin' || userType == 'manager')
          Column(
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.departmentScreen),
                child: const ListTile(
                  title: Text(
                    'New Department',
                  ),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRoutes.updateDepartmentScreen),
                child: const ListTile(
                  title: Text(
                    'Update Department',
                  ),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
              ),
            ],
          ),
          if (userType == 'admin' || userType == 'manager')
          Column(
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.addNewUserScreen),
                child: const ListTile(
                  title: Text(
                    'add new user',
                  ),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
              ),
            ],
          ),
          if (userType == 'admin' || userType == 'manager')
          Column(
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.updateUserScreen),
                child: const ListTile(
                  title: Text(
                    'update user',
                  ),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.userTaskScreen),
                child: const ListTile(
                  title: Text(
                    'user task',
                  ),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
              ),
            ],
          ),
          if (userType == 'admin' || userType == 'manager')
          Column(
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.addNewTaskScreen),
                child: const ListTile(
                  title: Text(
                    'Add New Task',
                  ),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 2,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.authScreen, (route) => false);
            },
            child: const ListTile(
              title: Text(
                'log out',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
