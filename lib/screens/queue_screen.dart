import 'package:flutter/material.dart';
import 'package:music_player_app/arguments/queue_args_get.dart';
import '../arguments/queue_args.dart';


class QueueScreen extends StatelessWidget {
  static const routeName = '/queue-screen';
  @override
  Widget build(BuildContext context) {
    final QueueArgsGet args = ModalRoute.of(context)?.settings.arguments as QueueArgsGet;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const[
            Icon(Icons.queue , color: Colors.white,),
            Text('My queue')
          ],
        ),
      ),
      body: args.image.isNotEmpty && args.songName.isNotEmpty && args.movieName.isNotEmpty
      ? SizedBox(
        height: 800,
        child: ListView.builder(
          itemBuilder: (
             (context, index) 
              => Card(
                elevation: 8,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(args.image),
                  ),
                  title: Text(args.songName),
                  subtitle: Text(args.movieName),
                ),
              )
            )
        ),
      )
      : const Center(child: Text('No songs added in queue'),)
      
    );
  }
}