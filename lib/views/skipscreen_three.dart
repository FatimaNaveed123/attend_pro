import 'package:flutter/material.dart';

import 'login_screen.dart';

class SkipScreenThree extends StatelessWidget {
  const SkipScreenThree({Key? key});

  final double containerPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: 10,
          ),
          // Image as background
          Image.asset(
            'images/face_rec4.jpg', // Replace with your image path
            width: double.infinity,
          ),

          // Overlaying container with content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
              height: 800,
              padding: EdgeInsets.all(20),
              alignment:
                  Alignment.bottomRight, // Center content within container
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.4),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 19,
                  ),
                  Expanded(
                    child: Text(
                      "Stay Secure, Stay Connected",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "🛡️ Rest assured, your facial data is encrypted for maximum security. Stay connected with our support team for any assistance.",
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
                                builder: (context) => LoginScreen()));
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
