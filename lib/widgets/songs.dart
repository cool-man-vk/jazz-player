import 'package:flutter/material.dart';

class Songs extends StatelessWidget {
  const Songs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: 
      (context , index) =>  InkWell(
        onTap: (){},
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