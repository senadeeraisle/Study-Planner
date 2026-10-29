import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner/constants/colors.dart';
import 'package:study_planner/widgets/custom_button.dart';

class MainPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Study Planner",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomButton(
                      onPressed: () =>
                          GoRouter.of(context).push("/add_new_course"),
                      title: "Add Course",
                      icon: Icons.add,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
