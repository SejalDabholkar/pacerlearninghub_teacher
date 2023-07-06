import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/drawer.dart';
import 'package:pacers_teacher/screens/events.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("DASHBOARD")),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => Profile()));
        //       },
        //       icon: Icon(Icons.person_pin))
        // ],
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color:Colors.blue ,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              height: 276,
              width: double.infinity,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 23, bottom: 20),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://media.licdn.com/dms/image/C5603AQEt20kHgEZyhQ/profile-displayphoto-shrink_800_800/0/1576818156705?e=2147483647&v=beta&t=1YxPo5n57kafpWHjQanIUC0TL8Cld-3PfB_9ENNlpSs"),
                      radius: 50,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Text(
                    "Jessica Dsouza",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Computer",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
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
                    color: Colors.blue ,
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
                        Text(
                          "Event 1",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
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