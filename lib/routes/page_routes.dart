import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner/pages/add_new_course.dart';
import 'package:study_planner/pages/home_page.dart';

class RouterClass {
  final routes = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(body: Center(child: Text("Error loading page"))),
      );
    },
    routes: [
      // Home Page
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) {
          return HomePage();
        },
      ),

      //Add new course
      GoRoute(
        path: "/add_new_course",
        name: "add new course",
        builder: (context, state) {
          return AddNewCourse();
        },
      ),
    ],
  );
}
