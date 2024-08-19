import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class packagetab extends StatefulWidget {
  const packagetab({super.key});

  @override
  State<packagetab> createState() => _packagetabState();
}

class _packagetabState extends State<packagetab> {
  List<dynamic> data = [];
  Future<void> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/getpackagehistroy.php"),
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
                'Package History',
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
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    data[index]['name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 4),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("No people",
                                            style: TextStyle(fontSize: 12)),
                                        Text(data[index]['numberpeople']),
                                      ],
                                    ),
                                    SizedBox(width: 15),
                                    Icon(Icons.calendar_today, size: 12),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("startdate",
                                            style: TextStyle(fontSize: 12)),
                                        Text(data[index]['startdate']),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Status: booking',
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
