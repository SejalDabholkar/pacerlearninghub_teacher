import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/drawer.dart';
import 'package:pacers_teacher/dashboard.dart';
import 'package:pacers_teacher/loginscreen/loginOtp.dart';
import 'package:pacers_teacher/loginscreen/splashscreen.dart';
import 'package:pacers_teacher/screens/events.dart';
import 'package:pacers_teacher/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
