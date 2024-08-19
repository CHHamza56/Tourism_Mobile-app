// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_print, sized_box_for_whitespace

import 'dart:convert';

import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/hoteldetial.dart';
import 'package:http/http.dart' as http;

class hotelbook extends StatefulWidget {
  const hotelbook({super.key});

  @override
  State<hotelbook> createState() => _hotelbookState();
}

List names = [
  'The Nishat Hotel Johar Town',
  'Mövenpick Hotel Karachi',
  'Pearl hotel Lahore',
  'Pearl Hotel Karachi',
  'Islamabad Serena Hotel',
  'Hotel One Tariq Road Multan',
  'Pearl Hotel Rawalpindi',
  'Peshawar serena hotel',
  "Zaver Pearl Hotel Gwadar",
  'Four Points by Lahore',
];
List imageshotel = [
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/75/8a/6c/the-nishat-hotel-johar.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/24/50/a9/4c/movenpick-hotel-karachi.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/55/65/41/pearl-continental-lahore.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/24/50/a9/4c/movenpick-hotel-karachi.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/2a/66/59/aa-islamabad-serena-hotel.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/d0/09/4b/hotel-one-multan.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/38/5a/46/pearl-continental-hotel.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/92/2c/0e/exterior.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/a1/05/2c/zaver-pearl-continental.jpg?w=500&h=500&s=1",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/52/e4/9f/hotel-exterior.jpg?w=500&h=500&s=1",
];
List location = [
  'Abdul Haque Emporium',
  'Club Rd, Karachi pakistan',
  'Shahrah-e-Quaid-e-Azam',
  'Club Rd, Karachi Pakistan',
  'Khayaban-e-Suhrwardy',
  '59-B Tariq Road, Multan',
  'Aziz Bhatti Rawalpindi',
  'Khyber Road Peshawar Club',
  'Koh E Batil Hotel,Gwadar',
  '25 Egerton Road, Lahore',
];
List star = [
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
  Icons.star,
];
List rate = [
  '4.5',
  '4.6',
  '4.8',
  '4.2',
  '4.9',
  '5.0',
  '4.0',
  '4.2',
  '4.8',
  '4.5',
];
bool isSearching = false;

class _hotelbookState extends State<hotelbook> {
  List data = [];
  Future insertData() async {
    var res = await http.post(
      Uri.parse("https://apptocoder.com/CsHamza/gethotel.php"),
    );
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
      appBar: AppBarWithSearchSwitch(
        backgroundColor:
            isSearching ? Color.fromARGB(255, 70, 131, 189) : Colors.blue,
        keepAppBarColors: true,

        // onSubmitted: (text) => searchText.value = text,
        appBarBuilder: (context) {
          return AppBar(
            title: Text('Hotel booking '),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 1,
              color: Color.fromARGB(255, 236, 236, 236),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    'Popular hotels in Pakistan',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Image.network(
                    "https://image.similarpng.com/very-thumbnail/2020/06/Pakistan-flag-icon-on-transparent-background-PNG.png",
                    width: 30,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 590,
                child: data.isEmpty // Check if data is empty
                    ? Center(
                        child:
                            CircularProgressIndicator(), // Display circular progress indicator
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 5, right: 5),
                          child: Container(
                            padding: EdgeInsets.all(10),
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
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 165,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      data[index]['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['name'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                    Row(
                                      children: [
                                        Image.network(
                                          "https://cdn0.iconfinder.com/data/icons/transport-travel-2/167/transport-travel-transportation_260-512.png",
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          data[index]['text'],
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/room.png",
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          data[index]['price'],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        print('Hire me button pressed');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 210, 156, 85),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => hoteldetial(
                                                img2: data[index]['img2'],
                                                img3: data[index]['img3'],
                                                img4: data[index]['img4'],
                                                img5: data[index]['img5'],
                                                img6: data[index]['img6'],
                                                text2: data[index]['text2'],
                                                text3: data[index]['text3'],
                                                text4: data[index]['text4'],
                                                rating: data[index]['rating'],
                                                pr: data[index]['pr'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'View details',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
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
