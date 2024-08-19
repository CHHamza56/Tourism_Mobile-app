// ignore_for_file: prefer_final_fields, prefer_typing_uninitialized_variables, prefer_const_constructors, camel_case_types, library_private_types_in_public_api, use_build_context_synchronously, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_app/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homescreen(),
    );
  }
}

class hotelform extends StatefulWidget {
  final String name;
  final String img;
  const hotelform({
    Key? key,
    required this.name,
    required this.img,
  }) : super(key: key);

  @override
  _hotelformState createState() => _hotelformState();
}

class _hotelformState extends State<hotelform> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _arrivalDateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _numberOfDaysController = TextEditingController();

  String _selectedRoomType = 'Standard';
  String _selectedFacility = 'WiFi';
  int _numberOfGuests = 1;

  List<String> _roomTypes = ['Single', 'Standard', 'Deluxe', 'Suite'];

  var selectedTimeUnit;
  var timeUnits;

  Future<void> _selectArrivalDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _arrivalDateController.text = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      var res = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/hotelform.php"),
        body: {
          "firstname": _firstNameController.text,
          "lastname": _lastNameController.text,
          "Arrival": _arrivalDateController.text,
          "roomtype": _selectedRoomType,
          "facility": _selectedFacility,
          "Email": _emailController.text,
          "number": _phoneController.text,
          "guest": _numberOfGuests.toString(),
          "userid": "1",
          "hotelname": widget.name,
          "img": widget.img,
          "numberday": _numberOfDaysController
              .text, // Include number of days in the request
        },
      );

      var response = jsonDecode(res.body);
      if (response["Success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Form submitted successfully!',
              style: TextStyle(fontSize: 16),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 38, 123, 193),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 14, 204, 222)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                InkWell(
                  onTap: () => _selectArrivalDate(context),
                  child: IgnorePointer(
                    child: TextFormField(
                      controller: _arrivalDateController,
                      decoration: InputDecoration(
                          labelText: 'Arrival Date (MM/DD/YYYY)'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select arrival date';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _selectedRoomType,
                  items: _roomTypes.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRoomType = newValue!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Room Type'),
                ),
                SizedBox(height: 12),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _numberOfDaysController,
                        decoration:
                            InputDecoration(labelText: 'Number of Days'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter number of days';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    // DropdownButton<String>(
                    //   value: selectedTimeUnit,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       selectedTimeUnit = newValue!;
                    //     });
                    //   },
                    //   items: timeUnits.map((unit) {
                    //     return DropdownMenuItem<String>(
                    //       value: unit,
                    //       child: Text(unit),
                    //     );
                    //   }).toList(),
                    // ),
                  ],
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add email format validation if needed
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    // Add phone number format validation if needed
                    return null;
                  },
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Number of Guests:'),
                    DropdownButton<int>(
                      value: _numberOfGuests,
                      onChanged: (newValue) {
                        setState(() {
                          _numberOfGuests = newValue!;
                        });
                      },
                      items: [1, 2, 3, 4, 5].map((guests) {
                        return DropdownMenuItem<int>(
                          value: guests,
                          child: Text(guests.toString()),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _arrivalDateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _numberOfDaysController.dispose();
    super.dispose();
  }
}
