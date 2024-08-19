// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class citydetail extends StatefulWidget {
  final String img;
  final String img2;
  final String img3;
  final String Histroy;
  final String division;
  final String district;
  final String Name;
  final String Histrocial;
  final String URL;

  const citydetail({
    Key? key,
    required this.img,
    required this.Histroy,
    required this.district,
    required this.img2,
    required this.division,
    required this.img3,
    required this.Name,
    required this.Histrocial,
    required this.URL,
  }) : super(key: key);

  @override
  State<citydetail> createState() => _citydetailState();
}

class _citydetailState extends State<citydetail> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  late final List<String> _imageUrls;

  @override
  void initState() {
    super.initState();
    // Initialize _imageUrls with the passed image URLs
    _imageUrls = [
      widget.img,
      widget.img2,
      widget.img3,
    ];
    // Start automatic slide
    _startAutomaticSlide();
  }

  @override
  void dispose() {
    // Dispose of the page controller to prevent memory leaks
    _pageController.dispose();
    super.dispose();
  }

  void _startAutomaticSlide() {
    // Set up automatic slide every 3 seconds
    Future.delayed(Duration(seconds: 3)).then((_) {
      if (_currentPage < _imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
      // Call this method again for continuous automatic sliding
      _startAutomaticSlide();
    });
  }

  void _launchMaps(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: Row(
          // Wrap the title in a Row widget
          children: [
            Expanded(
              // Use Expanded to push the title to the right
              child: Container(
                alignment: Alignment
                    .centerLeft, // Align text to the left within the container
                child: Text(
                  widget.Name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.grey,
                ),
                width: MediaQuery.of(context).size.width,
                height: 170,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _imageUrls.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRect(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.network(
                          _imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green),
                    width: 80,
                    height: 45,
                    child: Center(
                        child: Text(
                      'Description',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    'Histroy',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(widget.Histroy),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    'Direction',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Replace with the desired latitude and longitude
                      String googleMapsUrl = widget.URL;
                      _launchMaps(googleMapsUrl);
                    },
                    child: Icon(
                      Icons.directions,
                      color: Colors.red,
                      size: 46,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'About',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text('Division:'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(widget.division),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text('District:'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(widget.district)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    'Historical & touristic importance',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(widget.Histrocial),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _imageUrls.length; i++) {
      indicators.add(
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
