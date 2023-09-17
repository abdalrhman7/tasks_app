import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_route/router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            title: const Text(
              'drawer',
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
          ),
          SizedBox(height: 8.h),
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
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(AppRoutes.addNewUserScreen),
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
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(AppRoutes.updateUserScreen),
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
    );
  }
}
