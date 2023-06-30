import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';

import 'package:pacers_portal/components/drawer.dart';

const List<String> dept = <String>['Computer', 'Mechanical', 'ETC', 'IT'];

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
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
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 42, left: 19),
              child: Text(" ADD NEW EVENT",
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
            padding: const EdgeInsets.only(top: 20, left: 19),
            child: Row(
              children: const [
                SizedBox(
                  height: 25,
                  width: 263,
                  child: Text("Title",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  width: 105,
                ),
                SizedBox(
                  height: 25,
                  width: 263,
                  child: Text("Description",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, bottom: 30),
              child: Container(
                height: 402,
                width: 444,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(250, 252, 253, 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 236, 236, 234),
                      blurRadius: 20.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        " Upload a file",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 50), // Add some spacing between text boxes
                    Text(
                      " Drag or Drop files to upload",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 150), // Add some spacing between text boxes
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                  255, 35, 122, 254), // Background color
                              onPrimary: Colors.white, // Text color
                              padding: EdgeInsets.all(16), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15), // Button border radius
                              ),
                            ),
                          child: Text('Submit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, bottom: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: 320,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 35, 122, 254), // Background color
                          onPrimary: Colors.white, // Text color
                          padding: EdgeInsets.all(16), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Button border radius
                          ),
                        ),
                        child: Text("CANCEL")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 20),
                  child: Container(
                    height: 50,
                    width: 320,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 35, 122, 254), // Background color
                          onPrimary: Colors.white, // Text color
                          padding: EdgeInsets.all(16), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Button border radius
                          ),
                        ),
                        child: Text("SUBMIT")),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
