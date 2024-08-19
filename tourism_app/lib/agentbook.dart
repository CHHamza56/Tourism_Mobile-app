// ignore_for_file: prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, camel_case_types, deprecated_member_use, use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class agentbook extends StatefulWidget {
  final String name;
  final String overall;
  final String project;
  final String img;
  const agentbook(
      {Key? key,
      required this.name,
      required this.img,
      required this.overall,
      required this.project})
      : super(key: key);

  @override
  _agentbookState createState() => _agentbookState();
}

class _agentbookState extends State<agentbook> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();

  String _durationUnit = 'days'; // Default value
  Future<void> insertData() async {
    print("SADas");
    var res = await http.post(
      Uri.parse("https://apptocoder.com/CsHamza/agentform.php"),
      body: {
        "Name": _nameController.text,
        "Email": _emailController.text,
        "phone": _phoneController.text,
        "date": _dateController.text,
        "duration": _durationController.text,
        "people": _peopleController.text,
        "language": _languageController.text,
        "comment": _commentsController.text,
        "userid": "1",
        "name": widget.name,
        "overall": widget.overall,
        "project": widget.project,
        "img": widget.img,
      },
    );

    var response = jsonDecode(res.body);
    print(response.toString());
    if (response["Success"] != 'false') {
      print("success");
      // Show success Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Form successfully!',
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      print("failed");
      // Show error Snackbar if submission failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            'Form submission failed.',
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agent Booking Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date of Tour'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date of the tour';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(
                  labelText: 'Duration',
                  suffix: DropdownButton<String>(
                    value: _durationUnit,
                    onChanged: (String? newValue) {
                      setState(() {
                        _durationUnit = newValue!;
                      });
                    },
                    items: <String>['days', 'hours']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the duration of the tour';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _peopleController,
                decoration: InputDecoration(labelText: 'Number of People'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of people';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _languageController,
                decoration: InputDecoration(labelText: 'Preferred Language'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the preferred language';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _commentsController,
                decoration: InputDecoration(labelText: 'Additional Comments'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    insertData();
                    // Handle form submission
                    // You can send the data to your server or perform any other actions
                    print('Booking details:');
                    print('Name: ${_nameController.text}');
                    print('Email: ${_emailController.text}');
                    print('Phone: ${_phoneController.text}');
                    print('Date: ${_dateController.text}');
                    print(
                        'Duration: ${_durationController.text} $_durationUnit');
                    print('People: ${_peopleController.text}');
                    print('Language: ${_languageController.text}');
                    print('Comments: ${_commentsController.text}');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
