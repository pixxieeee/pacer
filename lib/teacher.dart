import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';
//import 'package:pacers_portal/dash/dashboard/admin_home.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:pacers_portal/teacher_form.dart';

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
          }, child: Icon(Icons.add),
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
      drawer:  drawer(),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: ListView.builder(
        itemCount: 1, // Change the itemCount as needed
        itemBuilder: (context, index) {
          return DataTable(
            columns: [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Department")),
              DataColumn(label: Text("Phonenumber")),
              DataColumn(label: Text("Email")),
              DataColumn(label: Text("Action"))
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("sejal")),
                DataCell(Text("Computer")),
                DataCell(Text("7038510912")),
                DataCell(Text("sejal.d@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("priyanka")),
                DataCell(Text("Computer")),
                DataCell(Text("7838510012")),
                DataCell(Text("Priyanka.talwarb@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("Aliya")),
                DataCell(Text("Computer")),
                DataCell(Text("8038510912")),
                DataCell(Text("aliya.d@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("Shubham")),
                DataCell(Text("Computer")),
                DataCell(Text("9038510912")),
                DataCell(Text("shub.d@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("suraj")),
                DataCell(Text("Computer")),
                DataCell(Text("6038510912")),
                DataCell(Text("suraj.t@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("suyog")),
                DataCell(Text("Computer")),
                DataCell(Text("4038510912")),
                DataCell(Text("suyog.r@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("sejal")),
                DataCell(Text("Computer")),
                DataCell(Text("7038510912")),
                DataCell(Text("sejal.d@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("sagar")),
                DataCell(Text("Computer")),
                DataCell(Text("7038510912")),
                DataCell(Text("sagar.t@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                DataCell(Text("himashu")),
                DataCell(Text("Computer")),
                DataCell(Text("9938510912")),
                DataCell(Text("himashu.t@gmail.com")),
                DataCell(Icon(Icons.edit)),
              ]),
              DataRow(cells: [
                DataCell(Text(' ${index + 1}')),
                    DataCell(Text("vaibhav")),
                    DataCell(Text("Computer")),
                    DataCell(Text("7738510912")),
                    DataCell(Text("vaibhav@gmail.com")),
                    DataCell(Icon(Icons.edit)),
              ]),

            ],
          );
        },
      ),
      
    );
  }
}
