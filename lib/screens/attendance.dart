import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../components/drawer.dart';
import '../dashboard.dart';

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<Student> students = []; // Empty list initially
  bool markAllPresent = false;
  bool markAllAbsent = false;
  String message = '';
  String downloadsPath =
      '${Directory.systemTemp.path}/downloads'; // This will give you the path to the downloads folder in the temporary directory.

  @override
  void initState() {
    super.initState();
    fetchStudentNames(); // Fetch student names when the screen loads
  }

  Future<void> fetchStudentNames() async {
    final url =
        'https://pacerlearninghub.onrender.com/attendance/fetchstudentlist'; // Replace with your server URL

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> studentNames = data['studentNames'];

        // Create Student objects with fetched names
        final fetchedStudents =
            studentNames.map((name) => Student(name: name)).toList();

        setState(() {
          students = fetchedStudents; // Update the students list
        });
      } else {
        print('Failed to fetch student names. Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to fetch student names. Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text('Attendance'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: markAllPresent,
                onChanged: (value) {
                  setState(() {
                    markAllPresent = value!;
                    markAllAbsent = false;
                    for (var student in students) {
                      student.isPresent = value;
                    }
                  });
                },
              ),
              Text('Mark All Present'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: markAllAbsent,
                onChanged: (value) {
                  setState(() {
                    markAllAbsent = value!;
                    markAllPresent = false;
                    for (var student in students) {
                      student.isPresent = !value;
                    }
                  });
                },
              ),
              Text('Mark All Absent'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: students[index].isPresent,
                    onChanged: (value) {
                      setState(() {
                        students[index].isPresent = value!;
                      });
                    },
                  ),
                  title: Text(students[index].name),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: ElevatedButton(
              onPressed: () async {
                // Calculate average attendance and save to the database
                await calculateAndSaveAverageAttendance(students);
              },
              child: Text('Calculate Average Attendance'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(
                    40), // fromHeight use double.infinity as width and 40 is the height
              ),
            ),
          ),

          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Download attendance list for students with less than 75% attendance
                      await downloadAttendanceList();
                    },
                    child: Text(
                      'Download Attendance List',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Download attendance list for students with less than 75% attendance
                      await downloadCompleteAttendanceList();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        'Download Complete Attendance List',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
          Text(message), // Display message
        ],
      ),
    );
  }

  Future<void> calculateAndSaveAverageAttendance(List<Student> students) async {
    final url =
        'https://pacerlearninghub.onrender.com/attendance/calavgattendance'; // Replace with your server URL

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
            {'students': students.map((student) => student.toJson()).toList()}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('averageAttendance')) {
          final averageAttendance = data['averageAttendance'];
          if (averageAttendance != null) {
            setState(() {
              message = 'Average Attendance: $averageAttendance';
            });
            return;
          }
        }
      }

      setState(() {
        message = 'Attendance Successfully updated';
      });
    } catch (error) {
      setState(() {
        message =
            'Failed to calculate and save average attendance. Error: $error';
      });
    }
  }

  Future<void> downloadAttendanceList() async {
    String fileUrl =
        'https://pacerlearninghub.onrender.com/attendance/downloadfile'; // Replace this with the URL of the file you want to download.
    String fileName =
        'attendance_list.csv'; // Replace this with the desired name for the saved file.
    saveFileFromUrlToDownloads(fileUrl, fileName);
  }

  Future<void> saveFileFromUrlToDownloads(
      String fileUrl, String fileName) async {
    try {
      // Send an HTTP GET request to the provided URL
      var response = await http.get(Uri.parse(fileUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Get the Downloads directory
        //var downloadsDir = await getDownloadsDirectory1();
        Directory generalDownloadDir =
            Directory('/storage/emulated/0/Download');
        var filePath = '${generalDownloadDir?.path}/$fileName';

        // Write the downloaded content to a file
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        print('File saved to: $filePath');
      } else {
        print('Failed to download file. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while downloading file: $e');
    }
  }

  Future<void> downloadCompleteAttendanceList() async {
    String fileUrl =
        'https://pacerlearninghub.onrender.com/attendance/downloadAttendanceListAllStudents'; // Replace this with the URL of the file you want to download.
    String fileName =
        'attendance_complete_list.csv'; // Replace this with the desired name for the saved file.
    saveFileFromUrlToDownloads(fileUrl, fileName);
  }
}

class Student {
  String name;
  bool isPresent;

  Student({required this.name, this.isPresent = false});

  // Convert Student object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isPresent': isPresent,
    };
  }
}