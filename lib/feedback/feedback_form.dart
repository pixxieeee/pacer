import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pacers_portal/components/drawer.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _yearIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  String yearID() {
    if (_yearIdController.text.toLowerCase() == 'FE'.toLowerCase())
      return '646e16848f5889356ddf5583';
    if (_yearIdController.text.toLowerCase() == 'SE'.toLowerCase())
      return '646e168d8f5889356ddf5585';
    if (_yearIdController.text.toLowerCase() == 'TE'.toLowerCase())
      return '646e16958f5889356ddf5587';
    if (_yearIdController.text.toLowerCase() == 'BE'.toLowerCase())
      return '646e169a8f5889356ddf5589';
    return '646e169a8f5889356ddf5589';
  }

  void _submitFeedback() async {
    final String apiUrl =
        'http://localhost:8000/feedback'; // Replace with your actual API URL
    var _errorMessage = '';
    if (yearID().isEmpty ||
        _titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _linkController.text.isEmpty) {
      setState(() {
        _errorMessage = 'All fields are required';
      });
      return;
    }

    Map<String, String> data = {
      'year_id': yearID(),
      'title': _titleController.text,
      'description': _descriptionController.text,
      'link': _linkController.text,
    };
    print(json.encode(data));
    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Feedback data was successfully saved
      print('Feedback data saved successfully.');
      setState(() {
        _errorMessage = '';
      });
    } else {
      // Error saving feedback data
      print('Error saving feedback data: ${response.body}');
      setState(() {
        _errorMessage = 'Error saving feedback data. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _yearIdController,
              decoration: InputDecoration(labelText: 'Year '),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _linkController,
              decoration: InputDecoration(labelText: 'Link'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitFeedback,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
