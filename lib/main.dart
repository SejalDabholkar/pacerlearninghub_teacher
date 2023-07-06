import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/drawer.dart';
import 'package:pacers_teacher/dashboard.dart';
import 'package:pacers_teacher/loginscreen/signupscreen.dart';
import 'package:pacers_teacher/loginscreen/splashscreen.dart';
import 'package:pacers_teacher/screens/events.dart';
import 'package:pacers_teacher/screens/profile.dart';


void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Signup();
  }
}
