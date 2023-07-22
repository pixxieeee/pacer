import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    final response =
        await http.get(Uri.parse('http://localhost:8000/studentProfile'));
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

  Future<void> deleteStudent(studentId) async {
    print(studentId);
    final response = await http
        .delete(Uri.parse('http://localhost:8000/studentProfile/$studentId'));
    if (response.statusCode == 200) {
      // Student deleted successfully, update the UI accordingly
      setState(() {
        teacherData.removeWhere((student) => student['id'] == studentId);
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter the teacherData based on the searchQuery
    final filteredData = teacherData.where((student) {
      final name = student['name'].toString().toLowerCase();
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
              // Navigate to the admin home screen
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                 decoration: InputDecoration(
                  hintText: "Search By Name...",
                  prefixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderSide:
            BorderSide(width: 3, color: Colors.blueAccent), 
              borderRadius: BorderRadius.circular(50.0),
            ),
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
                    final student = entry.value;
                    final departmentId = student['department_id'] != null
                        ? student['department_id']['name']
                        : '';
        
                    return DataRow(
                      cells: [
                        DataCell(Text(index.toString())),
                        DataCell(Text(student['name'] ?? '')),
                        DataCell(Text(departmentId ?? '')),
                        DataCell(Text(student['phoneno'] ?? '')),
                        DataCell(Text(student['gender'] ?? '')),
                        DataCell(Text(student['birthdate'] ?? '')),
                        DataCell(Text(student['email'] ?? '')),
                        DataCell(Text(student['address'] ?? '')),
                        DataCell(Text(student['city'] ?? '')),
                        DataCell(Text(student['state'] ?? '')),
                        DataCell(Text(student['pincode'] != null
                            ? student['pincode'].toString()
                            : '')),
                        DataCell(
                          student['imagepath'] != null
                              ? Image.network(
                                  student['imagepath'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                )
                              : SizedBox(),
                        ),
                        DataCell(Text(student['averageAttendance'] != null
                            ? student['averageAttendance'].toString()
                            : '')),
                        DataCell(Text(student['totalClasses'] != null
                            ? student['totalClasses'].toString()
                            : '')),
                        DataCell(Text(student['totalPresent'] != null
                            ? student['totalPresent'].toString()
                            : '')),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteStudent(student[
                                  '_id']); // Assuming 'id' is the identifier for each student
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
      ),
    );
  }
}
