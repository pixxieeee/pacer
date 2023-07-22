import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pacers_portal/common/dashboard/admin_home.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:pacers_portal/notices/notice_form.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class Notice {
  final String title;
  final String message;
  final String filePath;

  Notice({required this.title, required this.message, required this.filePath});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      filePath: json['filepath'] ?? '',
    );
  }
}

class NoticeScreen extends StatefulWidget {
  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<Notice> notices = [];
  List<Notice> filteredNotices = [];
  TextEditingController searchController = TextEditingController();
  bool sortAscending = true;

  Future<void> fetchNotices() async {
    final response = await http.get(Uri.parse('http://localhost:8000/notice'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        notices = data.map((item) => Notice.fromJson(item)).toList();
        filteredNotices = notices;
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  void openPDF(String filePath) async {
    if (await canLaunch(filePath)) {
      await launch(filePath);
    } else {
      print('Could not launch $filePath');
    }
  }

  void sortNotices() {
    setState(() {
      sortAscending = !sortAscending;
      filteredNotices.sort((a, b) => sortAscending
          ? a.title.compareTo(b.title)
          : b.title.compareTo(a.title));
    });
  }

  void searchNotices(String query) {
    setState(() {
      filteredNotices = notices
          .where((notice) =>
              notice.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNotices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
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
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: searchNotices,
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotices.length,
              itemBuilder: (context, index) {
                final notice = filteredNotices[index];
                return ListTile(
                  title: Text('${index + 1}. ${notice.title}'),
                  subtitle: Text(notice.message),
                  onTap: () {
                    openPDF(notice.filePath);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: sortNotices,
            child: Icon(Icons.sort),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoticeForm()));
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
