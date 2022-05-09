import 'package:flutter/material.dart';
import './screens/homepage.dart';
import 'screens/playing_screen.dart';
import './screens/favorites_screen.dart';
import './screens/queue_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: '/',
      routes: {
        FavoritesScreen.routeName :(context) => FavoritesScreen(),
        PlayingScreen.routeName : (context) => PlayingScreen() ,
        QueueScreen.routeName : (context) => QueueScreen()
      },
      
    );
  }
}

