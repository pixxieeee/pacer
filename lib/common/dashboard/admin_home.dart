import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/calendar_widget.dart';
import 'package:pacers_portal/common/dashboard/hod_details.dart';
import 'package:pacers_portal/common/dashboard/profile_widget.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:pacers_portal/main.dart';
import 'package:pacers_portal/login/VerifyOtp.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AdminHome extends StatefulWidget {
  // final String? id;
  // final String? phoneno;
  //
  // const AdminHome({
  //   this.id,
  //   this.phoneno,
  //   Key? key,
  // }) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

Future<Map<String, dynamic>> fetchUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedId = prefs.getString('id');

  if (storedId != null) {
    print('Stored ID is: $storedId');
    final response = await http.get(Uri.parse('https://pacerlearninghub.onrender.com/teacherProfile/singleteacherinfo/$storedId'));

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

class _AdminHomeState extends State<AdminHome> {

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
          (route) => false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        title: Text(
          "Pacer's Learning Hub",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      drawer: drawer(),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " DASHBOARD",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 101, 251),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 250,
                      width: 750,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 2, 101, 251),
                      ),
                      child: Profile(),
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 380,
                    width: 750,
                   child: Column(children: [
                   Calenderwidget()
                   ]),
                  ),
                ),
              )
              ],
            
            ),
            Container(
              padding: EdgeInsets.all(10),
             height: 400,
             width : 650,
              child: Column(
                children: [
                HodDetails(),
              Container(
                child: Text("data"),
              )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}