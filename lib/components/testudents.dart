import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TEStudents extends StatefulWidget {
  const TEStudents({super.key});

  @override
  State<TEStudents> createState() => _TEStudentsState();
}

class _TEStudentsState extends State<TEStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Center(
          child: Text("TE Student List"),
        ),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SizedBox(
          child: FutureBuilder<List>(
            future: getTEStudent(),
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
                                  Text(snapshot.data![i]["email"]),
                                ],
                              ),
                            ],
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

  Future<List> getTEStudent() async {
    try {
      var response = await http.get(Uri.parse(
          "https://pacerlearninghub.onrender.com/studentProfile/646e16958f5889356ddf5587"));
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
