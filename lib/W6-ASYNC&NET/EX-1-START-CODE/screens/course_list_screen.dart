import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/W6-ASYNC&NET/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:week_3_blabla_project/W6-ASYNC&NET/EX-1-START-CODE/screens/course_screen.dart';
import '../models/course.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void editCourse(Course course) async {
      await Navigator.of(context).push<Course>(
        MaterialPageRoute(builder: (ctx) => CourseScreen(course: course)),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<CourseProvider>(
        builder: (context, provider, child) {
          final courses = provider.courses;
          if (courses.isEmpty) {
            return Center(child: Text('No courses added yet!'));
          }
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder:
                (context, index) => Dismissible(
                  key: Key(courses[index].name),
                  child: CourseTile(course: courses[index], onEdit: editCourse),
                ),
          );
        },
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onEdit});

  final Course course;
  final Function(Course) onEdit;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => onEdit(course),
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}