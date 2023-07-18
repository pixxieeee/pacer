// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class GoogleFormScreen extends StatefulWidget {
//   @override
//   _GoogleFormScreenState createState() => _GoogleFormScreenState();
// }

// class _GoogleFormScreenState extends State<GoogleFormScreen> {
//   final String formUrl =
//       'https://docs.google.com/forms/d/e/1FAIpQLSfnvHL9csCPAlnt1qUcHEr6SiCQjneQjZhs9OMWPnIRJLVRuw/viewform?usp=sf_link'; // Replace with your Google Form URL

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Google Form'),
// //       ),
// //       body: WebView(
// //         initialUrl: formUrl,
// //         javascriptMode: JavascriptMode.unrestricted,
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class GoogleFormScreen extends StatelessWidget {
  final String formUrl =
      'https://docs.google.com/forms/d/e/1FAIpQLSfnvHL9csCPAlnt1qUcHEr6SiCQjneQjZhs9OMWPnIRJLVRuw/viewform';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        toolbarHeight:106 ,
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        
        child: SizedBox(
          child: Column(
            children: [
              Container(
                 decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 2, 101, 251),
                  ),
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Center(
                  child: Text("COLLEGE FEEDBACK" , 
                      style: TextStyle(
                        color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),),
                ),
                  
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: SizedBox(
                            height: 60,
                            width: 600 ,
                            child: ElevatedButton(
                              
                              style: TextButton.styleFrom(
                                      backgroundColor:  Color.fromARGB(255, 238, 240, 241),
                                      foregroundColor: Color.fromARGB(255, 76, 134, 215),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                    ),
                              onPressed: () => _launchFormUrl(context),
                              child: Text(' Google Form' , 
                              style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),

                    SizedBox( width: 100,),

                    SizedBox(
                      height: 60,
                      width: 600 ,
                      child: ElevatedButton(
                      
                         style: TextButton.styleFrom(
                                backgroundColor:  Color.fromARGB(255, 238, 240, 241),
                                foregroundColor: Color.fromARGB(255, 76, 134, 215),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                        onPressed: () {
                          // Add navigation logic to the desired page
                        },
                        child: Text('Response' , 
                        style: TextStyle(color: Colors.blue),),
                      ),
                    ),
                      ]
                    )

                  ],
                  
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                 decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 2, 101, 251),
                  ),
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Center(
                  child: Text("FACULTY FEEDBACK" , 
                      style: TextStyle(
                        color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),),
                ),
                  
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: SizedBox(
                            height: 60,
                            width: 600 ,
                            child: ElevatedButton(
                              
                              style: TextButton.styleFrom(
                                      backgroundColor:  Color.fromARGB(255, 238, 240, 241),
                                      foregroundColor: Color.fromARGB(255, 76, 134, 215),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                    ),
                              onPressed: () => _launchFormUrl(context),
                              child: Text('Google Form' , 
                              style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),

                    SizedBox( width: 100,),

                    SizedBox(
                      height: 60,
                      width: 600 ,
                      child: ElevatedButton(
                         style: TextButton.styleFrom(
                                backgroundColor:  Color.fromARGB(255, 238, 240, 241),
                                foregroundColor: Color.fromARGB(255, 76, 134, 215),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                        onPressed: () {
                          // Add navigation logic to the desired page
                        },
                        child: Text('Response' , 
                        style: TextStyle(color: Colors.blue),),
                      ),
                    ),
                      ]
                    )

                  ],
                  
                ),
              ),
            SizedBox(
              height: 50,
            ),
              Container(
                 decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 2, 101, 251),
                  ),
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Center(
                  child: Text("CATEEN FEEDBACK" , 
                      style: TextStyle(
                        color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),),
                ),
                  
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: SizedBox(
                            height: 60,
                            width: 600 ,
                            child: ElevatedButton(
                              
                              style: TextButton.styleFrom(
                                      backgroundColor:  Color.fromARGB(255, 238, 240, 241),
                                      foregroundColor: Color.fromARGB(255, 76, 134, 215),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                    ),
                              onPressed: () => _launchFormUrl(context),
                              child: Text('Google Form' , 
                              style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),

                    SizedBox( width: 100,),

                    SizedBox(
                      height: 60,
                      width: 600 ,
                      child: ElevatedButton(
                         style: TextButton.styleFrom(
                                backgroundColor:  Color.fromARGB(255, 238, 240, 241),
                                foregroundColor: Color.fromARGB(255, 76, 134, 215),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                        onPressed: () {
                          // Add navigation logic to the desired page
                        },
                        child: Text('Response' , 
                        style: TextStyle(color: Colors.blue),),
                      ),
                    ),
                      ]
                    )

                  ],
                  
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }

  void _launchFormUrl(BuildContext context) async {
    try {
      await FlutterWebBrowser.openWebPage(url: formUrl);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to launch the URL.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
