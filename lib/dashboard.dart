import 'package:flutter/material.dart';
import 'package:pacers_teacher/components/drawer.dart';
import 'package:pacers_teacher/screens/events.dart';
//<<<<<<< code-swapnil
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pacers_teacher/loginscreen/loginOtp.dart';
//=======
import 'package:pacers_teacher/tr_profile.dart';
//>>>>>>> main

class Dashboard extends StatefulWidget {
  // final String? id;
  // final String? phoneno;
  //
  // Dashboard({
  //   this.id,
  //   this.phoneno,
  //   Key? key,
  // }) : super(key: key);

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedId = prefs.getString('id');

    if (storedId != null) {
      print('Stored ID is: $storedId');
      final response = await http.get(Uri.parse(
          'https://pacerlearninghub.onrender.com/teacherProfile/singleteacherinfo/$storedId'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load user data');
      }
    } else {
      print('Stored ID not found');
      throw Exception('Stored ID not found');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyPhone()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: Text("DASHBOARD")),
          actions: [
            IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        drawer: drawer(),
//<<<<<<< code-swapnil
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
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
                                backgroundImage:
                                    NetworkImage(userData['imagepath'] ?? ''),
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
                            SizedBox(height: 5),
                            Text(
                              "${userData['address']}",
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
                                MaterialPageRoute(
                                    builder: (context) => EventList()),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            width: double.infinity,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
//=======
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   height: 276,
//                   width: double.infinity,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 23, bottom: 20),
//                         child: GestureDetector(
//                           onTap: () {
//                             // Navigate to the TeacherPage when the avatar is tapped
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => TeacherProfilePage(
//                                       teacherId: '647c8dfd0e99666edb897d6e')),
//                             );
//                           },
//                           child: CircleAvatar(
//                             backgroundImage: NetworkImage(
//                                 "https://media.licdn.com/dms/image/C5603AQEt20kHgEZyhQ/profile-displayphoto-shrink_800_800/0/1576818156705?e=2147483647&v=beta&t=1YxPo5n57kafpWHjQanIUC0TL8Cld-3PfB_9ENNlpSs"),
//                             radius: 50,
//                             backgroundColor: Colors.black,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "Jessica Dsouza",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         "Computer",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       "Events For You",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color:
//                             Colors.blue.shade50, // Changed to white background
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       width: double.infinity,
//                       height: 120,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 25, horizontal: 25),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CircleAvatar(
//                               // Added CircleAvatar
//                               backgroundImage: NetworkImage(
//                                 "",
//                               ),
//                               radius: 30,
//                             ),
//                             Text(
//                               "Technical Events",
//                               style: TextStyle(
//                                   color:
//                                       Colors.blue, // Changed text color to blue
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {},
//                               child: Text("Join"),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors
//                                     .blue, // Changed Join button color to blue
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color:
//                             Colors.blue.shade50, // Changed to white background
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       width: double.infinity,
//                       height: 120,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 25, horizontal: 25),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CircleAvatar(
//                               // Added CircleAvatar
//                               backgroundImage: NetworkImage(
//                                 "",
//                               ),
//                               radius: 30,
//                             ),
//                             Text(
//                               "Non Technical",
//                               style: TextStyle(
//                                   color:
//                                       Colors.blue, // Changed text color to blue
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {},
//                               child: Text("Join"),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors
//                                     .blue, // Changed Join button color to blue
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color:
//                             Colors.blue.shade50, // Changed to white background
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       width: double.infinity,
//                       height: 120,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 25, horizontal: 25),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CircleAvatar(
//                               // Added CircleAvatar
//                               backgroundImage: NetworkImage(
//                                 "",
//                               ),
//                               radius: 30,
//                             ),
//                             Text(
//                               "Cultural Events",
//                               style: TextStyle(
//                                   color:
//                                       Colors.blue, // Changed text color to blue
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {},
//                               child: Text("Join"),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors
//                                     .blue, // Changed Join button color to blue
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
// //>>>>>>> main
          //    ),
        ));
  }
}
