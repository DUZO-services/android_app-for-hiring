// ignore_for_file: prefer_const_constructors

import 'package:duzo/firebase_options.dart';
import 'package:duzo/pages/home/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'pages/login/login.dart';
import 'palette.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper()
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if a user is already logged in
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is signed in, navigate to Home
      return const navbar();
    } else {
      // User is not signed in, navigate to Login
      return Login();
    }
  }
}