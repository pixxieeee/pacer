import 'package:flutter/material.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:pacers_portal/main.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 118, 67),
          title: Text("Pacers Learning Hub"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => MyApp())));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        drawer: drawer());
  }
}
