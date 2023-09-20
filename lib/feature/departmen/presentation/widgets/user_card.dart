import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/app_color.dart';

import '../../data/model/department_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.employee});
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Row(
          children: [
            Container(
              width: 4.w,
              height: double.infinity,
              color: kMainColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.name!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6.h),
                Container(
                  color: Colors.purple.withOpacity(0.3),
                  child: Text(employee.userType!),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 16,
                    ),
                    Text(
                      employee.email!,
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_outlined,
                      size: 16,
                    ),
                    Text(employee.phone.toString())
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
