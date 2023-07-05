import 'package:flutter/material.dart';

Widget CustomTextField(String text, TextEditingController controller,){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: text,
    ),
  );
}