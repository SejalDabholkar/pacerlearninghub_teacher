import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Center(child: Text("PROFILE")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          children: const [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Basic Information",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
