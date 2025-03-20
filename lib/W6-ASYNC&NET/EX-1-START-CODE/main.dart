import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/W6-ASYNC&NET/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:week_3_blabla_project/W6-ASYNC&NET/EX-1-START-CODE/repository/courses_mock_repository.dart';
import 'package:week_3_blabla_project/W6-ASYNC&NET/EX-1-START-CODE/screens/course_list_screen.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CourseProvider(repository: CourseMockRepository()),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseListScreen(),
    );
  }
}