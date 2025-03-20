import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/W6-ASYNC&NET/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:week_3_blabla_project/W6-ASYNC&NET/EX-1-START-CODE/screens/course_score_form.dart';
import '../models/course.dart';

const Color mainColor = Colors.blue;

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.course});
  final Course course;
  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {

    void addScore() async {
      CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
        MaterialPageRoute(builder: (ctx) => CourseScoreForm(course: course)),
      );
      if (newScore != null) {
        // Get the provider and add the score
        Provider.of<CourseProvider>(context, listen: false)
            .addScore(course.name, newScore);
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          course.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: addScore, icon: const Icon(Icons.add)),
        ],
      ),
      body: Consumer<CourseProvider>(
        builder: (context, provider, child){
        final courseScreen = provider.getCourseFor(course.name);
        if(courseScreen.scores.isEmpty){
          return const Center(child: Text('No Scores added yet.'));
        }
        return ListView.builder(
            itemCount: courseScreen.scores.length,
            itemBuilder:(context, index){
              final score = courseScreen.scores[index];
              return ListTile(
                title: Text(score.studentName),
                trailing: Text(
                  score.studentScore.toString(),
                  style: TextStyle(
                    color: scoreColor(score.studentScore),
                    fontSize: 15,
                  ),
                ),
              );
            }
            );
        },
      ),
    );
  }
}