import 'package:flutter/material.dart';
import 'package:study_planner/constants/colors.dart';
import 'package:study_planner/pages/main_screens/assignment_page.dart';
import 'package:study_planner/pages/main_screens/courses_page.dart';
import 'package:study_planner/pages/main_screens/main_page.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    MainPage(),
    CoursesPage(),
    AssignmentPage(),
  ];
  void onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        onTap: onTapItem,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Courses"),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Assingment",
          ),
        ],
      ),
      body: Center(child: _pages.elementAt(_selectedIndex)),
    );
  }
}
