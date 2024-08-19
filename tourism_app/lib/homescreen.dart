// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, use_key_in_widget_constructors, camel_case_types, deprecated_member_use, avoid_single_cascade_in_expression_statements, unused_element, unused_import, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tourism_app/Tour.dart';
import 'package:tourism_app/about.dart';
import 'package:tourism_app/agentbook.dart';
import 'package:tourism_app/agentdetail.dart';
import 'package:tourism_app/agentpro.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:tourism_app/balosh.dart';
import 'package:tourism_app/bookinghistroy.dart';
import 'package:tourism_app/citydetail.dart';
import 'package:tourism_app/contact.dart';
import 'package:tourism_app/hotelbook.dart';
import 'package:tourism_app/login.dart';
import 'package:tourism_app/packages.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tourism_app/profile.dart';
import 'package:tourism_app/tourbooking.dart';
import 'package:tourism_app/viva.dart';
import 'package:url_launcher/url_launcher.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final List<String> imagesilde = [
    "assets/images/beach.jpg",
    "assets/images/23.jpeg",
    "assets/images/mos.jpeg",
    "assets/images/family.jpeg",
    "assets/images/different.png",
  ];
  List text1 = [
    'Tour packages',
    'Car Rental',
    'Hotel booking',
    'Agent service',
  ];
  List images = [
    "assets/images/pun.jpg",
    "assets/images/baloc.jpg",
    "assets/images/kpk.jpg",
    "assets/images/gilgit.jpg",
    "assets/images/sindh.jpg",
    "assets/images/about.jpg",
  ];
  List Text2 = [
    'Punjab',
    'Balochistan',
    'KPK',
    'Gilgit-Baltistan',
    'Sindh',
    'About Pakistan',
  ];
  List image2 = [
    "assets/images/kalash.jpg",
    "assets/images/swat.jpg",
    "assets/images/Murree.jpg",
    "assets/images/shingapor.jpg",
    "assets/images/5.jpg",
    "assets/images/girls.jpg",
  ];
  List Text3 = [
    'AUTUMN TOUR TO SKARDU, DEOSAI PLAINS & KHAPLU',
    'PUBLIC TRIP TO SWAT, KALAM & MAHODAND LAKE',
    '2 DAYS TRIP TO MURREE, PATRIATA & GALYAT',
    '3 DAYS TREKKING TRIP TO SPINKHOR LAKE KALAM',
    'Fairy Meadows National Park Tour',
    '4 DAYS TRIP TO KALASH & CHITRAL VALLEY',
  ];
  List text4 = [
    '8 Days (7 Nights)',
    '4 Days (3 Nights)',
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
  int selectedIndex = 0;
  int _selectedIndex = 0;
  int a = -1;

  final List<Widget> _pages = [
    packages(),
    Tour(),
    hotelbook(),
    agentpro(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      reverse: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      aspectRatio: MediaQuery.of(context).size.width / 200,
                      viewportFraction: 1.0,
                    ),
                    items: imagesilde.map((imagesilde) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              image: DecorationImage(
                                image: AssetImage(imagesilde),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    color: Color.fromARGB(76, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.filter_list,
                                  color: Color.fromARGB(255, 226, 233, 224)),
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                            Row(
                              children: [
                                Text(
                                  "Explore",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Ease",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 150, 219, 11),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/flag.png",
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 105, left: 10),
                        child: Opacity(
                          opacity: 0.8,
                          child: Text(
                            ' "Discover the wonders of ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 135, left: 20),
                        child: Opacity(
                          opacity: 0.8,
                          child: Text(
                            ' Pakistan with our ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 254),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 158, left: 20),
                        child: Opacity(
                          opacity: 0.8,
                          child: Text(
                            ' TravelTrax". ',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Our ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  'service',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 70,
                child: ListView.builder(
                  itemCount: text1.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => index == 0
                                    ? packages()
                                    : index == 1
                                        ? Tour()
                                        : index == 2
                                            ? hotelbook()
                                            : agentpro()));
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: selectedIndex == index
                              ? Color.fromARGB(255, 20, 134, 134)
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        width: 120,
                        height: 45,
                        child: Center(
                          child: Text(
                            text1[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Color.fromARGB(255, 20, 134, 134),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Province of pakistan',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Container(
                height: 570,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 5,
                  children: List.generate(
                    6,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    balosh(id: (index + 1).toString())));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  images[index],
                                )),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 130,
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.only(top: 120),
                            color: const Color.fromARGB(88, 0, 0, 0),
                            child: Center(
                                child: Text(
                              Text2[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Upcoming Tours',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                height: 240,
                child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 227, 221, 221),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                          )
                        ]),
                    width: 195,
                    height: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.black),
                          width: 195,
                          height: 120,
                          child: Image.asset(
                            image2[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 10),
                              child: Text(
                                Text3[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Color.fromARGB(255, 63, 133, 176),
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
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    price[index],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 65, 134, 190),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 85,
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Book Now',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: Size(100, 30),
                                      ),
                                    ),
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
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 86, 129, 195),
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                  ),
                  Text(
                    'Hamza BSCS-E2-05',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'chhamza56@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => profile()));
                  },
                  child: Text('My profile')),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('contact us'),
              onTap: () {
                _showCustomDialog(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => bookingHistory()));
                  },
                  child: Text('Booking History')),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => contact()));
                  },
                  child: Text('Feedback')),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => about()));
                  },
                  child: Text('About')),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color.fromARGB(255, 20, 134, 134),
        buttonBackgroundColor: Colors.white,
        height: 60,
        index: _selectedIndex,
        items: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Tour()));
            },
            child: Icon(Icons.card_travel,
                size: 30,
                color: _selectedIndex == 0
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : Colors.white),
          ),
          Icon(Icons.tour,
              size: 30,
              color: _selectedIndex == 1 ? Colors.black : Colors.white),
          Icon(Icons.hotel,
              size: 30,
              color: _selectedIndex == 2 ? Colors.black : Colors.white),
          Icon(Icons.person,
              size: 30,
              color: _selectedIndex == 3 ? Colors.black : Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

void showLogoutConfirmationDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    title: 'Confirm Logout',
    desc: 'Are you sure you want to logout?',
    btnCancelText: 'Cancel',
    btnOkText: 'Logout',
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      // Perform logout action
      handleLogout(context);
    },
  )..show();
}

void handleLogout(BuildContext context) {
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
}

void _showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 420,
          width: 380,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      width: 25,
                      height: 25,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                color: const Color.fromARGB(255, 201, 199, 199),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Image.asset(
                  "assets/images/us.png",
                  width: 120,
                ),
              ),
              Text(
                '68 Trade Block, Near Ayub chowk, Johar',
                style: TextStyle(fontSize: 13.0),
              ),
              Center(
                child: Text(
                  'Town, sahiwal',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    const url = "tel:03206915184";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    'Phone No:03206915184',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    const url = "mailto:TravelTrax@example.pk";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    'Email: TravelTrax@example.pk',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'TIMING',
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'Monday- Friday',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  '8:00 AM to 4:00 PM',
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
