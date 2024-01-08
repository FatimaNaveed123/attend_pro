// import 'package:firebase_tutorials/ui/post/post_.dart';
// import 'package:firebase_tutorials/ui/signUp_screen.dart';
// import 'package:firebase_tutorials/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../widgets/round_button.dart';
// import 'fireStore/DisplayPost_Screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   Utilities utilities = Utilities();
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     emailController.dispose();
//     passwordController.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text('Login'),
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 icon: Icon(Icons.email),
//                 hintText: 'Email eg jhon@gmail.com',
//                 labelText: 'Email *',
//               ),
//               validator: (String? value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                 icon: Icon(Icons.lock),
//                 hintText: 'enter password',
//                 labelText: 'Password *',
//               ),
//               validator: (String? value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter a password';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: RoundButton(
//                 title: 'Login',
//                 onTap: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Process data.
//                     _auth
//                         .signInWithEmailAndPassword(
//                             email: emailController.text,
//                             password: passwordController.text)
//                         .then((value) {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Posts()));
//                     }).onError((error, stackTrace) {
//                       utilities.toastMessage(error.toString());
//                     });
//                   }
//                 },
//               ),
//             ),
//             Text('Dont have an Account'),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SignUpScreen(),
//                   ),
//                 );
//               },
//               child: Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
