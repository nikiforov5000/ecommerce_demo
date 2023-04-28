import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget{

  final String label;
  final TextEditingController controller;
  const EditTextField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Row(
          children: [
            Text(label),
          ],
        )),
        Flexible(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Enter your ${label}',
                border: InputBorder.none
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
