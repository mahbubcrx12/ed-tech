import 'package:ed_tech/components/course.dart';
import 'package:ed_tech/pages/course_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black, // Set title text color to black
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(course.description),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Get.to(() => CoursePlayerPage(course: course));
              },
              child: const Text('Continue to Course'),
            ),
          ],
        ),
      ),
    );
  }
}
