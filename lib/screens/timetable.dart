import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/view_timetable.dart';
import 'dart:io';

class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  File? _selectedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        title: Text("TimeTable"),
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 118, 67),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          width: double.infinity,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              children: [
                Icon(
                  Icons.file_open_rounded,
                  size: 55,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      "BE Comp",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewTimetable()));
                            },
                            child: Text("View File")),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
