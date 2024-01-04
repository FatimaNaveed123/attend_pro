// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Container(
//         color: Colors.redAccent,
//         child: Stack(
//           children: [
//             Image.asset(
//               "images/login.jpg",
//             ),
//             Container(
//               width: double.infinity,
//               color: Color.fromARGB(100, 22, 44, 33),
//               margin: EdgeInsets.all(20),
//               padding: EdgeInsets.all(40),
//               child: Text(
//                 "Hello Everyone! This is FlutterCampus",
//                 style: TextStyle(fontSize: 25, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       )
//           // body: Column(
//           //   crossAxisAlignment: CrossAxisAlignment.stretch,
//           //   children: [
//           //     Expanded(
//           //       child: Opacity(
//           //         opacity: 0.9, // Adjust opacity here (0.0 to 1.0)
//           //         child: Image.asset(
//           //           'images/login.jpg', // Replace with your image path
//           //           width: double.infinity,
//           //           fit: BoxFit.cover,
//           //         ),
//           //       ),
//           //     ),
//          //     Container(
// //           //       color: Colors.black87.withOpacity(0.9),
// //           //       padding: EdgeInsets.all(38),
// //           //       child: Column(
// //           //         children: [
// //           //           Text("Login"),
// //           //           Text("Please sign in to continue"),
// //           //           TextField(
// //           //             decoration: InputDecoration(labelText: "Email"),
// //           //           ),
// //           //           TextField(
// //           //             decoration: InputDecoration(labelText: "Password"),
// //           //           ),
// //           //           ElevatedButtonTheme(
// //           //             data: ElevatedButtonThemeData(
// //           //               style: ButtonStyle(
// //           //                 backgroundColor: MaterialStateProperty.all<Color>(
// //           //                   Colors.purple.shade800,
// //           //                 ),
// //           //                 textStyle: MaterialStateProperty.all<TextStyle>(
// //           //                   TextStyle(fontSize: 18),
// //           //                 ),
// //           //               ),
// //           //             ),
// //           //             child: ElevatedButton(
// //           //               onPressed: () {
// //           //                 Navigator.push(
// //           //                   context,
// //           //                   MaterialPageRoute(
// //           //                       builder: (context) => LoginScreen()),
// //           //                 );
// //           //               },
// //           //               child: Text(
// //           //                 'LogIn',
// //           //                 style: TextStyle(color: Colors.white),
// //           //               ),
// //           //             ),
// //           //           ),
// //           //           Text("Forgot Password?"),
// //           //           Text("Don’t have an account? Sign up")
// //           //         ],
// //           //       ),
// //           //     )
// //           //   ],
// //           // ),
// //           ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("images/login.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 color: Color.fromARGB(100, 22, 44, 33),
//                 margin: EdgeInsets.all(20),
//                 padding: EdgeInsets.all(40),
//                 child: Text(
//                   "Hello Everyone! This is FlutterCampus",
//                   style: TextStyle(fontSize: 25, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("images/login.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             color: Colors.black.withOpacity(0.7), // Set the transparency level
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                     Container(
//                 color: Colors.black87.withOpacity(0.9),
//                 padding: EdgeInsets.all(38),
//                 child: Column(
//                   children: [
//                     Text("Login"),
//                     Text("Please sign in to continue"),
//                     TextField(
//                       decoration: InputDecoration(labelText: "Email"),
//                     ),
//                     TextField(
//                       decoration: InputDecoration(labelText: "Password"),
//                     ),
//                     ElevatedButtonTheme(
//                       data: ElevatedButtonThemeData(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                             Colors.purple.shade800,
//                           ),
//                           textStyle: MaterialStateProperty.all<TextStyle>(
//                             TextStyle(fontSize: 18),
//                           ),
//                         ),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()),
//                           );
//                         },
//                         child: Text(
//                           'LogIn',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     Text("Forgot Password?"),
//                     Text("Don’t have an account? Sign up")
//                   ],
//                 ),
//               )
//             ],
//           ),
//           ),
//                 // Add your other UI elements here
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("images/login.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             width: double.infinity,
//
//             color: Colors.transparent, // Set the transparency level
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 400,
//                   color: Colors.grey.withOpacity(0.3),
//                   padding: EdgeInsets.all(28),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Login",
//                         textAlign: TextAlign.start,
//                         style: TextStyle(color: Colors.white, fontSize: 30),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text("Please sign in to continue",
//                           style: TextStyle(color: Colors.white, fontSize: 16)),
//                       TextField(
//                         decoration: InputDecoration(
//                             labelText: "Email",
//                             icon: Icon(
//                               Icons.email,
//                               color: Colors.white,
//                             )),
//                       ),
//                       TextField(
//                         decoration: InputDecoration(
//                             labelText: "Password",
//                             icon: Icon(
//                               Icons.lock,
//                               color: Colors.white,
//                             )),
//                       ),
//                       ElevatedButtonTheme(
//                         data: ElevatedButtonThemeData(
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                               Colors.purple.shade800,
//                             ),
//                             textStyle: MaterialStateProperty.all<TextStyle>(
//                               TextStyle(fontSize: 18),
//                             ),
//                           ),
//                         ),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => LoginScreen(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             'LogIn',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "Forgot Password?",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       Text(
//                         "Don’t have an account? Sign up",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Add your other UI elements here
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:attend_pro/views/select_role.dart';
import 'package:flutter/material.dart';

import 'forgotpassword_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

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
                        "Login",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 30),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
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
                          style: TextStyle(fontSize: 15, color: Colors.purple),
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
