import 'package:flutter/material.dart';
import 'package:pacers_teacher/screens/assignment.dart';
import 'package:pacers_teacher/screens/notes.dart';
import 'package:pacers_teacher/screens/studentlist.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 180, horizontal: 25),
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentList()));
              },
              child: Text("Student List")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AssignmentList()));
              },
              child: Text("Assignment")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NotesList()));
              },
              child: Text("Notes")),
          ElevatedButton(onPressed: () {}, child: Text("Time Table")),
          ElevatedButton(onPressed: () {}, child: Text("Results")),
        ],
      ),
    );
  }
}
