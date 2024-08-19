import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class viva extends StatefulWidget {
  const viva({super.key});
  @override
  State<viva> createState() => _vivaState();
}
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
class _vivaState extends State<viva> {
  Future insertData() async {
    var res = await http.post(Uri.parse("https/apptocoder"), body: {
      "Email": _emailController.text,
      "password": _passwordController,
    });
    var response = jsonDecode(res.body);
    if (response['success'] != false) {
      print("success");
      {}
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
