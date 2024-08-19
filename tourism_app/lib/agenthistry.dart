// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class agenthistry extends StatefulWidget {
  const agenthistry({super.key});
  @override
  State<agenthistry> createState() => _agenthistryState();
}

class _agenthistryState extends State<agenthistry> {
  List data = [];
  Future fetchData() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/getagenthistroy.php"),
      );

      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
        });
        print(data);
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
                'Agent book',
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
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            width: 120,
                            height: 150,
                            child: Image.network(
                              data[index]['img'],
                              fit: BoxFit.cover,
                              width: 140,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    data[index]['agentname'],
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
                                        Text("language",
                                            style: TextStyle(fontSize: 12)),
                                        Text(data[index]['language']),
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
                                        Text("Tourdate",
                                            style: TextStyle(fontSize: 12)),
                                        Text(data[index]['date']),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text("project", style: TextStyle(fontSize: 12)),
                                Text(data[index]['project']),
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
