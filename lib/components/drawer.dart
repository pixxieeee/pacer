import 'package:flutter/material.dart';
//import 'package:pacers_portal/add_events.dart';
import 'package:pacers_portal/all_events.dart';
import 'package:pacers_portal/notice.dart';
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
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
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
            onTap: () {},
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
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => AllEvents())));
            },
            title: Text("Event"),
          )
        ],
      ),
    );
  }
}
