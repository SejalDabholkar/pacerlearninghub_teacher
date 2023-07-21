import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class AssignmentList extends StatefulWidget {
  const AssignmentList({Key? key}) : super(key: key);

  @override
  State<AssignmentList> createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {
  List<String> pdfFiles = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickAndUploadFile();
        },
        child: Icon(Icons.file_upload),
      ),
      appBar: AppBar(
        title: Text("Assignments"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              openPDF(index);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  "Assignment ${index}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deletePDF(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      File file = File(result.files.single.path!);

      // Send the file to the server
      await uploadFile(file);
    } else {
      // User canceled the file picking
      print('File picking canceled.');
    }
  }

  Future<void> uploadFile(File file) async {
    final url = 'https://pacerlearninghub.onrender.com/notice';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully');
      fetchData(); // Refresh the PDF list after uploading
    } else {
      print('Error uploading file. Status code: ${response.statusCode}');
    }
  }

  Future<void> fetchData() async {
    try {
      final url =
          'https://pacerlearninghub.onrender.com/notice'; // Replace with your Node.js server URL

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> fileList = json.decode(response.body);
        final List<String> fetchedPDFFiles =
            fileList.map((file) => file.toString()).toList();
        setState(() {
          pdfFiles = fetchedPDFFiles;
        });
      } else {
        throw Exception('Failed to fetch PDF files');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void openPDF(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(
          url: 'http://10.0.2.2:8000/assignment/${[index]}',
          onDelete: () {
            deletePDF(index);
          },
        ),
      ),
    );
  }

  void deletePDF(int index) {
    final url = 'http://10.0.2.2:8000/assignment/${index}';

    http.delete(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        print('PDF deleted successfully');
        fetchData(); // Refresh the PDF list after deletion
      } else {
        print('Error deleting PDF. Status code: ${response.statusCode}');
      }
    });
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String url;
  final VoidCallback onDelete;

  const PDFViewerScreen({
    required this.url,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PDFView(
                  filePath: url,
                ),
              ),
            );
          },
          child: Text('View PDF'),
        ),
      ),
    );
  }
}
