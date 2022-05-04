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
      },
      {
        'id':'1004',
        'songName':'Anbe Peranbe',
        'movieName' : 'NGK',
        'image':'assets/images/anbe-peranbe-ngk.jpg',
        'music':'audio/anbe-peranbe.mp3'
      },
      {
        'id':'1005',
        'songName':'Idhayathai etho ondru',
        'movieName' : 'Yennai Arinthal',
        'image':'assets/images/idhayathai.jpg',
        'music':'audio/anbe-peranbe.mp3'
      },
      {
        'id':'1006',
        'songName':'Kambathu Ponnu',
        'movieName':'Sandakozhi-2',
        'image':'assets/images/sandakozhi-2.jpg',
        'music':'audio/kambathu-ponnu.mp3'
      },
      {
        'id':'1007',
        'songName':'Penne unna partha',
        'movieName' : 'Saamy-2',
        'image':'assets/images/saamy-2.jpg',
        'music':'audio/penne-unna-paartha-saamy2.mp3'
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