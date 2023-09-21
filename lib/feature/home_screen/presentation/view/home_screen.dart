import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/feature/home_screen/data/model/department_model.dart';

import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../departmen/presentation/widgets/department_user.dart';
import '../../business_logic/home_screen_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DepartmentModel> departments = [];

  @override
  void initState() {
    BlocProvider.of<HomeScreenCubit>(context).getAllDepartment();
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
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeScreenCubit>(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Column(
              children: [
                if (state is HomeScreenLoading)
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
