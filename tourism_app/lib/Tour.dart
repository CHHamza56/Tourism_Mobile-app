// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tourism_app/detailpage.dart';

import 'package:http/http.dart' as http;

class Tour extends StatefulWidget {
  const Tour({Key? key}) : super(key: key);

  @override
  State<Tour> createState() => _TourState();
}

List imagescar = [
  "assets/images/Honda.png",
  "assets/images/prado2.png",
  "assets/images/corola.png",
  "assets/images/land-cruser.jpg",
  "assets/images/cultus.png",
  "assets/images/coster.png",
  "assets/images/van.png",
];
List carnames = [
  'Honda BRV',
  'Toyota Prado',
  'Toyota Corolla',
  'Land Cruiser',
  'Suzuki Cultus',
  'Coaster 21 + 6 Seater',
  'Toyota Hiace Grand Cabin',
];
List star = [
  Icons.person,
  Icons.person,
  Icons.person,
  Icons.person,
  Icons.person,
  Icons.person,
  Icons.person,
];
List textseat = [
  '6 seats',
  '6 seats',
  '5 seats',
  '6 seats',
  '4 seats',
  '(20)seats',
  '(8-9)seats',
];
List textfuel = [
  '45MPG',
  '70MPG',
  '50MPG',
  '90MPG',
  '30MPG',
  '100MPG',
  '110MPG',
];
List price = [
  'RS 5500 – 6500',
  'RS 12000 – 15000',
  'RS 4500 – 5000',
  'RS 25000',
  'RS 3500',
  'RS 11500',
  'RS 7500',
];

class _TourState extends State<Tour> {
  List data = [];
  Future insertData() async {
    var res = await http.post(
      Uri.parse("https://apptocoder.com/CsHamza/getservice.php"),
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
        backgroundColor: Color.fromARGB(255, 41, 141, 223),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 14, 204, 222)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 17,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Text(
            'Car Booking',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Text(
                    'Car hire for any kind of trip',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: data.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data[index]['img'],
                                  width: 160,
                                  height: 160,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index]['text'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            star[index],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            textseat[index],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 2,
                                            color: const Color.fromARGB(
                                                255, 235, 231, 231),
                                          ),
                                          Image.asset(
                                            "assets/images/fuel.png",
                                            width: 16,
                                          ),
                                          Text(
                                            textfuel[index],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        price[index],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              print('Hire me button pressed');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 33, 33, 34),
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
                                                            detailPage(
                                                                name: data[
                                                                        index]
                                                                    ['text'],
                                                                img: data[index]
                                                                    ['img'],
                                                                price: price[
                                                                    index])));
                                              },
                                              child: Text(
                                                'Book Now',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 60,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
