import 'package:flutter/material.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
        title: Center(
          child: Text("Notes List"),
        ),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 118, 67),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.file_open_rounded,
                      size: 35,
                    ),
                    Column(
                      children: [
                        Text(
                          "Notes 1",
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(
                          height: 35,
                          width: 70,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("View File")),
                        )
                      ],
                    )
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
