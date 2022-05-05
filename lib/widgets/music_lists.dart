import 'package:flutter/material.dart';
import 'package:music_player_app/arguments/playing_screen_arguments.dart';
import './music_list.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import '../screens/favorites_screen.dart';
import '../arguments/favorites_screen_args.dart';
import '../screens/playing_screen.dart';


class MusicLists extends StatefulWidget {
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
  State<MusicLists> createState() => _MusicListsState();
}

class _MusicListsState extends State<MusicLists> {
  @override
  Widget build(BuildContext context) {
    bool favClicked = false;

    AudioCache? cache;

  var favLists = <Map>[];
    return SizedBox(
      height: 270,
      child: ListView.builder(
        itemCount: MusicLists.musicDataDetails.length,
        itemBuilder: (context,index) => 
        // MusicList(
        //     musicDataDetails[index]['id']!,
        //     musicDataDetails[index]['songName']!,
        //     musicDataDetails[index]['movieName']!,
        //     musicDataDetails[index]['image']!,
        //     musicDataDetails[index]['music']!
        // )
        Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(MusicLists.musicDataDetails[index]['image']!),
          ),
          title: Text(MusicLists.musicDataDetails[index]['songName']!),
          subtitle: Text(MusicLists.musicDataDetails[index]['movieName']!),
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
                        favClicked = true;
                        favLists.add({
                            'image': MusicLists.musicDataDetails[index]['image'] ,
                            'songName':MusicLists.musicDataDetails[index]['songName'],
                            'music':MusicLists.musicDataDetails[index]['music'],
                            'movieName':MusicLists.musicDataDetails[index]['music'],
                            'isFavourite':favClicked
                        });
                        Navigator.of(context).pushNamed(
                          FavoritesScreen.routeName ,
                          arguments:FavoriteScreenArgs(
                            favLists
                          )
                        );
                      }
                      else{
                        favClicked = false;
                      }
                    });
                    // FavoritesList;
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
              image: MusicLists.musicDataDetails[index]['image']! ,
              songName: MusicLists.musicDataDetails[index]['songName']! ,
              music: MusicLists.musicDataDetails[index]['music']!,
              isFavorite : favClicked
            )
          );
        },
        splashColor: Colors.blue,
      ),
    )
      ),
    );
  }
}