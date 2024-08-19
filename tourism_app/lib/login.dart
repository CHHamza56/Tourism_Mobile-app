// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, prefer_final_fields, camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tourism_app/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_app/register.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showLoading = false;
  String? _emailError;
  String? _passwordError;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }
  void _handleLogin() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });
    if (_formKey.currentState!.validate()) {
      setState(() {
        _showLoading = true;
      });
      insertData();
    }
  }
  Future<void> insertData() async {
    var res = await http.post(
      Uri.parse("https://apptocoder.com/CsHamza/login.php"),
      body: {
        "email": _emailController.text,
        "password": _passwordController.text,
      },
    );
    var response = jsonDecode(res.body);
    if (response["Success"] != 'false') {
      AnimatedSnackBar.rectangle(
        'Login successful!',
        '',
        type: AnimatedSnackBarType.success,
        brightness: Brightness.dark,
      ).show(
        context,
      );
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homescreen()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Please check your email and password.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      setState(() {
        _showLoading = false;
      });
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
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Please sign in to continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.75, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 45, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Invalid email format';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 154, 154, 154),
                              ),
                            ),
                            errorText: _emailError,
                          ),
                          onChanged: (_) {
                            setState(() {
                              _emailError = null;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          obscureText: _isPasswordHidden,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                            errorText: _passwordError,
                          ),
                          onChanged: (_) {
                            setState(() {
                              _passwordError = null;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _handleLogin,
                          child: _showLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                              : Text(
                                  'Login',
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
                            // Navigate to sign up screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => register(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Image.asset(
                          "assets/images/login.png",
                          height: 190,
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
}
