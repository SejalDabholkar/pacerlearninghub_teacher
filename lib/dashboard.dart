import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/drawer.dart';
import 'package:pacers_teacher/screens/events.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  final String? id;
  final String? phoneno;

  Dashboard({
    this.id,
    this.phoneno,
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<Map<String, dynamic>> _userData;

  @override
  void initState() {
    super.initState();
    _userData = fetchUserData();
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    print(' is ${widget.id}-------------------------------------------------------------------------------------------------- ');
    final response = await http.get(Uri.parse('https://pacerlearninghub.onrender.com/teacherProfile/singleteacherinfo/${widget.id}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("DASHBOARD")),
      ),
      drawer: drawer(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16.0),
                  Text('Loading data ...'),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final userData = snapshot.data!;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 276,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 23, bottom: 20),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(userData['imagepath'] ?? ''),
                              radius: 50,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          Text(
                            "${userData['name']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${userData['email']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Events For You"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventList()),
                            );
                          },
                          child: Text("View All"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          width: double.infinity,
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Event 1",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Join"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(
            child: Text('No data available.'),
          );
        },
      ),
    );
  }
}
