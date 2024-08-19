// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, deprecated_member_use

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tourism_app/agentbook.dart';
import 'package:tourism_app/agentdetail.dart';
import 'package:http/http.dart' as http;

class agentpro extends StatefulWidget {
  const agentpro({super.key});

  @override
  State<agentpro> createState() => _agentproState();
}

List star = [
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
];
List rate = [
  '4.5',
  '4.3',
  '4.2',
  '4.6',
  '4.0',
];
List Text2 = [
  '15+ Tour ',
  '11+ Tour ',
  '9+ Tour ',
  '5+ Tour ',
  '12+ Tour ',
];

class _agentproState extends State<agentpro> {
  List data = [];
  bool _isLoading = true;

  Future insertData() async {
    var res = await http.post(
      Uri.parse("https://apptocoder.com/CsHamza/agentbook.php"),
    );

    var response = jsonDecode(res.body);
    setState(() {
      data.addAll(response);
      _isLoading = false;
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
        backgroundColor: Colors.blue,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Agents profile',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Best Agent for Tours',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 680,
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      bottom: 80,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 150,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                width: 130,
                                height: 130,
                                child: Image.network(
                                  data[index]['img'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 25),
                                  child: Text(
                                    data[index]['agentname'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Agent',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(
                                        star[index],
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      data[index]['rating'],
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        Text2[index],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Hire me button pressed');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 158, 210, 85),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        agentdetail(
                                                          img2: data[index]
                                                              ['img2'],
                                                          img3: data[index]
                                                              ['img3'],
                                                          img4: data[index]
                                                              ['img4'],
                                                          name: data[index]
                                                              ['name'],
                                                          detail: data[index]
                                                              ['detail'],
                                                          overall: data[index]
                                                              ['overall'],
                                                          project: data[index]
                                                              ['project'],
                                                          img: data[index]
                                                              ['img'],
                                                        )));
                                          },
                                          child: Text(
                                            'View portfolio',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        print('Hire me button pressed');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 0, 0, 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      agentbook(
                                                        name: data[index]
                                                            ['agentname'],
                                                        overall: data[index]
                                                            ['overall'],
                                                        project: data[index]
                                                            ['project'],
                                                        img: data[index]['img'],
                                                      )));
                                        },
                                        child: Text(
                                          'Hire me',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
