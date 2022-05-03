import 'package:flutter/material.dart';
import './music_list.dart';


class MusicLists extends StatelessWidget {
  static const musicDataDetails = [
      {
        'id': '1001', 
        'songName': 'Nanga Vera maari', 
        'movieName': 'Valimai',
        'image': 'assets/images/music.jpg',
        'music': 'audio/nanga-vera-maari.mp3'
      },
      {
        'id': '1002',
        'songName': 'Neeyum naanum sernthe sellum neram',
        'movieName': 'Naanum rowdy than',
        'image': 'assets/images/neeyum-naanum.jpg',
        'music': 'audio/neeyum-nanum.mp3'
      },
      {
        'id': '1003', 
        'songName': 'Antha arabic kadaloram', 
        'movieName': 'Bombay', 
        'image': 'assets/images/ar-rahman.jpg', 
        'music': 'audio/andha-arabic.mp3'
      }
  ];

  
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        itemCount: musicDataDetails.length,
        itemBuilder: (context,index) => 
        MusicList(
            musicDataDetails[index]['id']!,
            musicDataDetails[index]['songName']!,
            musicDataDetails[index]['movieName']!,
            musicDataDetails[index]['image']!,
            musicDataDetails[index]['music']!
        )
      ),
    );
  }
}