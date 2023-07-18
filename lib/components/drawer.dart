import 'package:flutter/material.dart';
//import 'package:pacers_portal/add_events.dart';
import 'package:pacers_portal/Events/all_events.dart';
import 'package:pacers_portal/Events/events.dart';
//import 'package:pacers_portal/common/dashboard/calendar_widget.dart';
import 'package:pacers_portal/feedback/tr_feedback.dart';
import 'package:pacers_portal/listevent.dart';
import 'package:pacers_portal/notices/notice.dart';
import 'package:pacers_portal/students/student.dart';
import 'package:pacers_portal/teacher.dart';
import 'package:pacers_portal/test.dart';

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
            leading: Icon(Icons.event_note),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Eventslist())));
            },
            title: Text("Event"),
          ),
           ListTile(
            leading: Icon(Icons.feedback_outlined),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => GoogleFormScreen())));
            },
            title: Text("FeedBack"),
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
