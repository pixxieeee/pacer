import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pacers_portal/components/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pacers_portal/feedback/feedback_form.dart';

class FeedbackListScreen extends StatefulWidget {
  @override
  _FeedbackListScreenState createState() => _FeedbackListScreenState();
}

class _FeedbackListScreenState extends State<FeedbackListScreen> {
  List<Map<String, dynamic>> _feedbackList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchFeedbacks();
  }

  Future<void> _fetchFeedbacks() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
          Uri.parse('http://localhost:8000/feedback')); // Replace with the actual API URL to fetch feedbacks
      if (response.statusCode == 200) {
        final List<dynamic> feedbackData = jsonDecode(response.body);
        setState(() {
          _feedbackList = List<Map<String, dynamic>>.from(feedbackData);
        });
      } else {
        // Handle error if the request fails
        print('Failed to fetch feedbacks: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error if the request throws an exception
      print('Error fetching feedbacks: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _openFeedbackLink(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      print('Could not launch $link');
    }
  }

  Future<void> _deleteFeedback(String feedbackId) async {
    final String apiUrl = 'http://localhost:8000/feedback/$feedbackId';

    try {
      final response = await http.delete(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print('Feedback deleted successfully.');
        // After deleting, fetch the updated feedback list
        _fetchFeedbacks();
      } else {
        print('Error deleting feedback: ${response.body}');
      }
    } catch (e) {
      print('Error deleting feedback: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FeedbackForm()));
      }),
      appBar: AppBar(
        title: Text('Feedback List'),
      ),
      body: _isLoading
          ? Center(
              child: SpinKitCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            )
          : _feedbackList.isEmpty
              ? Center(
                  child: Text('No feedbacks available.'),
                )
              : ListView.builder(
                  itemCount: _feedbackList.length,
                  itemBuilder: (context, index) {
                    final feedback = _feedbackList[index];
                    return GestureDetector(
                      onTap: () => _openFeedbackLink(feedback['link']),
                      child: ListTile(
                        title: Text('${feedback['title']}'),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' ${feedback['description']}'),
                            ElevatedButton(
                              onPressed: () => _deleteFeedback(feedback['_id']),
                              child: Text('Delete Feedback'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
