import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                "assets/images/Explore.png", // Add your logo image asset
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to TravelTrax',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'ExploreEase is our innovative tourism app designed to enhance your travel experience across all four provinces of Pakistan. At TravelTrax, we offer a comprehensive range of services including car travel, hotel bookings, and detailed guides to the most captivating places to visit. Our mission is to provide seamless and enjoyable travel experiences for our customers.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Our Offices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We have dedicated offices in each of the four provinces to ensure you receive the best service and support during your travels. Whether you are exploring the mountains of the north or the cultural heritage of the south, TravelTrax is here to assist you every step of the way.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Services We Provide',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '• Car Travel\n'
              '• Hotel Booking\n'
              '• Tourist Destination Guides\n'
              '• Personalized Travel Plans\n'
              '• 24/7 Customer Support\n'
              '• Expert Travel Agents\n',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Our Commitment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'At TravelTrax, we are committed to making your travel safe, convenient, and memorable. We value your trust and strive to exceed your expectations with every journey.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
