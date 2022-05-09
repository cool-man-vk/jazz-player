import 'package:flutter/material.dart';
import '../arguments/queue_args.dart';


class QueueScreen extends StatelessWidget {
  static const routeName = '/queue-screen';

  @override
  Widget build(BuildContext context) {
    final QueueArgs args = ModalRoute.of(context)?.settings.arguments as QueueArgs; 
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const[
            Icon(Icons.queue , color: Colors.white,),
            Text('My queue')
          ],
        ),
      ),
      body: args == null 
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