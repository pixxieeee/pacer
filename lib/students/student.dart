import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pacers_portal/common/dashboard/admin_home.dart';
import 'dart:convert';

import 'package:pacers_portal/students/student_form.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  List<dynamic> teacherData = [];
  bool sortAscending = true;
  String sortedBy = 'name';
  String searchQuery = '';

  Future<void> fetchTeacherData() async {
    final response = await http.get(Uri.parse('http://localhost:8000/studentProfile'));
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

  Future<void> deleteTeacher(int teacherId) async {
    final response = await http.delete(Uri.parse('http://localhost:8000/teachers/$teacherId'));
    if (response.statusCode == 200) {
      // Teacher deleted successfully, update the UI accordingly
      setState(() {
        teacherData.removeWhere((teacher) => teacher['id'] == teacherId);
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  void sortData() {
    teacherData.sort((a, b) {
      if (sortedBy == 'name') {
        return sortAscending
            ? a['name'].compareTo(b['name'])
            : b['name'].compareTo(a['name']);
      } else if (sortedBy == 'index') {
        return sortAscending
            ? a['index'].compareTo(b['index'])
            : b['index'].compareTo(a['index']);
      }
      return 0;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTeacherData();
  }

  @override
  Widget build(BuildContext context) {
    // Filter the teacherData based on the searchQuery
    final filteredData = teacherData.where((teacher) {
      final name = teacher['name'].toString().toLowerCase();
      return name.contains(searchQuery);
    }).toList();

    sortData();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudentForm()),
          );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHome()),
              );
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                sortedBy = 'name';
                sortData();
              });
            },
            icon: Icon(Icons.sort_by_alpha),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                sortedBy = 'index';
                sortData();
              });
            },
            icon: Icon(Icons.format_list_numbered),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by Name',
              ),
            ),
            FittedBox(
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
                  DataColumn(label: Text('Average Attendance')),
                  DataColumn(label: Text('Total Classes')),
                  DataColumn(label: Text('Total Present')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: filteredData.asMap().entries.map((entry) {
                  final index = entry.key + 1;
                  final teacher = entry.value;
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
                      DataCell(Text(teacher['averageAttendance'] != null ? teacher['averageAttendance'].toString() : '')),
                      DataCell(Text(teacher['totalClasses'] != null ? teacher['totalClasses'].toString() : '')),
                      DataCell(Text(teacher['totalPresent'] != null ? teacher['totalPresent'].toString() : '')),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteTeacher(teacher['id']); // Assuming 'id' is the identifier for each teacher
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
