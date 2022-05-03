import 'package:flutter/material.dart';
import '../arguments/playing_screen_arguments.dart';
import '../screens/playing_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicList extends StatelessWidget {

  AudioCache? cache;
  final String id;
  final String songName;
  final String movieName;
  final String image;
  final String music;

  MusicList(
    this.id ,
    this.songName,
    this.movieName,
    this.image,
    this.music
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          title: Text(songName),
          subtitle: Text(movieName),
        ),
        onTap: () 
        {
          cache!.play(music);
          Navigator.of(context).pushNamed(
          PlayingScreen.routeName , 
          arguments: PlayingScreenArgs(
            songName: songName ,
            image: image ,
            music: music
          )
        );}
      ),
    );
}
}