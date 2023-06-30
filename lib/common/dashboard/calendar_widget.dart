import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String name;
  final bool canBubble;

  Event(this.name, {this.canBubble = false});
}

class Calenderwidget extends StatefulWidget {
  @override
  _CalenderwidgetState createState() => _CalenderwidgetState();
}

class _CalenderwidgetState extends State<Calenderwidget> {
  DateTime _focusedday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255,248,249,245),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "${DateFormat("MMM, yyyy").format(_focusedday)}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 , color: Color.fromARGB(255, 2, 101, 251)) ,
                ),
                Row(
                  children: [
                    InkWell(
                     
                      onTap: () {
                        setState(() {
                          _focusedday =
                              DateTime(_focusedday.year, _focusedday.month - 1);
                        });
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color:  Color.fromARGB(255, 2, 101, 251),
                      ),
                    ),
                    InkWell(
                     
                      onTap: () {
                        setState(() {
                          _focusedday =
                              DateTime(_focusedday.year, _focusedday.month + 1);
                        });
                      },
                      child: Icon(
                        Icons.chevron_right,
                        color:Color.fromARGB(255, 2, 101, 251),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          TableCalendar(
            focusedDay: _focusedday,
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2040),
            headerVisible: false,
            onFormatChanged: (result) {},
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                return DateFormat("EEE").format(date).toUpperCase();
              },
              weekendStyle: TextStyle(fontWeight: FontWeight.bold),
              weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPageChanged: (day) {
              setState(() {
                _focusedday = day;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 101, 251),
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color:Color.fromARGB(255, 2, 101, 251),
                shape: BoxShape.circle,
              ),
            ),
            // eventLoader: (day) {
            //   if (day.day == 22 || day.day == 12) {
            //     return [Event("Event Name", canBubble: true)];
            //   }
            //   return [];
            // },
          ),
        ],
      ),
    );
  }
}