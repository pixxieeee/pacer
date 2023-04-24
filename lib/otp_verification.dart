import 'package:flutter/material.dart';
import 'package:pacers_portal/admin_home.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
                padding: const EdgeInsets.only(top: 200,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      child: TextFormField(
                        autofocus: true,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextFormField(
                        autofocus: true,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextFormField(
                        autofocus: true,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextFormField(
                        autofocus: true,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
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
                              builder: ((context) => AdminHome())));
                    },
                    child: Text("LogIn",
                    style: TextStyle(
                      color: Colors.black
                    ),),
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
