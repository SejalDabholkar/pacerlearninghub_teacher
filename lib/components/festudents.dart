import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FEStudents extends StatefulWidget {
  const FEStudents({super.key});

  @override
  State<FEStudents> createState() => _FEStudentsState();
}

class _FEStudentsState extends State<FEStudents> {
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
            future: getFEStudent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                                  //Text(snapshot.data![i]["email"]),
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

  Future<List> getFEStudent() async {
    try {
      var response = await http.get(Uri.parse(
          "https://pacerlearninghub.onrender.com/studentProfile/646e16848f5889356ddf5583"));
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
