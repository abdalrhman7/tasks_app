import 'package:flutter/material.dart';

class DefaultTextFormFiled extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator<String> validate;
  TextInputType? type;
  String? label;
  String? hintText;
  bool isPassword = false;
  TextInputAction textInputAction;
  DefaultTextFormFiled({
    super.key,
    required this.controller,
    required this.validate,
    this.type,
    required this.label,
    this.hintText,
    this.isPassword = false,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      decoration: InputDecoration(
        label: Text(label!),
        hintText: hintText,
        // prefixIcon: Icon(prefix),
      ),
      textInputAction: textInputAction,
    );
  }
}
