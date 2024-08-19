// ignore_for_file: unused_field, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_import, deprecated_member_use, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_app/homescreen.dart';
import 'package:tourism_app/hotelform.dart';

class hoteldetial extends StatefulWidget {
  final String img2;
  final String img3;
  final String img4;
  final String img5;
  final String img6;
  final String text2;
  final String text3;
  final String text4;
  final String rating;
  final String pr;

  hoteldetial({
    Key? key,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.img5,
    required this.img6,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.rating,
    required this.pr,
  }) : super(key: key);

  @override
  State<hoteldetial> createState() => _hoteldetialState();
}

class _hoteldetialState extends State<hoteldetial> {
  List data = [];
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
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
                      Image.network(
                        widget.img5,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.img6,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      width: 30,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: Color.fromARGB(255, 55, 128, 236),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 315,
                  child: GestureDetector(
                    onTap: _toggleFavorite,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      width: 30,
                      height: 30,
                      child: Icon(
                        _isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorited ? Colors.blue : Colors.blue,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text3,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 241, 140, 8),
                    size: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(widget.rating),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Row(
                children: [
                  Text(
                    widget.text4,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                'Facilities',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Icon(Icons.wifi),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Wifi'),
                SizedBox(
                  width: 55,
                ),
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/75/75905.png",
                  width: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Parking'),
                SizedBox(
                  width: 55,
                ),
                Icon(Icons.pool),
                SizedBox(
                  width: 5,
                ),
                Text('pool'),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Image.network(
                    "https://cdn-icons-png.freepik.com/512/3958/3958368.png",
                    width: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Air'),
                SizedBox(
                  width: 55,
                ),
                Image.network(
                  "https://t4.ftcdn.net/jpg/01/43/95/23/360_F_143952392_HTADVZOUtwllMnVi4U0PyvyHZ6LgzOk7.jpg",
                  width: 35,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Gym'),
                SizedBox(
                  width: 75,
                ),
                Image.network(
                  "https://t3.ftcdn.net/jpg/02/31/41/62/360_F_231416273_yyTCwPSH776IzGi1vEhPnRza8z0nxn4m.webp",
                  width: 28,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Eating'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'About Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(widget.text2),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.pr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'per day',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Hire me button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 27, 176, 218),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => hotelform(
                                      name: widget.text3,
                                      img: widget.img2,
                                    )));
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
