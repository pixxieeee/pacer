import 'package:flutter/material.dart';
import 'package:pacers_portal/otp_verification.dart';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()));
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
      body: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 50),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
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
                          padding: const EdgeInsets.only(top: 20),
                          child: CircleAvatar(
                             radius: 80,
                          backgroundImage: AssetImage("assets/images/test1.png")
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 75),
                          child: TextFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: "Enter your Number",
                                hintStyle: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 35, 122, 254),
                                foregroundColor:
                                    Color.fromARGB(255, 109, 119, 133),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                          OtpVerification())));
                              },
                              child: Text(
                                "LogIn",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 90,),
              Image.asset("assets/images/test.jpg" , width : 700,)
            ],
          ),
        ),
      ),
    );
  }
}