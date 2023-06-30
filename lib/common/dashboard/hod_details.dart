import 'package:flutter/material.dart';
import 'package:pacers_portal/common/app_colors.dart';

class HodDetails extends StatefulWidget {
  const HodDetails({Key? key}) : super(key: key);

  @override
  State<HodDetails> createState() => _HodDetailsState();
}

class _HodDetailsState extends State<HodDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 248, 249, 245),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "HEAD OF DEPARTMENTS",
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 101, 251),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 101, 251),
                  borderRadius: BorderRadius.circular(100),
                ),
                // Add any content you want to display inside the container
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                ),
                children: [
                  tableHeader("FULL NAME"),
                  tableHeader("DEPARTMENT"),
                  tableHeader("EMAIL ID"),
                ],
              ),
              TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset("assets/images/test2.jpeg",
                                width: 40),
                          ),
                          SizedBox(width: 10),
                          Text("name")
                        ],
                      ),
                    ),
//department
                    Text("department"),
// emailid
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColor.black),
                          height: 10,
                          width: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("emailid")
                      ],
                    ),
                  ])
            ],
          ),
        ],
      ),
    );
  }

  TableRow tableRow(context , {name,image,department,emailid,colo }) {
    return TableRow();
  }

  Widget tableHeader(text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 2, 101, 251),
        ),
      ),
    );
  }
}
