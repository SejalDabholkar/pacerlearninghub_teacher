import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/filelist.dart';
import 'package:pacers_teacher/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class AssignmentList extends StatefulWidget {
  const AssignmentList({super.key});

  @override
  State<AssignmentList> createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {
  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'Video', 'Audio', 'MultipleFile'];
  FilePickerResult? result;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        pickfiles();
      }),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Align(
          alignment: Alignment.topCenter,
          child: Text("Assignment List"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 118, 67),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: double.infinity,
              height: 90,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                          style: TextStyle(fontSize: 10),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              pickfiles();
                            },
                            child: Text("View File"))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget fileDetails(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
          Text('File Size: $size'),
          Text('File Extension: ${file.extension}'),
          Text('File Path: ${file.path}'),
        ],
      ),
    );
  }

  void pickfiles() async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    loadSelectedFiles(result!.files);
  }

  void loadSelectedFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FileList(files: files, onOpenedFile: viewFile)));
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
