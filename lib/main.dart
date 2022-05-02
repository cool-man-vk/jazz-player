import 'package:flutter/material.dart';
import './screens/homepage.dart';
import './screens/music_app.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {

      },
    );
  }
}

