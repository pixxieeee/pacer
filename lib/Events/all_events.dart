import 'package:flutter/material.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:pacers_portal/Events/event_form.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  final DataTableSource _data = MyData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => EventForm())));
      },
      child: Icon(Icons.add),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white, // Button padding
                ),
      appBar: AppBar(
        toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251)
      ),
      drawer: drawer(),
      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: PaginatedDataTable(
            source: _data,
            columns: [
              DataColumn(label: Text("id")),
              DataColumn(label: Text("Title")),
              DataColumn(label: Text("subject")),
              DataColumn(label: Text("department")),
              DataColumn(label: Text("file number")),
              DataColumn(label: Text("description")),
            ],
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      50,
      (index) => {
            "id": index,
            "title": "item $index",
            "subject": "subject $index",
            "department": "didepartment $index",
            "file number": "file number $index",
            "description": "description $index",
          });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]["id"].toString())),
      DataCell(Text(_data[index]["title"].toString())),
      DataCell(Text(_data[index]["subject"].toString())),
      DataCell(Text(_data[index]["department"].toString())),
      DataCell(Text(_data[index]["file number"].toString())),
      DataCell(Text(_data[index]["description"].toString())),
    ]);
  }
  

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
