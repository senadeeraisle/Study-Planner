import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_planner/models/course_model.dart';
import 'package:study_planner/utils/util_function.dart';

class CourseService {
  // Method to save data on firestore
  final CollectionReference _courseCollection = FirebaseFirestore.instance
      .collection('courses');

  Future<void> saveCourse(Course course, BuildContext context) async {
    try {
      //convert dart object to json map
      final Map<String, dynamic> data = course.toJson();
      //store the course on firestore and create a reference to the firebase document
      final docRef = await _courseCollection.add(data);
      //update the id number with the firebase document id
      await docRef.update({"id": docRef.id});
      if (context.mounted) {
        showSnackBar(context: context, text: "Course added successfully");
      }
    } catch (error) {
      print('error adding course: $error');
      if (context.mounted) {
        showSnackBar(context: context, text: "Error adding course");
      }
    }
  }

  //method to load courses using stream

  Stream<List<Course>> loadCourses() {
    return _courseCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Course.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
}
