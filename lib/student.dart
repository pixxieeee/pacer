import "package:flutter/material.dart";
import 'package:pacers_portal/common/dashboard/admin_home.dart';
//import 'package:pacers_portal/dash/dashboard/admin_home.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:pacers_portal/student_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentForm()));
          },
        ),
        appBar: AppBar(
          toolbarHeight: 106,
          backgroundColor: Color.fromARGB(255, 2, 101, 251),
          title: Text("Pacers Learning Hub"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => AdminHome(
                      ))));
                },
                icon: Icon(Icons.arrow_back_ios))
          ],
        ),
        drawer: drawer(),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
          width: double.infinity,
          child: FutureBuilder<List>(
            future: getAllStudents(),
            builder: (context, snapshot) {
              return DataTable(
                columns: [
                  DataColumn(label: Text("ID")),
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Department")),
                  DataColumn(label: Text("RollNo")),
                  DataColumn(label: Text("Email")),
                  DataColumn(label: Text("Action"))
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text("1")),
                    DataCell(Text("priyanka")),
                    DataCell(Text("Computer")),
                    DataCell(Text("19CE43")),
                    DataCell(Text("Priyanka.talwarb@gmail.com")),
                    DataCell(Icon(Icons.edit)),
                  ])
                  
                ],
              );
            },
          ),
        ));
  }

  Future<List> getAllStudents() async {
    try {
      var response = await http.get(
          Uri.parse("https://pacerlearninghub.onrender.com/studentProfile"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
