import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/drawer.dart';
import 'package:pacers_teacher/screens/events.dart';
import 'package:pacers_teacher/screens/profile.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
        title: Center(child: Text("DASHBOARD")),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(Icons.person_pin))
        ],
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 118, 67),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              height: 276,
              width: double.infinity,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 23, bottom: 20),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Text("NAme"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("DEPT")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Events For You"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EventList()));
                    },
                    child: Text("View All")),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 118, 67),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: double.infinity,
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Event 1"),
                        ElevatedButton(onPressed: () {}, child: Text("Join"))
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
