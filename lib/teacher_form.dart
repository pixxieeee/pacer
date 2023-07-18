import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pacers_portal/common/dashboard/admin_home.dart';
import 'package:pacers_portal/components/drawer.dart';

class TeacherForm extends StatefulWidget {
  @override
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  File? selectedImage;

  Future<void> postStudentData() async {
    final url = Uri.parse('http://localhost:8000/teacherProfile');

    final request = http.MultipartRequest('POST', url);
    final headers = {'Content-Type': 'multipart/form-data'};

    final data = {
      //  'year_id': '<YEAR_ID>',
      'name': nameController.text,
      'phoneno': phonenoController.text,
      'gender': genderController.text,
      'birthdate': birthdateController.text,
      // 'department_id': '<DEPARTMENT_ID>',
      'email': emailController.text,
      'address': addressController.text,
      'city': cityController.text,
      'state': stateController.text,
      'pincode': pincodeController.text,
    };

    request.headers.addAll(headers);
    request.fields.addAll(data);

    if (selectedImage != null) {
      final fileStream = http.ByteStream(selectedImage!.openRead());
      final fileLength = await selectedImage!.length();
      final fileName = selectedImage!.path.split('/').last;

      final multipartFile = http.MultipartFile(
        'photo',
        fileStream,
        fileLength,
        filename: fileName,
        contentType: MediaType('image', 'jpeg'),
      );

      request.files.add(multipartFile);
    }

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      // Student data posted successfully
      print('Student data posted successfully');
      // Reset the form and selected image
      _formKey.currentState!.reset();
      setState(() {
        selectedImage = null;
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phonenoController.dispose();
    genderController.dispose();
    birthdateController.dispose();
    departmentController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 106,
        backgroundColor: Color.fromARGB(255, 2, 101, 251),
        title: Text("Pacers Learning Hub"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AdminHome())));
              },
              icon: Icon(Icons.arrow_back_ios))
        ],
      ),
      drawer: drawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: Image.file(selectedImage!, fit: BoxFit.cover),
                        )
                      : Icon(Icons.camera_alt, size: 50),
                ),
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phonenoController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: birthdateController,
                decoration: InputDecoration(labelText: 'Birthdate'),
              ),
              TextFormField(
                controller: departmentController,
                decoration: InputDecoration(labelText: 'Department'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: stateController,
                decoration: InputDecoration(labelText: 'State'),
              ),
              TextFormField(
                controller: pincodeController,
                decoration: InputDecoration(labelText: 'Pincode'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    postStudentData();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
