import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';
//import 'package:pacers_portal/dash/dashboard/admin_home.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> dept = <String>['Computer', 'Mechanical', 'ETC', 'IT'];

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController dept = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController add1 = TextEditingController();
  TextEditingController add2 = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 42, left: 19),
                child: Text("NEW TEACHER",
                    style:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 19),
                child: Text("BASIC INFORMATION",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 19),
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
              padding: const EdgeInsets.only(left: 19, top: 20),
              child: Row(
                children: [
                  Container(
                    height: 56,
                    width: 349,
                    child: TextFormField(
                      controller: fname,
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
                      controller: lname,
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
              padding: const EdgeInsets.only(top: 20, left: 19),
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
                      controller: dept,
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
                      controller: gender,
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
                      controller: dob,
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
                    style:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 19),
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
              padding: const EdgeInsets.only(top: 20, left: 19),
              child: Row(
                children: [
                  Container(
                    height: 46,
                    width: 349,
                    child: TextFormField(
                      controller: phone,
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
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 19),
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
              padding: const EdgeInsets.only(top: 20, left: 19),
              child: Row(
                children: [
                  Container(
                    height: 46,
                    width: 349,
                    child: TextFormField(
                      controller: add1,
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
                      controller: add2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 19),
              child: Container(
                height: 30,
                width: 135,
                child: ElevatedButton(
                    onPressed: addTeacher,
                    style: ElevatedButton.styleFrom(
                      primary:
                          Color.fromARGB(255, 255, 118, 67), // Background color
                      onPrimary: Colors.white, // Text color
                      padding: EdgeInsets.all(16), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Button border radius
                      ),
                    ),
                    child: Text("SUBMIT")),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTeacher() async {
    var url = "http://localhost:8000/teacherProfile";
    var data = {
      'name': fname.text,
      'phoneno': phone.text,
      'email': email.text,
      'address': add1.text
    };
    var bodyy = jsonEncode(data);
    var urlParse = Uri.parse(url);
    var response = await http.post(
      urlParse,
      headers: { "accept": "application/json", "content-type": "application/json" },
      body: bodyy,
    );
    var dataa = jsonDecode(response.body);
    print(dataa);
  }
}
