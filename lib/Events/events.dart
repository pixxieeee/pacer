import 'package:flutter/material.dart';

class Eventslist extends StatefulWidget {
  const Eventslist({super.key});

  @override
  State<Eventslist> createState() => _EventslistState();
}

class _EventslistState extends State<Eventslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        toolbarHeight:106 ,
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    child: Text("Technical Event" , 
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
                                onPressed: () {},
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
                    child: Text("Non Technical Event" , 
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
                                onPressed: () {},
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
                    child: Text("Cultural Event" , 
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
                                onPressed: () {},
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
      ),
    );
  }
}