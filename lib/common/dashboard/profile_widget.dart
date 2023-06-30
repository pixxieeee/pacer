import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/images/test.jpg"),
          ),
          SizedBox(width: 60,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [Text(
                    'ADMIN DETAILS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Name: Priyanka Talwar', 
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                     
                    )),
                     SizedBox(height: 20),
                  Text('Phone Number : +917038510912' ,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      
                    )),
                  SizedBox(height: 20),
                  Text('Email: priyanka.talwarb@gmail.com' ,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      
                    )),
                  SizedBox(height: 20),
                  Text('Role: Administrator' ,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                     
                    )),],
          ))
        ],
      ),
    );
  }
}