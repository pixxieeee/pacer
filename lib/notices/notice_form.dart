import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

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

class NoticeForm extends StatefulWidget {
  @override
  _NoticeFormState createState() => _NoticeFormState();
}

class _NoticeFormState extends State<NoticeForm> {
  String? filePath;
  String yearId = '';
  String title = '';
  String message = '';

  Future<String?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      return file.path;
    } else {
      // User canceled the file selection
      return null;
    }
  }

  Future<void> uploadFile(String filePath, String yearId, String title, String message) async {
    Uri url = Uri.parse('http://localhost:8000/notice'); // Replace with your server endpoint

    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('_fileText', filePath));
    request.fields['year_id'] = yearId;
    request.fields['title'] = title;
    request.fields['message'] = message;

    var response = await request.send();
    if (response.statusCode == 200) {
      // File uploaded successfully
      print('File uploaded');
    } else {
      // Handle upload failure
      print('File upload failed');
    }
  }

  void selectFile() async {
    String? path = await pickFile();
    setState(() {
      filePath = path;
    });
  }

  void uploadNotice() async {
    if (filePath != null) {
      await uploadFile(filePath!, yearId, title, message);
    } else {
      // File not selected
      print('Please select a file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Notice'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  yearId = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Year ID',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Message',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: selectFile,
              child: Text('Select File'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: uploadNotice,
              child: Text('Upload Notice'),
            ),
          ],
        ),
      ),
    );
  }
}


