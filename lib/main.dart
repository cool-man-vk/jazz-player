import 'package:flutter/material.dart';
import 'package:music_player_app/screens/playing_screen.dart';
import './screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicHomePage(),
      routes: {
        PlayingScreen.routeName : (context) => PlayingScreen()
      },
    );
  }
}