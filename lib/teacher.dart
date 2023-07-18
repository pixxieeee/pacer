import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pacers_portal/common/dashboard/admin_home.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:pacers_portal/students/student_form.dart';
import 'dart:convert';

class Teacher extends StatefulWidget {
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  List<dynamic> teacherData = [];

  Future<void> fetchTeacherData() async {
    final response = await http.get(Uri.parse('http://localhost:8000/teacherProfile'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        teacherData = data;
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTeacherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentForm()));
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
      body: SingleChildScrollView(
        child: FittedBox(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Index')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Department')),
              DataColumn(label: Text('Phone')),
              DataColumn(label: Text('Gender')),
              DataColumn(label: Text('Birthdate')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Address')),
              DataColumn(label: Text('City')),
              DataColumn(label: Text('State')),
              DataColumn(label: Text('Pincode')),
              DataColumn(label: Text('Image')),
            ],
            rows: teacherData.asMap().entries.map((entry) {
              final index = entry.key + 1;
              final teacher = entry.value;
        
            //  final yearId = teacher['year_id'] != null ? teacher['year_id']['year'] : '';
              final departmentId = teacher['department_id'] != null ? teacher['department_id']['name'] : '';
        
              return DataRow(
                cells: [
                  DataCell(Text(index.toString())),
                  DataCell(Text(teacher['name'] ?? '')),
                  DataCell(Text(departmentId ?? '')),
                  DataCell(Text(teacher['phoneno'] ?? '')),
                  DataCell(Text(teacher['gender'] ?? '')),
                  DataCell(Text(teacher['birthdate'] ?? '')),
                  DataCell(Text(teacher['email'] ?? '')),
                  DataCell(Text(teacher['address'] ?? '')),
                  DataCell(Text(teacher['city'] ?? '')),
                  DataCell(Text(teacher['state'] ?? '')),
                  DataCell(Text(teacher['pincode'] != null ? teacher['pincode'].toString() : '')),
                  DataCell(
                    teacher['imagepath'] != null
                        ? Image.network(
                            teacher['imagepath'],
                            width: 50,
                            height: 50,
                          )
                        : SizedBox(),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
