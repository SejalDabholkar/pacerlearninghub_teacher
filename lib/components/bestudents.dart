import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BEStudents extends StatefulWidget {
  const BEStudents({super.key});

  @override
  State<BEStudents> createState() => _BEStudentsState();
}

class _BEStudentsState extends State<BEStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Center(
          child: Text("FE Student List"),
        ),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SizedBox(
          child: FutureBuilder<List>(
            future: getBEStudent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 118, 67),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        width: double.infinity,
                        height: 70,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentProfilePage(
                                  studentData: snapshot.data![i],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              children: [
                                Image.network(snapshot.data![i]["imagepath"]),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Text(snapshot.data![i]["name"]),
                                    //Text(snapshot.data![i]["email"]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List> getBEStudent() async {
    try {
      var response = await http.get(Uri.parse(
          "https://pacerlearninghub.onrender.com/studentProfile/646e169a8f5889356ddf5589"));
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class StudentProfilePage extends StatelessWidget {
  final Map<String, dynamic> studentData;

  const StudentProfilePage({required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display student profile details here using studentData
            Text('Name: ${studentData["name"]}'),
            // Add more Text widgets for other details like email, etc.
          ],
        ),
      ),
    );
  }
}
