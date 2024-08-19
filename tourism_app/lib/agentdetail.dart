// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, unused_element, deprecated_member_use, avoid_print, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tourism_app/agentbook.dart';

class agentdetail extends StatefulWidget {
  final String img2;
  final String img3;
  final String img4;
  final String name;
  final String detail;
  final String overall;
  final String project;
  final String img;

  const agentdetail({
    Key? key,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.name,
    required this.detail,
    required this.overall,
    required this.project,
    required this.img,
  }) : super(key: key);

  @override
  State<agentdetail> createState() => _agentdetailState();
}

final PageController _pageController = PageController(initialPage: 0);
List data = [];
int _currentPage = 0;

class _agentdetailState extends State<agentdetail> {
  // Function to launch WhatsApp
  void launchWhatsApp({required String phone, required String message}) async {
    final url = "https://wa.me/$phone?text=${Uri.encodeFull(message)}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      Image.network(
                        widget.img2,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.img3,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.img4,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 55, 128, 236),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                widget.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Best Agent',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.overall,
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Overall Ratings',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Container(
                    height: 40,
                    width: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      Icon(Icons.shopping_bag),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            'Total projects',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'About Tyler',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                widget.detail,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Languages Spoken',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'English,اردو,chines,Arabic,korean',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      launchWhatsApp(
                        phone:
                            '+923153940682', // Replace with the actual phone number
                        message: 'Hello, I would like to contact you.',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 158, 210, 85),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    ),
                    child: Text(
                      'Contact Us',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => agentbook(
                          name: widget.name,
                          overall: widget.overall,
                          project: widget.project,
                          img: widget.img,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  ),
                  child: Text(
                    'Hire Me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
