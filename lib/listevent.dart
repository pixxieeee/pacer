// // //  import 'package:flutter/material.dart';

// // // class EventList extends StatefulWidget {
// // //   @override
// // //   _EventListState createState() => _EventListState();
// // // }
// // // class _EventListState extends State<EventList> {
// // //   List<Event> events = [
// // //     Event(
// // //       id: 1,
// // //       title: 'Event 1',
// // //       date: DateTime.now(),
// // //     ),
// // //     Event(
// // //       id: 2,
// // //       title: 'Event 2',
// // //       date: DateTime.now().add(Duration(days: 1)),
// // //     ),
// // //     Event(
// // //       id: 3,
// // //       title: 'Event 3',
// // //       date: DateTime.now().add(Duration(days: 2)),
// // //     ),
// // //   ];
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Event List'),
// // //       ),
// // //       body: ListView.builder(
// // //         itemCount: events.length,
// // //         itemBuilder: (context, index) {
// // //           final event = events[index];
// // //           return Card(
// // //             child: ListTile(
// // //               title: Text(event.title),
// // //               subtitle: Text(event.date.toString()),
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// // // class Event {
// // //   final int id;
// // //   final String title;
// // //   final DateTime date;
// // //   Event({
// // //     required this.id,
// // //     required this.title,
// // //     required this.date,
// // //   });
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:syncfusion_flutter_charts/charts.dart';

// // class EventlistPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Dashboard'),
// //       ),
// //       body: Column(
// //         children: [
// //           Text('This is your dashboard'),
// //           Expanded(
// //             child: Container(
// //               padding: EdgeInsets.all(16.0),
// //               child: Card(
// //                 child: Padding(
// //                   padding: EdgeInsets.all(16.0),
// //                   child: Column(
// // //                     children: [
// // //                       Text('Sales Chart'),
// // //                       Expanded(
// // //                         child: SfCircularChart(
// // //                           series: <CircularSeries>[
// // //                             PieSeries<SalesData, String>(
// // //                               dataSource: <SalesData>[
// // //                                 SalesData(DateTime(2022, 1, 1), 100),
// // //                                 SalesData(DateTime(2022, 2, 1), 200),
// // //                                 SalesData(DateTime(2022, 3, 1), 300),
// // //                                 SalesData(DateTime(2022, 4, 1), 400),
// // //                                 SalesData(DateTime(2022, 5, 1), 500),
// // //                               ],
// // //                               xValueMapper: (SalesData sales, _) =>
// // //                                   sales.year.toString(),
// // //                               yValueMapper: (SalesData sales, _) =>
// // //                                   sales.sales,
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class SalesData {
// // //   final DateTime year;
// // //   final double sales;

// // //   SalesData(this.year, this.sales);
// // // }
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:googleapis_auth/googleapis_auth.dart' as auth;
// import 'package:googleapis/sheets/v4.dart' as sheets;
// import 'package:http/http.dart' as http;

// const _Credentials =
// {
//   "type": "service_account",
//   "project_id": "feedback-393109",
//   "private_key_id": "afda8d5b2c5fc8b67ccf0d6aabd2ec0bde5bcf3c",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDt5dR0BB/GbjcZ\nhy+xhFCyf1PaW8Duw3X6/n7A1y2h7R0KshMYk4HwEr33+2iD270A9KTs7Tsn0ybj\nCxsfRPPhcnUaw5sERmKmA1+fglsE8kd12DgIUPJ5QBcz0IKKRyTXhmHa92vQ0/Ia\nzFI5twVlJG2kjsVCIU5SUb0cilj3ltiek3pCS+FoVe93/NIoRQfHjvLKY9YJxkt8\nq8SCqtwOSy/Yllfl3/YMFx9zkLCPQq1exgGxbCsnH9Fqu4B8CulXrA3Hp4Kt6KZc\nyUJuM6N361ChykZJj/uHEysFvGPfZHkMmI5XkgcoUsMohldlMQ/WeSUCtBLjhrp3\n5KOAqcsnAgMBAAECggEAVa2ndV0i4IFDQONqLuG7en3XAlZ3RsaIkCvmFKeqnJ3c\nDsURkZFWg9MMLeqSuqKCEH0LhPTvkClA4RZX30wjFXf2avw1sTV0Q9wFLVpyU3a6\ne9uyWnRkz3xgnt2ilhCHWUPhrE3du6kJkdMybezXeZTEFDcDHg0GuykLFeNRpWEx\nwgwWXgjbU59pVoX3MuJMUP+cLlQYxg5JFSJvXdjQVtRQkjhdtMWyfGBfMiBbDU0m\nrNfDOfaBj1/rBGVVpfP0Nla2amqyGqqS8/kA7gJfmLTI8fW4bkejdPac6nweUXFp\nCLVXtXLNVOsGncBuf3MfZ26jBw7S0/Zq9grK8SrPkQKBgQD38+4mBkiFP+kYX/N9\nMxxdkJXn8MXYk3TcMvbeiLLi9CLFTmNMNcWeRoREm2oYTN4t31HhF6wXNZgX+qcf\nd+ZyIzyZhvL7x9Iw6ilggDbn2jYwbx+TJsVBQ9lGqzYDK8R1KeARFF5xl8pH/5gq\nBhP4c9wNkIeZYJMV1PAn6UzbKQKBgQD1nlvf+VcAQ8Vdx/01fqu/mZjV8Y0qrYYl\nKUg3F1lFbg5ZRF9+YjlDIYGt51RMVyvkgeky/NfNrxIxJ0bjgJKuhENpLXD7lnsi\n3uE1o7iJeUhBsYEk6UkFrgFJohvRMOwCK7Bh/KRoVCCfxI9sVZWEVsIok0RIdQBC\nB6RPCTeNzwKBgQCy679uitwr4xlVsG9oachPL/UsQE7T4FvURaZkoGnNYXPxwoXe\nyXKHqsTpKOifDmDI4zwXXFifCtpsez+7cm7E7+5brsiJrQBcsawX6Y01Mv4lZxp2\nueRfGxGfcA5yrVN/ZC8+w97+wxSBbcukj2w7vYcN9rwSjmC0wUpm0m/WOQKBgHx0\n2akL9wGzVXbHt447uVtEwSTnWNifRLHf0S/ZLOr5cVvaQWkQ7GMPv14XMafdI+iN\ny1SCufcHFvjBJjJxG+JCMsZAuFdDUPHCbet4IjHGus5O21mQu+ec3BorglzlpTEU\nYjPEiKo0trM+Lk5+r1x3ebqFpLvyTUcoCCHkUboRAoGAQfPso616N8c+IEEagm7P\ngoOVVx7XGxmVDazumLCm9Fe/e74AkGiVbjYS2qjjuMyZ4a4Hwtwz9lgIMtT/L4Ib\naeNRO103gCzQ9hnGW2F4rrm4LE1wfzkDsII4VS+ccva78CKFSftv+PcRjlsJMxp8\nTw0LNKZ7+SBHgKxtrIsevKQ=\n-----END PRIVATE KEY-----\n",
//   "client_email": "teacher-feedback@feedback-393109.iam.gserviceaccount.com",
//   "client_id": "107800947702798769227",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/teacher-feedback%40feedback-393109.iam.gserviceaccount.com",
//   "universe_domain": "googleapis.com" 
// };

// Future<auth.ServiceAccountCredentials> createCredentials() async {
//   final credentialsJson = await http.read(Uri.parse(_Credentials);
//   return auth.ServiceAccountCredentials.fromJson(credentialsJson);
// }



// Future<List<List<Object?>>> fetchResponses() async {
//   final credentials = await createCredentials();
//   final client = await auth.clientViaServiceAccount(credentials, scopes: sheets.SheetsApi.spreadsheetsReadonlyScope);

//   final spreadsheetId = '1W2lW5uyZwHmWwxC-G9K7JPw32-0fHXy09A7yWwNaNm0';
//   final range = 'Sheet1!A1:E'; // Update with the desired sheet and range

//   final response = await client.sheets.spreadsheets.values.get(spreadsheetId, range);
//   final values = response.values;

//   return values ?? [];
// }

// class DashboardPage extends StatefulWidget {
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   List<List<Object?>> responses = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchFormResponses();
//   }

//   Future<void> fetchFormResponses() async {
//     final fetchedResponses = await fetchResponses();
//     setState(() {
//       responses = fetchedResponses;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Center(
//         child: ListView.builder(
//           itemCount: responses.length,
//           itemBuilder: (context, index) {
//             final response = responses[index];
//             return ListTile(
//               title: Text(response[0]?.toString() ?? ''),
//               subtitle: Text(response[1]?.toString() ?? ''),
//               // Customize the ListTile as per your requirements
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
