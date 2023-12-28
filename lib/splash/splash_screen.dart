import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../popupscreen/listscreen2.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.1,
      end: 1.5,
    ).animate(_animationController);

    _fadeAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    Timer(Duration(milliseconds: 3000), () {
      navigateToNextScreen();
    });
  }

  void navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ListScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String assetsPath = "assets/scissors1removebg.png";
    Color assetsColor = Colors.black;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Stack(
          children: [
            // Image.asset(
            //   "assets/background.jpg",
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: double.infinity,
            // ),
            Center(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            assetsColor,
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            assetsPath,
                            width: 100.0, // Adjust the width as needed
                            height: 100.0, // Adjust the height as needed
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Scissors',
                        style: GoogleFonts.lavishlyYours(
                            fontWeight: FontWeight.bold,
                            color: assetsColor,
                            fontSize: 30),
                      ),
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
