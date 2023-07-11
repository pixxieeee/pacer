import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';
import 'package:pinput/pinput.dart';
import 'package:pacers_portal/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    var code="";
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
         toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        title: Text("Pacers Learning Hub"),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/image1.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 25),
            Text(
              "Phone Verification",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "We need to register your phone without getting started!",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Pinput(
              length: 6,
              onChanged: (value) {
                code = value;
              },
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 2, 101, 251),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  print(code);
                  final response = await http.post(
                    Uri.parse('https://pacerlearninghub.onrender.com/auth/verifyOtpAdmin'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonEncode({
                      'phoneno': MyApp.verify,
                      'otp': code,
                    }),
                  );
                  if (response.statusCode == 200) {
                    print('Request sucess with status:-------------------------------------------------------------------------');
                    final responseBody = jsonDecode(response.body);

                    // Extract the token from the response
                    final token = responseBody['token'];

                    // Decode the JWT token
                    final decodedToken = jsonDecode(utf8.decode(base64Url.decode(token.split('.')[1])));
                    print(decodedToken);
                    final id = decodedToken['id'];
                    final phoneNumber = decodedToken['phoneno'];
                    print('${id}//////////////////////////////////////////////////////////////////////////////////////////');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AdminHome(
                        id: '${id}',
                        phoneno:'${phoneNumber}',
                      )),
                    );
                  } else {
                    // Request failed
                    print('Request failed with status: ${response.statusCode}');
                  }
                },
                child: Text(
                  "Verify Phone Number",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(
                      // id: '',
                      // phoneno: '',
                      // attendance: 100,
                    ),
                  ),
                );
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text(
                  "Edit Phone Number ?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
