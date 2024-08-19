// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, prefer_const_constructors_in_immutables, camel_case_types, non_constant_identifier_names, depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_app/citydetail.dart';

class cityinfo extends StatefulWidget {
  final String cityname;
  final String cityId;

  cityinfo({
    super.key,
    required this.cityId,
    required this.cityname,
  });

  @override
  State<cityinfo> createState() => _cityinfoState();
}

class _cityinfoState extends State<cityinfo> {
  List<dynamic> data = [];
  List<dynamic> Cul = [];
  List<dynamic> his = [];
  List<dynamic> others = [];
  List<dynamic> recreational = [];
  List<dynamic> religious = [];

  bool culVisible = false;
  bool hisVisible = false;
  bool othersVisible = false;
  bool recreationalVisible = false;
  bool religiousVisible = false;

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchCul();
    fetchHis();
    fetchOthers();
    fetchRecreational();
    fetchReligious();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/cities.php"),
        body: {"proid": "1"},
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

  Future<void> fetchCul() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/getCultural.php"),
        body: {
          "proid": widget.cityId,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          Cul = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load cultural data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchHis() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/his.php"),
        body: {
          "proid": widget.cityId,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          his = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load historical data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchOthers() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/getother.php"),
        body: {
          "proid": widget.cityId,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          others = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load others data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchRecreational() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/getrecreational.php"),
        body: {
          "proid": widget.cityId,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          recreational = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load recreational data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchReligious() async {
    try {
      final response = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/getReligious.php"),
        body: {
          "proid": widget.cityId,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          religious = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load religious data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.black12,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Destinations',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    ),
                  ],
                ),
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cityname,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      buildCategorySection('Cultural tourism',
                          'assets/images/2p.png', Cul, culVisible, () {
                        setState(() {
                          culVisible = !culVisible;
                        });
                      }),
                      buildCategorySection(
                          'Historical tourism',
                          'assets/images/historic-site.png',
                          his,
                          hisVisible, () {
                        setState(() {
                          hisVisible = !hisVisible;
                        });
                      }),
                      buildCategorySection(
                          'Others',
                          'assets/images/otherss.png',
                          others,
                          othersVisible, () {
                        setState(() {
                          othersVisible = !othersVisible;
                        });
                      }),
                      buildCategorySection(
                          'Recreational tourism',
                          'assets/images/natural-park.png',
                          recreational,
                          recreationalVisible, () {
                        setState(() {
                          recreationalVisible = !recreationalVisible;
                        });
                      }),
                      buildCategorySection(
                          'Religious tourism',
                          'assets/images/mosque.png',
                          religious,
                          religiousVisible, () {
                        setState(() {
                          religiousVisible = !religiousVisible;
                        });
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategorySection(String title, String iconPath,
      List<dynamic> items, bool isVisible, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                iconPath,
                width: 25,
              ),
              SizedBox(width: 10),
              Text(
                title,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          isVisible
              ? Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Container(
                    height: 40,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: items.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => citydetail(
                                  Name: items[index]['Name'],
                                  img: items[index]['img'],
                                  img2: items[index]['img2'],
                                  img3: items[index]['img3'],
                                  Histroy: items[index]['Histroy'],
                                  district: items[index]['district'],
                                  division: items[index]['division'],
                                  Histrocial: items[index]['histrocial'],
                                  URL: items[index]['URL'],
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text(items[index]['Name']),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
