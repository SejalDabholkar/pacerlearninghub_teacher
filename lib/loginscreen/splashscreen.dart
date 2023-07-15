import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pacers_teacher/loginscreen/loginOtp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, registerRoute);
  }

  registerRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyPhone()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 53.5, right: 53.5),
            child: SizedBox(child:Image(image: AssetImage("assets/images/pcce.PNG"))),
          )
        ],
      ),
    );
  }
}
