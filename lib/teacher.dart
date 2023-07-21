import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pacers_portal/common/dashboard/admin_home.dart';
import 'dart:convert';

import 'package:pacers_portal/teacher_form.dart';

class Teacher extends StatefulWidget {
  @override
  _TeacherState createState() => _TeacherState();
}

enum SortOrder { ascending, descending }

class _TeacherState extends State<Teacher> {
  List<dynamic> teacherData = [];
  List<dynamic> filteredTeacherData = [];
  TextEditingController searchController = TextEditingController();

  int sortColumnIndex = 0;
  SortOrder sortOrder = SortOrder.ascending;

  Future<void> fetchTeacherData() async {
    final response = await http.get(Uri.parse('http://localhost:8000/teacherProfile'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        teacherData = data;
        filteredTeacherData = data;
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  Future<void> deleteTeacher(int index) async {
    if (index < 0 || index >= filteredTeacherData.length) {
      return;
    }

    final deletedTeacher = filteredTeacherData[index];
   // final teacherId = deletedTeacher['id'];

    final response = await http.delete(Uri.parse('http://localhost:8000/teacher/$index'));
    if (response.statusCode == 200) {
      setState(() {
        teacherData.remove(deletedTeacher);
        filteredTeacherData.remove(deletedTeacher);
      });
      // Show a success message or perform any other necessary actions
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  void sortTeacherData(int columnIndex) {
    setState(() {
      if (sortColumnIndex == columnIndex) {
        sortOrder =
            sortOrder == SortOrder.ascending ? SortOrder.descending : SortOrder.ascending;
      } else {
        sortColumnIndex = columnIndex;
        sortOrder = SortOrder.ascending;
      }

      filteredTeacherData.sort((a, b) {
        final valueA = a.values.toList()[columnIndex];
        final valueB = b.values.toList()[columnIndex];

        if (valueA is String && valueB is String) {
          return sortOrder == SortOrder.ascending ? valueA.compareTo(valueB) : valueB.compareTo(valueA);
        } else if (valueA is DateTime && valueB is DateTime) {
          return sortOrder == SortOrder.ascending ? valueA.compareTo(valueB) : valueB.compareTo(valueA);
        } else {
          return 0;
        }
      });
    });
  }

  void searchTeacherData(String query) {
    setState(() {
      filteredTeacherData = teacherData.where((teacher) {
        final name = teacher['name'].toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTeacherData();
  }

  Future<void> confirmDelete(int index) async {
    final confirmed = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Deletion'),
        content: Text('Are you sure you want to delete this teacher?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      deleteTeacher(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Assuming TeacherForm is the form to add a new teacher
          Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherForm()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      appBar: AppBar(
        toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        title: Text("Pacers Learning Hub"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              controller: searchController,
              onChanged: searchTeacherData,
              decoration: InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FittedBox(
                child: DataTable(
                  sortColumnIndex: sortColumnIndex,
                  sortAscending: sortOrder == SortOrder.ascending,
                  columns: [
                    DataColumn(
                      label: Text('Index'),
                      onSort: (columnIndex, _) => sortTeacherData(columnIndex),
                    ),
                    DataColumn(
                      label: Text('Name'),
                      onSort: (columnIndex, _) => sortTeacherData(columnIndex),
                    ),
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
                    DataColumn(label: Text('Action')),
                  ],
                  rows: filteredTeacherData.asMap().entries.map((entry) {
                    final index = entry.key;
                    final teacher = entry.value;

                    final departmentId =
                        teacher['department_id'] != null ? teacher['department_id']['name'] : '';

                    return DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
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
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => confirmDelete(index),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

