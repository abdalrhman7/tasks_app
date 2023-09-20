import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/text_style.dart';
import 'package:task_app/feature/departmen/business_logic/get_all_deparment_cubit/get_all_department_cubit.dart';
import 'package:task_app/feature/departmen/data/model/department_model.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/drawer.dart';
import '../widgets/defult_tap_controller.dart';
import '../widgets/department_user.dart';

class GetAllDepartmentScreen extends StatefulWidget {
  const GetAllDepartmentScreen({super.key});

  @override
  State<GetAllDepartmentScreen> createState() => _GetAllDepartmentScreenState();
}

class _GetAllDepartmentScreenState extends State<GetAllDepartmentScreen> {
  List<DepartmentModel> departments = [];

  @override
  void initState() {
    BlocProvider.of<GetAllDepartmentCubit>(context).getAllDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildCustomAppBar(widgets: [
        Padding(
          padding: EdgeInsets.only(right: 18.r, top: 8.r, bottom: 8.r),
          child: Container(
            width: 42.w,
            //height: 10.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xff5A55CA),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ]),
      drawer: const AppDrawer(),
      body: BlocBuilder<GetAllDepartmentCubit, GetAllDepartmentState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<GetAllDepartmentCubit>(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Column(
              children: [
                if (state is GetAllDepartmentLoading)
                  const CustomCircularProgressIndicator(),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.departments.length,
                    itemBuilder: (context, index) => DepartmentUsersWidget(
                      department: cubit.departments[index],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
