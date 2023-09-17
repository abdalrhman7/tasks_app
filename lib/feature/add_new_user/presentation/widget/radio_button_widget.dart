import 'package:flutter/material.dart';

import '../../../../core/utilities/enum.dart';

class RadioButtonsWidget extends StatefulWidget {
  const RadioButtonsWidget({super.key});

  @override
  State<RadioButtonsWidget> createState() => _RadioButtonsWidgetState();
}

class _RadioButtonsWidgetState extends State<RadioButtonsWidget> {
  UserTypes userTypes = UserTypes.admin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all()),
          child: Row(
            children: [
              Radio<UserTypes>(
                value: UserTypes.admin,
                groupValue: userTypes,
                onChanged: (value) {
                  setState(() {
                    userTypes = value!;
                  });
                },
              ),
              const Text('Admin'),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all()),
          child: Row(
            children: [
              Radio<UserTypes>(
                value: UserTypes.manager,
                groupValue: userTypes,
                onChanged: (value) {
                  setState(() {
                    userTypes = value!;
                  });
                },
              ),
              const Text('Manager'),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all()),
          child: Row(
            children: [
              Radio<UserTypes>(
                value: UserTypes.user,
                groupValue: userTypes,
                onChanged: (value) {
                  setState(() {
                    userTypes = value!;
                  });
                },
              ),
              const Text('User'),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}