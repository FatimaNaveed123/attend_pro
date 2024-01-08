import 'package:attend_pro/views/select_role.dart';
import 'package:attend_pro/views/signup_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  margin: EdgeInsets.only(top: 200), // Adjust top margin

                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(28),
                  child: Column(
                    children: [
                      Text(
                        "Forgot Password",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Please sign in to continue",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.purple.shade800,
                            ),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => LoginScreen(),
                            //   ),
                            // );
                          },
                          child: Text(
                            'LogIn',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 15, color: Colors.purple.shade100),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectRoleScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Don’t have an account? Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Add your other UI elements here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
