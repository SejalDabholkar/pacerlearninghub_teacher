import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/drawer.dart';
import 'package:pacers_teacher/screens/events.dart';
import 'package:pacers_teacher/tr_profile.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
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
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the TeacherPage when the avatar is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeacherProfilePage(
                                      teacherId: '647c8dfd0e99666edb897d6e')),
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://media.licdn.com/dms/image/C5603AQEt20kHgEZyhQ/profile-displayphoto-shrink_800_800/0/1576818156705?e=2147483647&v=beta&t=1YxPo5n57kafpWHjQanIUC0TL8Cld-3PfB_9ENNlpSs"),
                            radius: 50,
                            backgroundColor: Colors.black,
                          ),
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
                  children: const [
                    Text(
                      "Events For You",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.blue.shade50, // Changed to white background
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: double.infinity,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              // Added CircleAvatar
                              backgroundImage: NetworkImage(
                                "",
                              ),
                              radius: 30,
                            ),
                            Text(
                              "Technical Events",
                              style: TextStyle(
                                  color:
                                      Colors.blue, // Changed text color to blue
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Join"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .blue, // Changed Join button color to blue
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.blue.shade50, // Changed to white background
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: double.infinity,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              // Added CircleAvatar
                              backgroundImage: NetworkImage(
                                "",
                              ),
                              radius: 30,
                            ),
                            Text(
                              "Non Technical",
                              style: TextStyle(
                                  color:
                                      Colors.blue, // Changed text color to blue
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Join"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .blue, // Changed Join button color to blue
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.blue.shade50, // Changed to white background
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: double.infinity,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              // Added CircleAvatar
                              backgroundImage: NetworkImage(
                                "",
                              ),
                              radius: 30,
                            ),
                            Text(
                              "Cultural Events",
                              style: TextStyle(
                                  color:
                                      Colors.blue, // Changed text color to blue
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Join"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .blue, // Changed Join button color to blue
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
