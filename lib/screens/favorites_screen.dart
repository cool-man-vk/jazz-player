import 'package:flutter/material.dart';
import 'package:music_player_app/arguments/playing_screen_arguments.dart';
import 'package:music_player_app/screens/playing_screen.dart';
import '../arguments/favorites_screen_args.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites-screen';

  List<FavoriteScreenArgs> favMusic = [];

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {
    final FavoriteScreenArgs args = ModalRoute.of(context)?.settings.arguments as FavoriteScreenArgs;
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const[
            Icon(
              Icons.favorite , 
              color: Colors.white,
              size: 25,
            ),
            SizedBox(width: 5),
            Text(
              'My Favorites',
              style: TextStyle(
                fontSize: 18
              ),
            ),
          ],
        ),
      ),
      body: args.favMusic.isNotEmpty
      ? Card(
        elevation: 8,
        margin: const EdgeInsets.all(6),
        child: ListView.builder(
          itemCount: args.favMusic.length,
          itemBuilder: (context , index)
          => InkWell(
            child:ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(args.favMusic[index]['image']),
              ),
              title: Text(args.favMusic[index]['songName']),
              subtitle: Text(args.favMusic[index]['movieName']),
              trailing: Container(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon : const Icon(Icons.remove_circle_rounded) ,
                      onPressed: (){
                        setState(() {
                          args.favMusic.removeWhere((music) => music['songName'] == args.favMusic[index]['songName']);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            onTap: (){
              Navigator.of(context).pushNamed(
                PlayingScreen.routeName,
                arguments: PlayingScreenArgs(
                  songName: args.favMusic[index]['songName'], 
                  image: args.favMusic[index]['image'], 
                  music: args.favMusic[index]['music'], 
                  isFavorite: true, 
                  index: index                                                                          
                )
              );
            },
          ),
        ),
      )
      : const Center(
        child: Text('No Favourites added yet , start adding some!'),
      ),
    );
  }
}