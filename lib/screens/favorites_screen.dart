import 'package:flutter/material.dart';
import '../arguments/favorites_screen_args.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({ Key? key }) : super(key: key);
  static const routeName = '/favorites-screen';

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
      body: args == null 
      ? const Center(
        child: Text('No Favourites added yet , start adding some!'),
      )
      : Card(
        elevation: 8,
        margin: const EdgeInsets.all(6),
        child: InkWell(
          child:ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(args.image),
            ),
            title: Text(args.songName),
            subtitle: Text(args.movieName),
            trailing: Container(
                
            ),
          ),
          onTap: (){},
        ),
      ),
    );
  }
}