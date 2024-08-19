// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tourism_app/cityinfo.dart';
import 'package:http/http.dart' as http;

class balosh extends StatefulWidget {
  String id;
  balosh({super.key, required this.id});

  @override
  State<balosh> createState() => _baloshState();
}

List design = [
  Color.fromARGB(255, 198, 223, 154),
  Color.fromARGB(255, 198, 223, 154),
  Color.fromARGB(255, 198, 223, 154),
  Color.fromARGB(255, 233, 232, 192),
  Color.fromARGB(255, 233, 232, 192),
  Color.fromARGB(255, 233, 232, 192),
  Color.fromARGB(255, 241, 201, 229),
  Color.fromARGB(255, 241, 201, 229),
  Color.fromARGB(255, 241, 201, 229),
  Color.fromARGB(255, 204, 241, 247),
  Color.fromARGB(255, 204, 241, 247),
  Color.fromARGB(255, 204, 241, 247),
];

class _baloshState extends State<balosh> {
  List data = [];
  Future insertData() async {
    var res = await http.post(
        Uri.parse("https://apptocoder.com/CsHamza/getprovince.php"),
        body: {"id": widget.id});

    var response = jsonDecode(res.body);
    setState(() {
      data.addAll(response);
    });
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    insertData();
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
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 70),
                    child: Center(
                        child: Text(
                      'Select favourite city',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          color: Colors.black12),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            Text(
                              'destinations',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -45,
                    left: 30,
                    right: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 254, 254),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 214, 209, 209)
                                .withOpacity(0.5),
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: MediaQuery.of(context).size.width - 30,
                      height: 65,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 18, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/historic-site.png",
                                  width: 25,
                                ),
                                Text(
                                  'Historical',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/2p.png",
                                  width: 25,
                                ),
                                Text(
                                  'Cultural',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/mosque.png",
                                  width: 25,
                                  height: 25,
                                ),
                                Text(
                                  'Religious',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/natural-park.png",
                                  width: 25,
                                ),
                                Text(
                                  'Recreational',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/otherss.png",
                                    width: 25,
                                  ),
                                  Text(
                                    'Others',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Popular Citys',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.black26,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 460,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 10,
                  ),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 5,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      data.length,
                      (index) => Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => cityinfo(
                                          cityname: data[index]['cityname'],
                                          cityId: data[index]['id'])));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: design[index],
                              ),
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.network(
                                data[index]['img'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: Center(
                                child: Text(
                                  data[index]['cityname'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
