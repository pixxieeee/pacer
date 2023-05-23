import 'dart:io';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:file_picker/file_picker.dart';
import 'package:pacers_portal/admin_home.dart';

class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  String _fileText = '';
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
      body: Column(
        children: [
          Center(
              child: IconButton(
                  onPressed: () {
                    _pickFile();
                  },
                  icon: Icon(Icons.file_present))),
          Text(_fileText)
        ],
      ),
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'jpg', 'jprg'],
    );

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.path);
      print(file.size);
      print(file.extension);

      File _file = File(result.files.single.path!);
      setState((() {
        _fileText = _file.path;
      }));
    }
  }

  void _saveAs() async {
    if (kIsWeb || Platform.isWindows) {
      return;
    }

    String? outputFile =
        await FilePicker.platform.saveFile(fileName: "output-file.pdf");
  }
}
