import 'package:flutter/material.dart';
import 'package:myapp/Login.dart';
import 'package:myapp/onboarding.dart';
import 'package:myapp/homescreen.dart';
import 'package:myapp/buy.dart';
import 'package:myapp/notif.dart';
import 'package:myapp/favorite.dart';
import 'package:myapp/Delivery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Onboarding(),
    );
  }
}
