import 'package:flutter/material.dart';
import 'package:music_player_app/arguments/queue_args.dart';
import 'package:music_player_app/screens/queue_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/homepage.dart';
class AppDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.blue
            ),
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  Icon(
                    Icons.music_note , 
                    size: 30,
                    color: Colors.white
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Jazz Player',
                    style: TextStyle(
                      fontSize: 20 ,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 55,
            padding: const EdgeInsets.all(15),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                    Icon(Icons.home , size: 22),
                    SizedBox(width: 8),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    )
                ],
              ),
              onTap: (){
                Navigator.of(context).pushNamed(HomePage.routeName);
              },
            ),
          ),
          Container(
            height: 55,
            padding: const EdgeInsets.all(15),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                    Icon(Icons.info , size: 22),
                    SizedBox(width: 8),
                    Text(
                      'About the App',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    )
                ],
              ),
              onTap: (){
                Navigator.of(context).pushNamed(QueueScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}