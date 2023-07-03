import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/bestudents.dart';
import 'package:pacers_teacher/components/festudents.dart';
import 'package:pacers_teacher/components/sestudents.dart';
import 'package:pacers_teacher/components/testudents.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Center(
          child: Text("Student List"),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FEStudents()));
                  },
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 118, 67),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 25,
                      ),
                      child: Text(
                        "FE COMP",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SEStudents()));
                  },
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 118, 67),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 25,
                      ),
                      child: Text(
                        "SE COMP",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TEStudents()));
                  },
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 118, 67),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 25,
                      ),
                      child: Text(
                        "TE COMP",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BEStudents()));
                  },
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 118, 67),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 25,
                      ),
                      child: Text(
                        "BE COMP",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}
