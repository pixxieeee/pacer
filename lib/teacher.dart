import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';
//import 'package:pacers_portal/dash/dashboard/admin_home.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:pacers_portal/teacher_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Teacher extends StatefulWidget {
  const Teacher({Key? key}) : super(key: key);

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TeacherForm()));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white, // Button padding
        ),
        appBar: AppBar(
          toolbarHeight: 106,
          backgroundColor: Color.fromARGB(255, 2, 101, 251),
          title: Text("Pacers Learning Hub"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminHome()));
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ],
        ),
        drawer: drawer(),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Container(
            child: FutureBuilder<List>(
              future: getTeacher(),
              builder: (context, snapshot) {
                // print(snapshot.data);
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(snapshot.data![i]['name']),
                            ],
                          ),
                          Column(
                            children: [
                              Text(snapshot.data![i]['address']),
                            ],
                          ),
                           Column(
                            children: [
                              Text(snapshot.data![i]['pincode']),
                            ],
                          ),
                          Column(
                            children: [
                              Text(snapshot.data![i]['email']),
                            ],
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }

  Future<List> getTeacher() async {
    String baseUrl = "http://127.0.0.1:8000/teacherProfile";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return Future.error("Server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
