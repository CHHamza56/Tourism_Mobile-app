// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, camel_case_types, use_build_context_synchronously, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class tourbooking extends StatefulWidget {
  final String price;
  final String img;
  final String name;

  tourbooking({
    Key? key,
    required this.price,
    required this.img,
    required this.name,
  }) : super(key: key);

  @override
  State<tourbooking> createState() => _tourbookingState();
}

class _tourbookingState extends State<tourbooking> {
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late TextEditingController _startDateController;
  String? _numberOfPersonsValue;
  String? _selectedDaysValue;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    _startDateController = TextEditingController();
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
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _insertData() async {
    try {
      var res = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/tourbook.php"),
        body: {
          "startdate": _startDateController.text,
          "people": _numberOfPersonsValue ?? '',
          "days": _selectedDaysValue ?? '',
          "Email": _emailController.text,
          "NO": _mobileController.text,
          "price": widget.price,
          "img": widget.img,
          "userid": "1",
          "name": widget.name,
        },
      );

      var response = jsonDecode(res.body);
      print(response.toString());
      if (response["Success"] != false) {
        print("success");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Form submitted successfully!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        print("failed");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Form submission failed.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Text(
            widget.price,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Booking Form',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Image.network(
                widget.img,
              ),
              SizedBox(height: 20),
              TextFormField(
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
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _numberOfPersonsValue,
                items: [
                  '2-4 people group',
                  '4-6 people group',
                  '7-12 people group',
                  '12-20 people group',
                ].map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _numberOfPersonsValue = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Number of people',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select number of people';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedDaysValue,
                items:
                    List.generate(10, (index) => '${index + 1} Day').map((day) {
                  return DropdownMenuItem<String>(
                    value: day,
                    child: Text(day),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDaysValue = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'How many days',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select number of days';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _insertData();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Please fill all required fields',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _mobileController.dispose();
    _startDateController.dispose();
    super.dispose();
  }
}
