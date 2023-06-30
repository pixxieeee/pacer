import 'package:flutter/material.dart';
//import 'package:pacers_portal/add_events.dart';
import 'package:pacers_portal/all_events.dart';
import 'package:pacers_portal/notice.dart';
import 'package:pacers_portal/student.dart';
import 'package:pacers_portal/teacher.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Priyanka Talwar',
              style: TextStyle(
                color: Color.fromARGB(255, 2, 101, 251),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            accountEmail: Text('priyanka.talwarb@gmail.com'),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 101, 251),
              
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            onTap: () {},
            title: Text("Dashboard"),
          ),
          ListTile(
            leading: Icon(Icons.switch_account_outlined),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Teacher())));
            },
            title: Text("Teacher"),
          ),
          ListTile(
            leading: Icon(Icons.school_outlined),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Student()));
            },
            title: Text("Student"),
          ),
          ListTile(
            leading: Icon(Icons.do_not_touch_outlined),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => Notice())));
            },
            title: Text("Notice"),
          ),
          ListTile(
            leading: Icon(Icons.feedback_outlined),
            onTap: () {},
            title: Text("Feedback"),
          ),
          ListTile(
            leading: Icon(Icons.event_note),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => AllEvents())));
            },
            title: Text("Event"),
          ),
           Padding(
             padding: const EdgeInsets.only(top: 200),
             child: Align(
              alignment: Alignment.bottomLeft,
               child: Image.asset(
                  "assets/images/test.jpg",
                  fit: BoxFit.fill,
                  height: 250,
                  width: double.infinity,
                ),
             ),
           ),

        ],
      ),
    );
  }
}
