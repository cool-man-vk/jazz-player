import 'package:flutter/material.dart';
import '../arguments/playing_screen_arguments.dart';
import '../screens/playing_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import '../screens/favorites_screen.dart';
import '../arguments/favorites_screen_args.dart';


class MusicList extends StatefulWidget {

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
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  bool favClicked = false;

  AudioCache? cache;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.image),
          ),
          title: Text(widget.songName),
          subtitle: Text(widget.movieName),
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
                  icon: favClicked == false
                          ? const Icon(Icons.favorite_border)
                          : const Icon(Icons.favorite , color: Colors.red,) ,
                  onPressed: (){
                    setState(() {
                      if(favClicked == false){
                      favClicked = true;}
                      else{
                        favClicked = false;
                      }
                    });
                    Navigator.of(context).pushNamed(
                                  FavoritesScreen.routeName ,
                                  arguments: FavoriteScreenArgs(
                                    widget.image ,
                                    widget.music ,
                                    widget.songName ,
                                    favClicked
                                  )
                                );
                  },
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
              image: widget.image ,
              songName: widget.songName ,
              music: widget.movieName,
              isFavorite : favClicked
            )
          );
        }
      ),
    );
}
}