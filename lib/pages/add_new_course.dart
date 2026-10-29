import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner/models/course_model.dart';
import 'package:study_planner/services/course_service.dart';
import 'package:study_planner/widgets/custom_button.dart';
import 'package:study_planner/widgets/custom_form_field.dart';

class AddNewCourse extends StatelessWidget {
  AddNewCourse({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
  final TextEditingController _courseScheduleController =
      TextEditingController();
  final TextEditingController _courseDurationController =
      TextEditingController();
  final TextEditingController _courseInstructorController =
      TextEditingController();
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      try {
        final Course course = Course(
          id: '',
          name: _courseNameController.text,
          description: _courseDescriptionController.text,
          duration: _courseDurationController.text,
          schedule: _courseScheduleController.text,
          instructor: _courseInstructorController.text,
        );
        await CourseService().saveCourse(course, context);
        await Future.delayed(Duration(seconds: 2));
        if (context.mounted) {
          GoRouter.of(context).pop();
        }
      } catch (error) {
        print("error adding course: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add New Course",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Fill in the details below to add a new course. Add start managing your study planner",
                ),
                SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        textEditingController: _courseNameController,
                        hintText: "Course Name",
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter valid course name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormField(
                        textEditingController: _courseDescriptionController,
                        hintText: "Course Description",
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter valid course description";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormField(
                        textEditingController: _courseDurationController,
                        hintText: "Course Duration",
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter valid course Duration";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormField(
                        textEditingController: _courseScheduleController,
                        hintText: "Course Schedule",
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter valid course schedule";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormField(
                        textEditingController: _courseInstructorController,
                        hintText: "Course Instructor",
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please enter valid course instructor";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CustomButton(
                            onPressed: () => _submitForm(context),
                            title: "Add Course",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
