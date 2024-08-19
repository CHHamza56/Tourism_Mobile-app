// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class detailPage extends StatefulWidget {
  final String name;
  final String img;
  final String price;

  detailPage({
    Key? key,
    required this.name,
    required this.img,
    required this.price,
  }) : super(key: key);

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  String? _selectedDestinationCity;
  late TextEditingController _fullNameController;
  late TextEditingController _cnicController;
  late TextEditingController _numberOfPersonsController;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _fullNameController = TextEditingController();
    _cnicController = TextEditingController();
    _numberOfPersonsController = TextEditingController();
    _messageController = TextEditingController();
    _selectedDestinationCity = null;
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _fullNameController.dispose();
    _cnicController.dispose();
    _numberOfPersonsController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> insertData() async {
    var res = await http.post(
      Uri.parse("https://apptocoder.com/CsHamza/carbook.php"),
      body: {
        "Full_name": _fullNameController.text,
        "CNIC": _cnicController.text,
        "city": _selectedDestinationCity!,
        "start_date": _startDateController.text,
        "enddate": _endDateController.text,
        "person": _numberOfPersonsController.text,
        "message": _messageController.text,
        "user": "1",
        "carname": widget.name,
        "price": widget.price,
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

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.img,
              ),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cnicController,
                decoration: InputDecoration(labelText: 'CNIC'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your CNIC';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedDestinationCity,
                items: [
                  'Lahore',
                  'Karachi',
                  'Islamabad',
                  'Okara',
                  'Attock',
                  'Bahawalpur',
                  'Multan'
                ].map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDestinationCity = value;
                  });
                },
                decoration:
                    InputDecoration(labelText: 'Select Destination City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select destination city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _startDateController,
                      decoration: InputDecoration(
                        labelText: 'Start Date',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _selectDate(context, _startDateController);
                          },
                          child: Icon(Icons.calendar_today),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select start date';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      controller: _endDateController,
                      decoration: InputDecoration(
                        labelText: 'End Date',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _selectDate(context, _endDateController);
                          },
                          child: Icon(Icons.calendar_today),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select end date';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _numberOfPersonsController,
                decoration: InputDecoration(labelText: 'Number of Persons'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of persons';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(labelText: 'Message'),
                maxLines: 3,
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, proceed with form submission
                      insertData();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Set background color to blue
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 16, // Adjust as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
