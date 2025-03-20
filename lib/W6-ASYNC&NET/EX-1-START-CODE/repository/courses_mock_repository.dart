
import '../models/course.dart';
import 'courses_repository.dart';

class CourseMockRepository extends CourseRepository{
  final List<Course> _courses = [
    Course(name: 'Flutter'),
    Course(name: 'Captsone'),
    Course(name: 'Soft skills'),
    Course(name: 'AWS'),
    Course(name: 'Database'),
  ];
  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }

  @override
  List<Course> getCourses() {
    return _courses;
  }

}