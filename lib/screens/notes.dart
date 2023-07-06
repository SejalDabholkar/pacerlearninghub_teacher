import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/view_notes.dart';
import 'dart:io';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  File? _selectedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Container(
          decoration: BoxDecoration(
            color:Colors.blue,
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
                      "Pattern Recognition",
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
                                      builder: (context) => ViewNotes()));
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
