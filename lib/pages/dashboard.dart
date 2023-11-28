import 'package:ed_tech/components/course.dart';
import 'package:ed_tech/pages/course_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});
  final List<Course> courses = [
    Course(
        title: 'Course 1',
        description: 'Python beginer to advance',
        youtubeVideoUrl:
            "https://www.youtube.com/watch?v=7wnove7K-ZQ&list=PLu0W_9lII9agwh1XjRt242xIpHhPT2llg"),
    Course(
        title: 'Course 2',
        description: 'Carrier path full course',
        youtubeVideoUrl: "https://www.youtube.com/watch?v=vMiSf7LpFQE"),
    Course(
        title: 'Course 3',
        description: 'Flutter advance',
        youtubeVideoUrl: "https://www.youtube.com/watch?v=MqjCIITfCIA"),
    // Add more courses as needed
  ];
  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuerySize;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: size.height * 0.24,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff1E2E3D),
                  Color(0xff152534),
                  Color(0xff0C1C2E),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'Dashboard',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Welcome to EdTech',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CourseListPage(courses: courses),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
