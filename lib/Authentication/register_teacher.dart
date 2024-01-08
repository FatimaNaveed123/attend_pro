import 'package:attend_pro/views/select_role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/purple_button.dart';
import '../views/forgotpassword_screen.dart';
import '../views/login_screen.dart';

class RegisterTeacher extends StatefulWidget {
  final Role selectedRole;
  const RegisterTeacher({super.key, required this.selectedRole});

  @override
  State<RegisterTeacher> createState() => _RegisterTeacherState();
}

class _RegisterTeacherState extends State<RegisterTeacher> {
  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController designationController =
      new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Container(
                child: Image.asset("images/signup_2.png"),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.grey.shade800.withOpacity(0.5)
                        ]),
                        borderRadius: BorderRadius.circular(15.0)),
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
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
                            "Please sign in to continue",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            height: 30,
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
                                Icons.person_pin_sharp,
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
                          SizedBox(
                            height: 20,
                          ),
                          //designation
                          TextFormField(
                            controller: designationController,
                            decoration: InputDecoration(
                              label: Text(
                                "Designation",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.person,
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
                          SizedBox(
                            height: 20,
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
                          SizedBox(
                            height: 20,
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
                              label: Text(
                                "Password",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
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
                              label: Text(
                                "Confirm Password",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
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
                              BottomButton(
                                onTap: () {
                                  setState(() {
                                    showProgress = true;
                                  });
                                  registerUserWithEmailAndPasswordTeacher(
                                    emailController.text,
                                    passwordController.text,
                                    widget.selectedRole.name,
                                    designationController.text,
                                    nameController.text,
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
                              // MaterialButton(
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.all(
                              //           Radius.circular(20.0))),
                              //   elevation: 5.0,
                              //   height: 40,
                              //   onPressed: () {
                              //     setState(() {
                              //       showProgress = true;
                              //     });
                              //     registerUserWithEmailAndPasswordTeacher(
                              //         emailController.text,
                              //         passwordController.text,
                              //         widget.selectedRole.name,
                              //         designationController.text,
                              //         nameController.text);
                              //   },
                              //   child: Text(
                              //     "Register",
                              //     style: TextStyle(
                              //       fontSize: 20,
                              //     ),
                              //   ),
                              //   color: Colors.white,
                              // ),
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
      ),
    );
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Example registration function
  Future<void> registerUserWithEmailAndPasswordTeacher(
    String email,
    String password,
    String role,
    String designation,
    String fullName,
  ) async {
    try {
      if (_formkey.currentState!.validate()) {
        final credentials = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print("Created" + credentials.user!.email!);
        await setTeacherAttributes(
            credentials.user!.uid, designation, fullName, role);
        // After successful registration, set additional custom data
        // and attributes for the user based on their role.
        // if (role == 'teacher') {
        //   await setTeacherAttributes(
        //       credentials.user!.uid, designation, fullName);
        // } else if (role == 'student') {
        //   await setStudentAttributes(
        //       credentials.user!.uid, fullName, rollNo, semester);
        // }
      }
    } catch (error) {
      print('Error creating user: $error');
    }
  }

// Function to set attributes for a teacher
  Future<void> setTeacherAttributes(
      String uid, String designation, String fullName, String role) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'fullName': fullName,
        'role': role,
        'designation': designation,
        // Add other teacher-specific attributes
      });
    } catch (error) {
      print('Error setting teacher attributes: $error');
    }
  }

// Function to set attributes for a student
//   Future<void> setStudentAttributes(
//       String uid, String fullName, String rollNo, int semester) async {
//     try {
//       await _firestore.collection('users').doc(uid).set({
//         'fullName': fullName,
//         'rollNo': rollNo,
//         'role': 'student',
//         'semester': semester,
//         // Add other student-specific attributes
//       });
//       print("Student saved");
//     } catch (error) {
//       print('Error setting student attributes: $error');
//     }
//   }

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
