// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:tourism_app/homescreen.dart';
import 'package:tourism_app/register.dart';

class Design extends StatefulWidget {
  const Design({Key? key}) : super(key: key);

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for sliding images
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              Image.asset(
                "assets/images/summer.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/images/snow.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/images/forest.jpg",
                fit: BoxFit.cover,
              ),
            ],
          ),

          Positioned(
            top: 150,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text(
                    'Travel Pakistan',
                    style: TextStyle(
                      color: Color.fromARGB(255, 201, 186, 46),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Let\'s Explore\nThe Beauty of \nPakistan',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 219, 217, 217),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome to the Heaven on Earth',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 219, 217, 217),
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Indicator dots
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(3, (int index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 10,
                  width: (index == _currentPage) ? 30 : 10,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (index == _currentPage)
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
