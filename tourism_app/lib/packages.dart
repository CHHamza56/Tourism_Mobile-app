// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, camel_case_types, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_app/tourbooking.dart';

class packages extends StatefulWidget {
  const packages({super.key});

  @override
  State<packages> createState() => _packagesState();
}

List text4 = [
  '8 Days (7 Nights)',
  '4 Days (3 Nights',
  '2 Days (1 Night)',
  '3 Days (2 Nights)',
  '5 Days (4 Nights)',
  '3 Days (2 Night)',
];
List price = [
  'Rs 24,500',
  'Rs 12,500',
  'Rs 85,00',
  'Rs 17,000',
  'Rs 18,000',
  'Rs 14,500',
];

class _packagesState extends State<packages> {
  List data = [];
  Future insertData() async {
    var res = await http.post(
      Uri.parse("https://shellier-swivel.000webhostapp.com/getpackage.php"),
    );

    var response = jsonDecode(res.body);
    setState(() {
      data.addAll(response);
    });
    print(data);
  }

  @override
  void initState() {
    super.initState();
    insertData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 14, 204, 222)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.white,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Text(
            'Tour package',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Row(
                children: [
                  Text(
                    'Select packages',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: data.isNotEmpty
                  ? Container(
                      height: 588,
                      child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          crossAxisSpacing: 0.5,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 8,
                          children: List.generate(
                            data.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => tourbooking(
                                                price: data[index]['price'],
                                                img: data[index]['img'],
                                                name: data[index]['text'],
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 232, 228, 228),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                        )
                                      ]),
                                  width: 220,
                                  height: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration:
                                            BoxDecoration(color: Colors.black),
                                        width: 200,
                                        height: 120,
                                        child: Image.network(
                                          data[index]['img'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, left: 10),
                                            child: Text(
                                              data[index]['text'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Icon(
                                                  Icons.access_time,
                                                  color: Color.fromARGB(
                                                      255, 63, 133, 176),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                text4[index],
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 107, 104, 104)),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  price[index],
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 65, 134, 190),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                    )
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
