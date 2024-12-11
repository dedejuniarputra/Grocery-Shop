import 'package:flutter/material.dart';
// import 'package:myapp/login.dart';
import 'package:myapp/onboarding.dart';
import 'package:myapp/Login.dart';
import 'package:myapp/sign_up.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan banner debug
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Onboarding(), // Pastikan LoginScreen sesuai
    );
  }
}

