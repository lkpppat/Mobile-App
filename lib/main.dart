import 'package:flutter/material.dart';
import 'package:mypets/navbar.dart';
import '../pages/home_start.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:mypets/database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ConcertOne'),
      title: 'My pets',
      home: const StartScreen(),
    );
  }
}

