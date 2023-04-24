import 'package:flutter/material.dart';

import 'otp_verification.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
        title: Text("Pacers Learning Hub"),
      ),
      body: Center(
        child: Container(
          height: 432,
          width: 444,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 255, 250, 248),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 236, 236, 234),
                blurRadius: 20.0,
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 250),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Enter your Number",
                      hintStyle: TextStyle(fontSize: 20)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 231, 232, 235),
                      foregroundColor: Color.fromARGB(255, 109, 119, 133),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => OtpVerification())));
                    },
                    child: Text(
                      "LogIn",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
