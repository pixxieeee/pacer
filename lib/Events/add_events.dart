import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';

import 'package:pacers_portal/components/drawer.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: SizedBox(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Add New Event",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text("Title",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text("Description",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 35,
                        width: 250,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                color: Colors.blueGrey,
                height: 200,
                width: 200,
                child: Center(child: Text("Add a file")),
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Cancle")),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Submit"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
