import 'package:flutter/material.dart';
import 'package:pacers_portal/notice.dart';
import 'package:pacers_portal/teacher.dart';

import 'main.dart';

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
      drawer: Drawer(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Notice())));
              },
              title: Text("Notice"),
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              onTap: () {},
              title: Text("Feedback"),
            ),
          ],
        ),
      ),
    );
  }
}
