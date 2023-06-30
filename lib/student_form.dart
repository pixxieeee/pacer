import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';

import 'package:pacers_portal/components/drawer.dart';

const List<String> dept = <String>['Computer', 'Mechanical', 'ETC', 'IT'];

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        title: Text("Pacers Learning Hub"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AdminHome())));
              },
              icon: Icon(Icons.arrow_back_ios))
        ],
      ),
      drawer: drawer(),
      body: Column(
        children:  [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 42, left: 19),
              child: Text("NEW STUDENT",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 19),
              child: Text("BASIC INFORMATION",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 20 , left: 19),
          child: Row(
            children: [
              SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("FIRSTNAME",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    width: 105,
                  ),
                  SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("LASTNAME",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
            ],
          ),
        ),
          
        Padding(
          padding: const EdgeInsets.only(left: 19 , top: 20),
          child: Row(
            children: [
              Container(
                      height: 56,
                      width: 349,
                      child: TextFormField(
                        maxLength: 25,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                     Container(
                        height: 56,
                        width: 349,
                        child: TextFormField(
                          maxLength: 75,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
            ],
          ),
        ),
Padding(
          padding: const EdgeInsets.only(top: 20 , left: 19),
          child: Row(
            children: [
              SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("DEPARTMENT",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    width: 102,
                  ),
                  SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("GENDER",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                   SizedBox(
                    width: 112,
                  ),
                  SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("DATE OF BIRTH",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 19),
          child: Row(
            children: [
                Container(
                        height: 56,
                        width: 349,
                        child: TextFormField(
                          maxLength: 25,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                       Container(
                          height: 56,
                          width: 349,
                          child: TextFormField(
                            maxLength: 75,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                        width: 25,
                      ),
                       Container(
                          height: 56,
                          width: 349,
                          child: TextFormField(
                            maxLength: 75,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
            ],
              ),
        ),
Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 42, left: 19),
              child: Text("CONTACT INFORMATION",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
            ),
          ),
          Padding(
          padding: const EdgeInsets.only(top: 20 , left: 19),
          child: Row(
            children: [
              SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("CONTACT NUMBER",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    width: 105,
                  ),
                  SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("EMAIL ID",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20 , left: 19),
          child: Row(
            children: [
              Container(
                        height: 46,
                        width: 349,
                        child: TextFormField(
                         
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                       Container(
                          height: 46,
                          width: 349,
                          child: TextFormField(
                           
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20 , left: 19),
          child: Row(
            children: [
              SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("ADDRESS LINE 1",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    width: 105,
                  ),
                  SizedBox(
                    height: 25,
                    width: 263,
                    child: Text("ADDRESS LINE 2",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20 , left: 19),
          child: Row(
            children: [
              Container(
                        height: 46,
                        width: 349,
                        child: TextFormField(
                         
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                       Container(
                          height: 46,
                          width: 349,
                          child: TextFormField(
                           
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        )
            ],
          ),
        ),
    Padding(
      padding: const EdgeInsets.only(top: 25 , left: 19),
      child: Container(
        height: 60,
        width: 435,
        child: ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          primary:Color.fromARGB(255, 2, 101, 251), // Background color
          onPrimary: Colors.white, // Text color
          padding: EdgeInsets.all(16), // Button padding
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Button border radius
          ),
        ), child:Text("SUBMIT") 
        ),
      ),
    )

     ],
     

     ),

      );
  }
}