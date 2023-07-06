import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Event List"),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}
