import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pacers_teacher/main.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:pacers_teacher/components/view_assignment.dart';

class AssignmentList extends StatefulWidget {
  const AssignmentList({super.key});

  @override
  State<AssignmentList> createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {
  File? _selectedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        title: Text("Assignments"),
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
                      "Assignment 1",
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
                                      builder: (context) => Assignment()));
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

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_selectedFile != null) {
      String url = 'https://pacerlearninghub.onrender.com/assignment';
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files
          .add(await http.MultipartFile.fromPath('file', _selectedFile!.path));
      var response = await request.send();

      if (response.statusCode == 200) {
        // File uploaded successfully
        print('File uploaded!');
      } else {
        // Error uploading file
        print('Error uploading file');
      }
    }
  }
}
