import 'package:attend_pro/views/login_screen.dart';
import 'package:attend_pro/views/select_role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/purple_button.dart';

class StudentDashboard extends StatefulWidget {
  String userName;
  StudentDashboard({super.key, required this.userName});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String studentName = "";
  String rollNo = "";
  String courseId = "";
  Future<StudentInfo?> _getStudentInfo() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String userId = user.uid;

        // Check user role
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(userId).get();
        String userRole =
            userDoc['role']; // Assuming 'role' is a field indicating user role

        // Fetch additional information for student
        if (userRole == 'student') {
          DocumentSnapshot studentDoc =
              await _firestore.collection('users').doc(userId).get();
          studentName = studentDoc['fullName'];
          rollNo = studentDoc['rollNo'];

          print(studentName);
          return StudentInfo(name: studentName, rollNo: rollNo);
        } else {
          print('User is not a student.');
          return null;
        }
      } else {
        print('User not logged in.');
        return null;
      }
    } catch (e) {
      print('Error getting student information: $e');
      return null;
    }
  }

  // Future<void> joinCourse(String courseId) async {
  //   try {
  //     User? user = _auth.currentUser;
  //
  //     if (user != null) {
  //       // Fetch roll number from Firestore if needed
  //
  //       Map<String, dynamic> studentData = {
  //         'fullName': studentName,
  //         'rollNo': rollNo,
  //       };
  //       print(studentName);
  //       await _firestore.collection('courses').doc().update({
  //         'students': FieldValue.arrayUnion([studentData]),
  //       });
  //
  //       print('Student joined the course: $courseId');
  //     } else {
  //       print('User not logged in.');
  //     }
  //   } catch (e) {
  //     print('Error joining course: $e');
  //   }
  // }
  // Future<void> joinCourse() async {
  //   try {
  //     User? user = _auth.currentUser;
  //
  //     if (user != null) {
  //       // Fetch roll number from Firestore if needed
  //
  //       Map<String, dynamic> studentData = {
  //         'fullName': studentName,
  //         'rollNo': rollNo,
  //       };
  //
  //       // Query the "courses" collection to find the document with the current user's UID
  //       QuerySnapshot coursesSnapshot =
  //           await FirebaseFirestore.instance.collection('courses').get();
  //
  //       // Check if there is a matching document
  //       if (coursesSnapshot.docs.isNotEmpty) {
  //         for (QueryDocumentSnapshot courseDoc in coursesSnapshot.docs) {
  //           String courseId = courseDoc.id;
  //
  //           // Reference the existing course document using courseId
  //           DocumentReference courseRef =
  //               _firestore.collection('courses').doc(courseId);
  //           print(courseId);
  //           // Update the document with the student data
  //           await courseRef.update({
  //             'students': FieldValue.arrayUnion([studentData]),
  //           });
  //
  //           print('Student joined the course. Course ID: $courseId');
  //         }
  //       } else {
  //         print('Course document not found for the current user.');
  //       }
  //     } else {
  //       print('User not logged in.');
  //     }
  //   } catch (e) {
  //     print('Error joining course: $e');
  //   }
  // }
  Future<void> joinCourse(String courseId) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Fetch roll number from Firestore if needed

        Map<String, dynamic> studentData = {
          'fullName': studentName,
          'rollNo': rollNo,
        };

        // Reference the selected course document using courseId
        DocumentReference courseRef =
            _firestore.collection('courses').doc(courseId);
        print(courseId);
        // Update the document with the student data
        await courseRef.update({
          'students': FieldValue.arrayUnion([studentData]),
        });

        print('Student joined the course. Course ID: $courseId');
      } else {
        print('User not logged in.');
      }
    } catch (e) {
      print('Error joining course: $e');
    }
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      // Navigate to another screen or update the UI as needed
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.userName.toString()),
          actions: [
            IconButton(
                onPressed: () {
                  _signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            Text("Student Dashboard"),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: FutureBuilder<List<Course>>(
                future: _getCourses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print(snapshot.data?.length);
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No courses found.');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Course course = snapshot.data![index];

                        return Column(
                          children: [
                            GestureDetector(
                              child: ListTile(
                                title: Text(course.courseName),
                                subtitle:
                                    Text('Instructor: ${course.instructor}'),
                                trailing: Text('${course.courseId}'),
                                tileColor: Colors.purple,
                              ),
                              onTap: () {
                                _displayJoinForm(context, course);
                                _getStudentInfo();
                              },
                            ),
                            Divider(
                              thickness:
                                  2.0, // Adjust the thickness of the divider
                              color:
                                  Colors.white, // Set the color of the divider
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _displayJoinForm(BuildContext context, Course course) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Join Course'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Name : ${studentName}".toString()),
                Text("RollNo : ${rollNo}".toString()),
              ],
            ),
          ),
          actions: [
            BottomButton(
              onTap: () async {
                print(course.courseId);

                // Check if the student has already joined the course
                if (await _hasStudentJoinedCourse(course.courseId)) {
                  print('Student has already joined this course.');
                  // You can show an error message or handle it as needed
                } else {
                  joinCourse(course.courseId);
                }
              },
              buttonTitle: 'Join',
              customeHeight: 50.0,
              customeWidth: 100.0,
              borderRadius: 15.0,
            ),
            BottomButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              buttonTitle: 'Cancel',
              customeHeight: 50.0,
              customeWidth: 100.0,
              borderRadius: 15.0,
            ),
          ],
        );
      },
    );
  }

  Future<bool> _hasStudentJoinedCourse(String courseId) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String userId = user.uid;

        // Query the course document to check if the student is already in the "students" array
        DocumentSnapshot courseDoc =
            await _firestore.collection('courses').doc(courseId).get();

        List<dynamic> students = courseDoc['students'];
        print(students.length);
        // Check if the student's information is already in the array
        return students.any((student) => student['rollNo'] == rollNo);
      } else {
        print('User not logged in.');
        return false;
      }
    } catch (e) {
      print('Error checking if student has joined course: $e');
      return false;
    }
  }
}

Future<List<Course>> _getCourses() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    QuerySnapshot courseSnapshot = await _firestore.collection('courses').get();

    List<DocumentSnapshot> courses = courseSnapshot.docs;

    return courses.map((course) {
      Map<String, dynamic> courseData = course.data() as Map<String, dynamic>;
      return Course(
        courseId: courseData['courseId'],
        courseName: courseData['courseName'],
        instructor: courseData['instructor'],
      );
    }).toList();
  } catch (e) {
    print('Error getting courses: $e');
    return [];
  }
}

class Course {
  final String courseName;
  final String instructor;
  final String courseId;

  Course(
      {required this.courseId,
      required this.courseName,
      required this.instructor});
}

class StudentInfo {
  final String name;
  final String rollNo;

  StudentInfo({required this.name, required this.rollNo});
}
