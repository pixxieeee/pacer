import 'package:flutter/material.dart';
import 'package:pacers_portal/login/VerifyOtp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static String verify = "";

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isPhoneNumberValid = false;
  bool isButtonDisabled = false;
  var phone = "";

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }
  Future<void> sendVerificationCode() async {
    final response = await http.post(
      Uri.parse('https://pacerlearninghub.onrender.com/auth/sendOtpAdmin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phoneno': '${countryController.text + phoneController.text}',
      }),
    );

    if (response.statusCode == 200) {
      print('Request success with status: ${response.statusCode}');
      MyApp.verify= '${countryController.text + phoneController.text}';
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OtpVerification(),));
    } else {
      print('Request failed with status: ${response.statusCode}');
      // Handle request failure
    }
  }

  void validatePhoneNumber() {
    final String phoneNumber = phoneController.text.trim();

    if (phoneNumber.length == 10) {
      setState(() {
        isPhoneNumberValid = true;
      });
    } else {
      setState(() {
        isPhoneNumberValid = false;
      });
    }
  }

  void startButtonTimer() {
    setState(() {
      isButtonDisabled = true;
    });

    Timer(Duration(minutes: 1), () {
      setState(() {
        isButtonDisabled = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        title: Text(
          "Pacer's Learning Hub",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Phone Verification",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We need to login with your registered phone",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            child: TextField(
                              controller: countryController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Text(
                            "|",
                            style: TextStyle(fontSize: 33, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              onChanged: (value) {
                                validatePhoneNumber();
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 2, 101, 251),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: isPhoneNumberValid && !isButtonDisabled ? () {
                          sendVerificationCode();
                          startButtonTimer();
                        } : null,
                        child: Text("Send the code"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/images/test.jpg",
            fit: BoxFit.cover,
            width: 1000, // Adjust the width as needed
          ),
        ],
      ),
    );
  }
}