// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements, prefer_final_fields, camel_case_types

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
  TextEditingController _ratingController = TextEditingController();

  void _showFeedbackDialog(String userRating) {
    double rating = double.tryParse(userRating) ?? 0;

    if (rating > 0 && rating <= 5) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'Feedback!',
        desc: 'Thanks for your feedback!: $rating',
        btnOkText: 'OK',
        btnOkColor: Colors.green,
        btnOkOnPress: () {},
      )..show();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Give me feedback'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'App Feedback',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ratee.png"),
              SizedBox(height: 30),
              Text(
                'Give me feedback!',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _ratingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showFeedbackDialog(_ratingController.text.trim());
                },
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ratingController.dispose();
    super.dispose();
  }
}
