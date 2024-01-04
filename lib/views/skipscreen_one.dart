import 'package:attend_pro/views/skipscreen_two.dart';
import 'package:flutter/material.dart';

class SkipScreenOne extends StatelessWidget {
  const SkipScreenOne({Key? key});

  final double containerPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Image as background
          Image.asset(
            'images/face_rec2.jpg', // Replace with your image path
            width: double.infinity,
          ),

          // Overlaying container with content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 340, 0, 0),
              height: 300,
              padding: EdgeInsets.all(20),
              alignment:
                  Alignment.bottomRight, // Center content within container
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    "Learn the Basics",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "👀 Discover how to effortlessly mark your attendance with a simple glance.",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButtonTheme(
                    data: ElevatedButtonThemeData(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple.shade800,
                          // Set the default button color
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SkipScreenTwo()),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ), // Your content here
            ),
          ),
        ],
      ),
    );
  }
}
