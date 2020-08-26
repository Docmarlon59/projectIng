<<<<<<< HEAD
import 'package:cargas_maximas_f/src/pages/home_page.dart';
import 'package:cargas_maximas_f/src/pages/scanner_page.dart';
=======
>>>>>>> 0dae9bed1c9d8b3fff23ba84dce90e82c16179b3
import 'package:flutter/material.dart';

import 'package:cargas_maximas_f/pages/welcome/welcome.dart';
import 'package:cargas_maximas_f/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SICAM',
      theme: ThemeData(primaryColor: Color(0xFFB3282D)),
      home: WelcomePage(),
      routes: getApplicationRoutes(),
    );
  }
}