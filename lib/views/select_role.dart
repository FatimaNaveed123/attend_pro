import 'package:flutter/material.dart';
import '../Authentication/register_student.dart';
import '../Authentication/register_teacher.dart';
import '../components/container.dart';
import '../components/purple_button.dart';
import '../declaration/Constants/constants.dart';

enum Role {
  student,
  teacher,
}

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  Role? role;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          children: [
            Image.asset(
              'images/face_rec5.jpg', // Replace with your image path
            ),
            Text(
              "Select User Type",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              "Please use your Profession",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Image.asset("images/student.png"),
                          decoration: BoxDecoration(
                            color: role == Role.student
                                ? Colors.green.withOpacity(0.3)
                                : Colors.grey.withOpacity(0.6),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            role = Role.student;
                            print("Student selected");
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "        Student",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Text(
                    "or",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          padding: EdgeInsets.all(4.0),
                          child: Image.asset("images/teacher.png"),
                          decoration: BoxDecoration(
                            color: role == Role.teacher
                                ? Colors.green.withOpacity(0.3)
                                : Colors.grey.withOpacity(0.6),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(25.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            role = Role.teacher;
                            print("teacher selected");
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Teacher",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BottomButton(
              onTap: () {
                if (role == Role.student) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterStudent(
                                selectedRole: role!,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterTeacher(
                                selectedRole: role!,
                              )));
                }
              },
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => ));
              // },
              customeWidth: 150,
              buttonTitle: 'Next Step', customeHeight: 35, borderRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}
