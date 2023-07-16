import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';
import 'package:pinput/pinput.dart';
import 'package:pacers_portal/sendOtp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String code = "";
  bool isValueValid = false;
  Future<void> verifyPhoneNumber() async {
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
      print('Request success with status:');
      final responseBody = jsonDecode(response.body);

      final token = responseBody['token'];

      final decodedToken = jsonDecode(utf8.decode(base64Url.decode(token.split('.')[1])));
      print(decodedToken);
      final id = decodedToken['id'];
      final phoneNumber = decodedToken['phoneno'];
      print('${id}');
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => AdminHome(
            id: '${id}',
            phoneno: '${phoneNumber}',
          ),),);
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              onChanged: (value) {
                setState(() {
                  code = value;
                  isValueValid = value.length == 6;
                });
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
                onPressed: isValueValid ? verifyPhoneNumber : null,
                child: Text(
                  "Verify Phone Number",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp(),
                  ),
                );
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
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
