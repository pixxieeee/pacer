import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';
import 'package:pacers_portal/login/SendOtp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, registerRoute);
  }

  Future<String?> getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? finalId = sharedPreferences.getString('id');
    return finalId;
  }


  registerRoute() async {
    String? id = await getValidationData();
    if (id != null && id.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminHome()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 53.5),
          child: Image.asset("assets/images/pcce.PNG"),
        ),
      ),
    );
  }
}
