import 'package:flutter/material.dart';

class Eventdisplay extends StatefulWidget {
  const Eventdisplay({super.key});

  @override
  State<Eventdisplay> createState() => _EventdisplayState();
}

class _EventdisplayState extends State<Eventdisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        color: Color.fromARGB(255, 248, 249, 245),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}