import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tourism_app/design.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 100,
        duration: 1000,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        splash: "assets/images/Explore.png",
        nextScreen: Design(),
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
