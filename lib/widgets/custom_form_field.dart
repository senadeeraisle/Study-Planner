import 'package:flutter/material.dart';
import 'package:study_planner/constants/colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String hintText;
  const CustomFormField({
    super.key,
    required this.textEditingController,
    this.validator,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darkGreen),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
