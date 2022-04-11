import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import '../screens/playing_screen.dart';

class Songs extends StatelessWidget {
  var audioManagerInstance = AudioManager.instance;

  Future<void> _playMusic(ctx) async{
    try{
      await audioManagerInstance.start(
        "https://masstamilan.so/downloader/XgOmHaKKqDUT0pC5j1CNmw/1649724303/d128_cdn/7887", 
        "Bhoomi enna Sutudhe - Ethirneechal",
        desc: "Motivational song for every individual with jobless",
        auto: true,
        cover: ''
      );
    }
    catch(err){
      print('error');
    }
    Navigator.of(ctx).pushNamed(PlayingScreen.routeName);
  }
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: 
      (context , index) =>  InkWell(
        onTap: () => _playMusic(context),
        child: Card (
          margin: const EdgeInsets.all(8),
          elevation: 5,
          child:Container(
            padding: const EdgeInsets.all(10),
            child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.music_video_outlined ,
                color: Colors.black,
              ),
            ),
            title: Text('Song $index'),
            subtitle: Text('This is song $index'),
            trailing: Container(
              width: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: (){},
                  )
                ],
              )
            ),
                  ),
          )
          ),
      )
    );
  }
}