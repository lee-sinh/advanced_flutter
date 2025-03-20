import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W6-ASYNC&NET/EX-1-START-CODE/repository/courses_repository.dart';

import '../models/course.dart';


class CourseProvider extends ChangeNotifier{
  final CourseRepository repository;
  List<Course> _courses = [];
  CourseProvider({required this.repository}){
    fetchCourses();
  }
  List<Course> get courses => _courses;
  
  void fetchCourses(){
    _courses = repository.getCourses();
    notifyListeners();
  }
  Course getCourseFor(String courseId){
    return _courses.firstWhere((course)=> course.name == courseId);
  }
  void addScore(String courseId, CourseScore score){
    final course = getCourseFor(courseId);
    course.addScore(score);
    notifyListeners();
  }
}