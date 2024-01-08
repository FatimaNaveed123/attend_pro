import 'package:attend_pro/views/select_role.dart';
import 'package:attend_pro/views/student_dashboard.dart';
import 'package:attend_pro/views/teacher_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/utils.dart';
import 'forgotpassword_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Utilities utilities = Utilities();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String userRole = ""; // Variable to store the user's role
  String userName = "";
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> _getUserRole() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot = await _firestore
            .collection('users')
            .doc(user.uid)
            .get(); // Assuming the user's UID is used as the document ID

        if (userSnapshot.exists) {
          setState(() {
            userRole = userSnapshot.get('role') ?? "";
            userName = userSnapshot.get('fullName') ?? "";
            print(userRole);
            print(userName);
          });
        } else {
          print('User document does not exist');
        }
      }
    } catch (e) {
      print('Error getting user role: $e');
    }
  }

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
                  opacity: 0.5),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 700,
                    margin: EdgeInsets.only(top: 300), // Adjust top margin

                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(28),
                    child: Form(
                      key: _formKey,
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
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              icon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                                try {
                                  final credentials =
                                      await _auth.signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text);

                                  if (credentials.user != null) {
                                    await _getUserRole();
                                    if (userRole == Role.student.name) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StudentDashboard(
                                                    userName: userName,
                                                  )));
                                    } else if (userRole == Role.teacher.name) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeacherDashboard(
                                                    userName: userName,
                                                  )));
                                    } else {
                                      print("Select Role");
                                    }
                                  }
                                } on FirebaseAuthException catch (e) {
                                  print(e);
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            child: Text(
                              'LogIn',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.purple),
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
                  ),
                  // Add your other UI elements here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
