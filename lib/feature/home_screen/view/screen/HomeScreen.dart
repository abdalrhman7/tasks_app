import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/constants/app_color.dart';
import 'package:task_app/core/widgets/main_button.dart';
import 'package:task_app/feature/auth/business_logic/auth_cubit.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: MainButton(
          text: 'logout',
          onTap: () {
            BlocProvider.of<AuthCubit>(context).logout();
            Navigator.of(context).pop();
          },
          color: kMainColor,
        ),
      ),
    );
  }
}
