import 'package:flutter/material.dart';
import 'package:study_planner/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String title;
  const CustomButton({
    super.key,
    required this.onPressed,
    this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          icon == null ? SizedBox() : Icon(icon, color: Colors.white, size: 20),
          icon == null ? SizedBox() : SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
