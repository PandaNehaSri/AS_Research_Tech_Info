import 'package:as_research_techno_information/Auth-Screens/Testing.dart';
import 'package:as_research_techno_information/Front-Page/front-page.dart';
import 'package:as_research_techno_information/Home-Screen/home-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FrontPage());
  }
}
