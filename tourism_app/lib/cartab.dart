// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, library_private_types_in_public_api, camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class cartab extends StatefulWidget {
  const cartab({Key? key}) : super(key: key);

  @override
  _cartabState createState() => _cartabState();
}

class _cartabState extends State<cartab> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/hotelhistroy.php"),
        body: {"uid": "1"},
      );

      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Booking History',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 580,
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 140,
                      child: Row(
                        children: [
                          Image.network(
                            data[index]['img'],
                            width: 140,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index]['carname'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.calendar_today, size: 14),
                                    SizedBox(width: 4),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Start Date",
                                            style: TextStyle(fontSize: 12)),
                                        Text(data[index]['startdate']),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.calendar_today, size: 14),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("End Date",
                                            style: TextStyle(fontSize: 12)),
                                        Text(data[index]['enddate']),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Car: book',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
