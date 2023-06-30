import 'package:flutter/material.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';


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
         toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        title: Text("Pacers Learning Hub"),
      ),
    
      body: Container(
       
        decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/test3.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
             
            height: 250,
            width: 300,
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
                  padding: const EdgeInsets.only(bottom: 20 , left:20,right: 20 , top: 20 ),
                  child: Center(
                    child: Text("Enter the OTP sent to your number",
                                   textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Color.fromARGB(255, 2, 101, 251),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold
                    ) ,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
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
                        backgroundColor:  Color.fromARGB(255, 35, 122, 254),
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
                        color: Colors.white
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
