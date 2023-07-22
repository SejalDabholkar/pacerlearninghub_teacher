

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TeacherProfilePage extends StatefulWidget {
  final String teacherId;

  TeacherProfilePage({required this.teacherId});

  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  bool _isLoading = true;
  dynamic _teacherInfo;
  String _error = '';

  @override
  void initState() {
    super.initState();
    fetchTeacherInfo();
  }

  void fetchTeacherInfo() async {
    try {
      final apiUrl = 'https://your-api-url.com/teacher/${widget.teacherId}';
      
      final response = await http.get(Uri.parse(apiUrl));
      
      if (response.statusCode == 200) {
        final teacherInfo = json.decode(response.body);

        setState(() {
          _isLoading = false;
          _teacherInfo = teacherInfo;
        });
      } else {
        throw Exception('Failed to fetch teacher info');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Profile'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? Center(child: Text('Error: $_error'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(_teacherInfo['avatarUrl']),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        _teacherInfo['name'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        _teacherInfo['jobTitle'],
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16.0),
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.email),
                                title: Text('Email'),
                                subtitle: Text(_teacherInfo['email']),
                              ),
                              Divider(),
                              ListTile(
                                leading: Icon(Icons.phone),
                                title: Text('Phone'),
                                subtitle: Text(_teacherInfo['phone']),
                              ),
                              Divider(),
                              ListTile(
                                leading: Icon(Icons.school),
                                title: Text('School'),
                                subtitle: Text(_teacherInfo['school']),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}


 