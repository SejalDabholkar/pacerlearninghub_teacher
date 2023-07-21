import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pacers_teacher/components/drawer.dart';
import 'package:pacers_teacher/dashboard.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class Notice {
  final String title;
  final String message;
  final String filePath;

  Notice({required this.title, required this.message, required this.filePath});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      filePath: json['filepath'] ?? '',
    );
  }
}

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<Notice> notices = [];
  List<Notice> filteredNotices = [];
  TextEditingController searchController = TextEditingController();
  bool sortAscending = true;

  Future<void> fetchNotices() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/result'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        notices = data.map((item) => Notice.fromJson(item)).toList();
        filteredNotices = notices;
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  void openPDF(String filePath) async {
    try {
      final bool canLaunch = await canLaunchUrl(Uri.parse(filePath));
      if (canLaunch) {
        await launchUrl(Uri.parse(filePath));
      } else {
        print('Could not launch $filePath');
      }
    } catch (e) {
      print('Error launching $filePath: $e');
    }
  }

  void sortNotices() {
    setState(() {
      sortAscending = !sortAscending;
      filteredNotices.sort((a, b) => sortAscending
          ? a.title.compareTo(b.title)
          : b.title.compareTo(a.title));
    });
  }

  void searchNotices(String query) {
    setState(() {
      filteredNotices = notices
          .where((notice) =>
              notice.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNotices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        title: Text("Pacers Learning Hub"),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: searchNotices,
              decoration: InputDecoration(
                labelText: 'Search by Name',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotices.length,
              itemBuilder: (context, index) {
                final notice = filteredNotices[index];
                return ListTile(
                  title: Text('${index + 1}. ${notice.title}'),
                  subtitle: Text(notice.message),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFViewerScreen(
                          pdfPath: notice.filePath,
                          title: notice.title,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String pdfPath;
  final String title;

  PDFViewerScreen({required this.pdfPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}
