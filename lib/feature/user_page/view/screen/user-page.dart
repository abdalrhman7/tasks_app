import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/text_style.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/drawer.dart';
import '../widgets/defult_tap_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(widgets: [
        Padding(
          padding: EdgeInsets.only(right: 18.sp, top: 8.sp, bottom: 8.sp),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.sp),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            buildDefaultTabController(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 6,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 1,
                            width: 50,
                            color: const Color(0xff7C808A),
                          ),
                          Text(
                            'department name',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: kTextColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Color(0xff7C808A),
                            ),
                          )
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (3 / 2),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffFFFFFF),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.sp),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    height: 70.h,
                                    width: 2.w,
                                    color: const Color(0xff5A55CA),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        'Employee name',
                                        style: Style.textStyle18.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text('Admin', style: Style.textStyle12),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.mail_outline,
                                              size: 18),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Text('user mail',
                                              style: Style.textStyle12),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.phone, size: 18),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Text('user mail',
                                              style: Style.textStyle12),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

