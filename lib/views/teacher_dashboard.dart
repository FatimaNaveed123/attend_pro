// import 'package:attend_pro/views/select_role.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'login_screen.dart';
//
// class TeacherDashboard extends StatefulWidget {
//   String userName;
//   TeacherDashboard({Key? key, required this.userName}) : super(key: key);
//
//   @override
//   State<TeacherDashboard> createState() => _TeacherDashboardState();
// }
//
// class _TeacherDashboardState extends State<TeacherDashboard> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final TextEditingController _courseNameController = TextEditingController();
//   final TextEditingController _courseIdController = TextEditingController();
//
//   Future<void> _signOut() async {
//     try {
//       await _auth.signOut();
//       // Navigate to another screen or update the UI as needed
//     } catch (e) {
//       print('Error signing out: $e');
//     }
//   }
//
//   Future<void> _addCourse() async {
//     try {
//       User? user = _auth.currentUser;
//
//       if (user != null) {
//         String userId = user.uid;
//
//         String courseName = _courseNameController.text;
//         String courseId = _courseIdController.text;
//
//         String instructor = widget.userName;
//
//         await _firestore
//             .collection('users')
//             .doc(userId)
//             .collection('courses')
//             .add({
//           'instructorId': userId,
//           'courseName': courseName,
//           'courseId': courseId,
//           'instructor': instructor,
//         });
//
//         print('Course added for user with ID: $userId');
//         // Close the dialog after adding the course
//         Navigator.of(context).pop();
//       } else {
//         print('User not logged in.');
//       }
//     } catch (e) {
//       print('Error adding course: $e');
//     }
//   }
//
//   Future<void> displayCourse() async {
//     try {
//       User? user = _auth.currentUser;
//
//       if (user != null) {
//         String userId = user.uid;
//         await _firestore
//             .collection('users')
//             .doc(userId)
//             .collection('courses')
//             .get();
//
//         print('Course added for user with ID: $userId');
//         // Close the dialog after adding the course
//         Navigator.of(context).pop();
//       } else {
//         print('User not logged in.');
//       }
//     } catch (e) {
//       print('Error displaying course: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.userName.toString()),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 _signOut();
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => LoginScreen()));
//               },
//               icon: Icon(Icons.logout),
//             ),
//           ],
//         ),
//         body: Column(
//           children: [Text("Teacher Dashboard")],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('Add Course'),
//                   content: Form(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         TextFormField(
//                           controller: _courseNameController,
//                           decoration: InputDecoration(labelText: 'Course Name'),
//                         ),
//                         SizedBox(height: 20),
//                         TextFormField(
//                           controller: _courseIdController,
//                           decoration: InputDecoration(labelText: 'Course Id'),
//                         ),
//                         SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () {
//                             _addCourse();
//                           },
//                           child: Text(
//                             'Add Course',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
import 'package:attend_pro/views/course_students.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen.dart';

class TeacherDashboard extends StatefulWidget {
  final String userName;

  TeacherDashboard({Key? key, required this.userName}) : super(key: key);

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.userName),
          actions: [
            IconButton(
              onPressed: () {
                _signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          children: [
            Text("Teacher Dashboard"),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: FutureBuilder<List<Course>>(
                future: _getCourses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                        return GestureDetector(
                          child: ListTile(
                            title: Text(course.courseName),
                            subtitle: Text('ID: ${course.courseId}'),
                            tileColor: Colors.purple,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseDashboard()));
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add Course'),
                  content: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          controller: _courseNameController,
                          decoration: InputDecoration(labelText: 'Course Name'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _courseIdController,
                          decoration: InputDecoration(labelText: 'Course Id'),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _addCourse();
                          },
                          child: Text(
                            'Add Course',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      // Navigate to another screen or update the UI as needed
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<void> _addCourse() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String userId = user.uid;
        String courseName = _courseNameController.text;
        String courseId = _courseIdController.text;

        await _firestore.collection('courses').add({
          'instructorId': userId,
          'courseName': courseName,
          'courseId': courseId,
          'instructor': widget.userName,
        });

        print('Course added for user with ID: $userId');
        Navigator.of(context).pop();
      } else {
        print('User not logged in.');
      }
    } catch (e) {
      print('Error adding course: $e');
    }
  }

  Future<List<Course>> _getCourses() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String instructorId = user.uid;
        QuerySnapshot courseSnapshot = await _firestore
            .collection('courses')
            .where('instructorId', isEqualTo: instructorId)
            .get();
        List<DocumentSnapshot> courses = courseSnapshot.docs;

        return courses.map((course) {
          Map<String, dynamic> courseData =
              course.data() as Map<String, dynamic>;
          return Course(
            courseName: courseData['courseName'],
            courseId: courseData['courseId'],
          );
        }).toList();
      } else {
        print('User not logged in.');
        return [];
      }
    } catch (e) {
      print('Error getting courses: $e');
      return [];
    }
  }
}

class Course {
  final String courseName;
  final String courseId;

  Course({required this.courseName, required this.courseId});
}
