import 'package:flutter/material.dart';
import './music_lists.dart';
class MusicHomePage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(
              Icons.music_note ,
              color: Colors.white,
            ),
            Text('Music Player App',)
          ]
        ),
      ),
      body: const SingleChildScrollView(
        child: MusicLists(),
      ),
    );
  }
}