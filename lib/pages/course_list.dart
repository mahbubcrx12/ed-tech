import 'package:ed_tech/components/course.dart';
import 'package:ed_tech/pages/course_card.dart';
import 'package:flutter/material.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key? key, required this.courses}) : super(key: key);

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: courses.map((course) => CourseCard(course: course)).toList(),
    );
  }
}
