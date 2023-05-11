import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Center(
          child: Text("Student List"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
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
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: const [
                        Text(
                          "Hira Khan",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "19CE12",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
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