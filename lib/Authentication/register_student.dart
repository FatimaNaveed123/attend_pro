import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/purple_button.dart';
import '../views/login_screen.dart';
import '../views/select_role.dart';

class RegisterStudent extends StatefulWidget {
  final Role selectedRole;
  const RegisterStudent({super.key, required this.selectedRole});

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final TextEditingController semesterController = new TextEditingController();
  final TextEditingController rollNoController = new TextEditingController();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController rollNo = new TextEditingController();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    print(widget.selectedRole.name);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/signup_1.png', // Replace with your image path
              width: double.infinity,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.black12,
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          "Plz Sign in to continue",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //fullname
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            label: Text(
                              "Full Name",
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.drive_file_rename_outline,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                        ),

                        //email

                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            label: Text(
                              "Email",
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        //roll no
                        TextFormField(
                          controller: rollNoController,
                          decoration: InputDecoration(
                            label: Text(
                              "Roll No",
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.numbers,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        //semester
                        TextFormField(
                          controller: semesterController,
                          decoration: InputDecoration(
                            label: Text(
                              "Semester",
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.schedule,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        //password
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Password",
                              style: TextStyle(color: Colors.white),
                            ),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure2,
                          controller: confirmpassController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Confirm Password",
                              style: TextStyle(color: Colors.white),
                            ),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "Password did not match";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //Bottom button
                            BottomButton(
                              onTap: () {
                                setState(() {
                                  showProgress = true;
                                });
                                registerUserWithEmailAndPasswordStudent(
                                  emailController.text,
                                  passwordController.text,
                                  widget.selectedRole.name,
                                  semesterController.text,
                                  nameController.text,
                                  rollNoController.text,
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              // onTap: () {
                              //   Navigator.push(context,
                              //       MaterialPageRoute(builder: (context) => ));
                              // },
                              customeWidth: 150,
                              buttonTitle: 'Sign Up', customeHeight: 35,
                              borderRadius: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Example registration function
  Future<void> registerUserWithEmailAndPasswordStudent(
    String email,
    String password,
    String role,
    String semester,
    String fullName,
    String rollNo,
  ) async {
    try {
      if (_formkey.currentState!.validate()) {
        final credentials = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print("Created" + credentials.user!.email!);
        await setStudentAttributes(
            credentials.user!.uid, fullName, rollNo, semester, role);

        // After successful registration, set additional custom data
        // and attributes for the user based on their role.
        // if (role == 'teacher') {
        //   await setTeacherAttributes(credentials.user!.uid, designation,fullName);
        // } else if (role == 'student') {
        //   await setStudentAttributes(credentials.user!.uid,fullName,rollNo, semester);
        // }
      }
    } catch (error) {
      print('Error creating user: $error');
    }
  }

// Function to set attributes for a teacher
//   Future<void> setTeacherAttributes(
//       String uid, String designation, String fullName) async {
//     try {
//       await _firestore
//           .collection('users')
//           .doc(uid)
//           .set({
//         'fullName': fullName,
//         'role': 'teacher',
//         'designation': designation,
//         // Add other teacher-specific attributes
//       });
//     } catch (error) {
//       print('Error setting teacher attributes: $error');
//     }
//   }

// Function to set attributes for a student
  Future<void> setStudentAttributes(String uid, String fullName, String rollNo,
      String semester, String role) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'fullName': fullName,
        'rollNo': rollNo,
        'role': role,
        'semester': semester,
        // Add other student-specific attributes
      });
      print("Student saved");
    } catch (error) {
      print('Error setting student attributes: $error');
    }
  }

// Function to retrieve user attributes
  Future<Map<String, dynamic>?> getUserAttributes(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        print('No such document!');
        return null;
      }
    } catch (error) {
      print('Error getting user attributes: $error');
      return null;
    }
  }
}
