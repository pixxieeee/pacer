import 'package:flutter/material.dart';

const List<String> dept = <String>['Computer', 'Mechanical', 'ETC', 'IT'];

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 118, 67),
        title: Text("Pacers Learning Hub"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Oflutter.com'),
              accountEmail: Text('example@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              onTap: () {},
              title: Text("Dashboard"),
            ),
            ListTile(
              leading: Icon(Icons.switch_account_outlined),
              onTap: () {},
              title: Text("Teacher"),
            ),
            ListTile(
              leading: Icon(Icons.school_outlined),
              onTap: () {},
              title: Text("Student"),
            ),
            ListTile(
              leading: Icon(Icons.do_not_touch_outlined),
              onTap: () {},
              title: Text("Notice"),
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              onTap: () {},
              title: Text("Feedback"),
            ),
          ],
        ),
      ),
      body: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
            child: Column(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 500,
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "First Name"),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 500,
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Last Name"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                DropdownButtonFormField<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    filled: true,
                    hintText: "Department",
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: dept.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            )
        ],
      ),
          )),
    );
  }
}
