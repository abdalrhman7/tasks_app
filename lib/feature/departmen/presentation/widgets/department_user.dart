import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/feature/home_screen/data/model/department_model.dart';
import 'package:task_app/feature/departmen/presentation/widgets/user_card.dart';


class DepartmentUsersWidget extends StatelessWidget {
  const DepartmentUsersWidget({super.key, required this.department});
  final DepartmentModel department;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
          child: Row(
            children: [
              Container(
                height: 1,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                department.name!,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Icon(
                Icons.edit_note_outlined,
                color: Colors.grey,
              )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount:
          (department.employees != null) ? department.employees!.length : 0,
          itemBuilder: (context, index) =>
              UserCard(employee: department.employees![index]),
        ),
      ],
    );
  }
}