import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W3-BLABLA-PROJECT/widgets/actions/bla_button.dart';
// import 'widgets/actions/bla_button.dart';
// import 'screens/ride_pref/ride_pref_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: BlaButton(text: '', onPressed: () {  },)),
    );
  }
}
