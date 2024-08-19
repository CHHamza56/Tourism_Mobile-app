// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:tourism_app/homescreen.dart';
import 'package:tourism_app/login.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  bool _showLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _showLoading = true;
      });

      await insertData();

      setState(() {
        _showLoading = false;
      });

      AnimatedSnackBar.rectangle(
        'Registration successful!',
        '',
        type: AnimatedSnackBarType.success,
        brightness: Brightness.dark,
      ).show(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => homescreen()),
      );
    }
  }

  Future<void> insertData() async {
    var res = await http.post(
      Uri.parse("https://apptocoder.com/CsHamza/register.php"),
      body: {
        "user_name": _fullNameController.text,
        "user_email": _emailController.text,
        "user_phno": _mobileController.text,
        "pass": _passwordController.text,
      },
    );
    var response = jsonDecode(res.body);
    print(response.toString());
    if (response["Success"] != 'false') {
      print("success");
    } else {
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              const Color.fromARGB(255, 60, 111, 170),
              Colors.blue.shade400,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 60),
                  child: Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Registration here!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildTextField(
                          controller: _fullNameController,
                          labelText: 'Full Name',
                          prefixIcon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        _buildTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          prefixIcon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Invalid email format';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        _buildTextField(
                          controller: _passwordController,
                          labelText: 'Password',
                          prefixIcon: Icons.lock,
                          obscureText: _isPasswordHidden,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            if (!value.contains(RegExp(r'[A-Z]'))) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            if (!value.contains(RegExp(r'[a-z]'))) {
                              return 'Password must contain at least one lowercase letter';
                            }
                            if (!value.contains(RegExp(r'[0-9]'))) {
                              return 'Password must contain at least one digit';
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordHidden = !_isPasswordHidden;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildTextField(
                          controller: _mobileController,
                          labelText: 'Mobile Number',
                          prefixIcon: Icons.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            if (!value.startsWith('+92')) {
                              return 'Mobile number must start with +92';
                            }
                            if (value.length != 13) {
                              return 'Mobile number must be 13 characters including +92';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: _showLoading ? null : _handleSignUp,
                          child: _showLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                              : Text(
                                  'Sign up',
                                  style: TextStyle(color: Colors.white),
                                ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 120,
                            ),
                            backgroundColor: Colors.blue.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    String? Function(String?)? validator,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
