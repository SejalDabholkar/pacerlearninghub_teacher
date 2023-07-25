import 'package:flutter/material.dart';
import 'package:pacers_teacher/dashboard.dart';
import 'package:pacers_teacher/feedback/cateenfeedback.dart';

import 'package:pacers_teacher/screens/assignment.dart';
import 'package:pacers_teacher/screens/notes.dart';
import 'package:pacers_teacher/screens/notice.dart';
import 'package:pacers_teacher/screens/result.dart';
import 'package:pacers_teacher/screens/studentlist.dart';
import 'package:pacers_teacher/screens/timetable.dart';

import '../screens/attendance.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // child: ListView(
      //   padding: EdgeInsets.symmetric(vertical: 180, horizontal: 25),
      //   children: <Widget>[
      //     ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => StudentList()));
      //         },
      //         child: Text("Student List")),
      //     ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => AssignmentList()));
      //         },
      //         child: Text("Assignment")),
      //     ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => Notes()));
      //         },
      //         child: Text("Notes")),
      //     ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => Timetable()));
      //         },
      //         child: Text("Time Table")),
      //     ElevatedButton(onPressed: () {}, child: Text("Results")),
      //   ],
      // ),

      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 180, horizontal: 25),
        children: <Widget>[
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Student List"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentList()),
              );
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.assignment,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Assignment"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AssignmentList()),
              );
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.note,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Notes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesScreen()),
              );
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.schedule,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Time Table"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Timetable()),
              );
            },
          ),
           ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.list,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Attendance"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceApp()),
              );
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.bar_chart,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Results"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Result()),
              );
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Notice"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticeScreen()),
              );
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.feed_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text("Feedback"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoogleFormScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}
