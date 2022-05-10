import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player_app/arguments/favorites_screen_args.dart';
import 'package:music_player_app/widgets/music_lists.dart';
import '../arguments/playing_screen_arguments.dart';
import './favorites_screen.dart';
import 'dart:math';

class PlayingScreen extends StatefulWidget {

  static const routeName = '/playing-screen';
  
  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  var musicItemCount = 0;
  static const musicInfos = [
      {
        'songName': 'Nanga Vera maari', 
        'movieName': 'Valimai',
        'image': 'assets/images/music.jpg',
        'music': 'audio/nanga-vera-maari.mp3'
      },
      {
        'songName': 'Neeyum naanum sernthe sellum neram',
        'movieName': 'Naanum rowdy than',
        'image': 'assets/images/neeyum-naanum.jpg',
        'music': 'audio/neeyum-nanum.mp3'
      },
      { 
        'songName': 'Antha arabic kadaloram', 
        'movieName': 'Bombay', 
        'image': 'assets/images/ar-rahman.jpg', 
        'music': 'audio/andha-arabic.mp3'
      },
      {
        'songName':'Anbe Peranbe',
        'movieName' : 'NGK',
        'image':'assets/images/anbe-peranbe-ngk.jpg',
        'music':'audio/anbe-peranbe.mp3'
      },
      {
        'songName':'Idhayathai etho ondru',
        'movieName' : 'Yennai Arinthal',
        'image':'assets/images/idhayathai.jpg',
        'music':'audio/anbe-peranbe.mp3'
      },
      {
        'songName':'Kambathu Ponnu',
        'movieName':'Sandakozhi-2',
        'image':'assets/images/sandakozhi-2.jpg',
        'music':'audio/kambathu-ponnu.mp3'
      },
      {
        'songName':'Penne unna partha',
        'movieName' : 'Saamy-2',
        'image':'assets/images/saamy-2.jpg',
        'music':'audio/penne-unna-paartha-saamy2.mp3'
      }
  ];
  bool playing = false; 
  IconData playBtn = Icons.play_arrow; 

  AudioPlayer? _player;
  AudioCache? cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  var shuffleCount = Random();

  


  //custom slider

  Widget slider() {
    return SizedBox(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player!.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);


    _player!.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };


    _player!.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    final PlayingScreenArgs args = ModalRoute.of(context)?.settings.arguments as PlayingScreenArgs;

    var indexCount = args.index;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 54, 138, 234),
                Color.fromARGB(255, 22, 136, 228),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 48.0,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Let's add some text title
                 
                const SizedBox(
                  height: 40.0,
                ),
                //Let's add the music cover
                Center(
                  child: Container(
                    width: 280.0,
                    height: 280.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: AssetImage(musicInfos[indexCount]['image']!),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Center(
                  child: Text(
                    musicInfos[indexCount]['songName']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 500.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              slider(),
                              Text(
                                "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                style:const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              icon: const Icon(
                                Icons.skip_previous,
                              ),
                              onPressed: () {
                                _player!.pause();
                                Navigator.of(context).pushReplacementNamed(
                                  PlayingScreen.routeName,
                                  arguments: indexCount == 0
                                      ? PlayingScreenArgs(
                                      image: MusicLists.musicDataDetails[MusicLists.musicDataDetails.length-1]['image']! ,
                                      songName: MusicLists.musicDataDetails[MusicLists.musicDataDetails.length-1]['songName']! ,
                                      music: MusicLists.musicDataDetails[MusicLists.musicDataDetails.length-1]['music']!,
                                      isFavorite : args.isFavorite ,
                                      index : MusicLists.musicDataDetails.length-1
                                    )
                                      : PlayingScreenArgs(
                                      image: MusicLists.musicDataDetails[indexCount-1]['image']! ,
                                      songName: MusicLists.musicDataDetails[indexCount-1]['songName']! ,
                                      music: MusicLists.musicDataDetails[indexCount-1]['music']!,
                                      isFavorite : args.isFavorite ,
                                      index : indexCount -1
                                    )
                                );
                               
                              },
                            ),
                            IconButton(
                              iconSize: 62.0,
                              color: Colors.blue[800],
                              onPressed: () {
                                if (!playing) {
                                  //now let's play the song
                                  cache!.play(musicInfos[indexCount]['music']!);
                                  setState(() {
                                    playBtn = Icons.pause;
                                    playing = true;
                                  });
                                } else {
                                  _player!.pause();
                                  setState(() {
                                    playBtn = Icons.play_arrow;
                                    playing = false;
                                  });
                                }
                              },
                              icon: Icon(
                                playBtn,
                              ),
                            ),
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              icon: const Icon(
                                Icons.skip_next,
                              ),
                              onPressed: () {
                                _player!.pause();
                                Navigator.of(context).pushReplacementNamed(
                                  PlayingScreen.routeName ,
                                  arguments: 
                                  indexCount == 6
                                      ? PlayingScreenArgs(
                                      image: MusicLists.musicDataDetails[indexCount = 0]['image']! ,
                                      songName: MusicLists.musicDataDetails[indexCount = 0]['songName']! ,
                                      music: MusicLists.musicDataDetails[indexCount = 0]['music']!,
                                      isFavorite : args.isFavorite ,
                                      index : indexCount = 0 
                                    )
                                      : PlayingScreenArgs(
                                      image: MusicLists.musicDataDetails[indexCount+1]['image']! ,
                                      songName: MusicLists.musicDataDetails[indexCount+1]['songName']! ,
                                      music: MusicLists.musicDataDetails[indexCount+1]['music']!,
                                      isFavorite : args.isFavorite ,
                                      index : indexCount + 1
                                    )
                                );
                              },
                            ),
                            IconButton(
                              iconSize: 40,
                              color: Colors.blue,
                              icon: args.isFavorite == false 
                                  ? const Icon(Icons.favorite_border) 
                                  : const Icon(Icons.favorite , color: Colors.red,),
                                  onPressed: (){
                                
                                
                                  },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}