import 'package:flutter/material.dart';
import '../arguments/playing_screen_arguments.dart';
import '../screens/playing_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicList extends StatelessWidget {

  bool favClicked = false;
  
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
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                PopupMenuButton(
                  onSelected: (value){},
                  itemBuilder: (context) => [
                    PopupMenuItem(
                          child: ElevatedButton(
                          onPressed: (){}, 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const[
                               Icon(Icons.queue),
                               SizedBox(width: 6,),
                               Text('Add to Queue'),
                            ],
                          )
                          )
                      ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: (){},
                )
              ],
            ),
          ),
        ),
        onTap: () 
        {
          Navigator.of(context).pushNamed(
            PlayingScreen.routeName , 
            arguments: PlayingScreenArgs(
              songName: songName ,
              image: image ,
              music: music
            )
          );
        }
      ),
    );
}
}