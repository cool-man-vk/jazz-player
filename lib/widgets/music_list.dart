import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/music_details.dart';

class MusicList extends StatelessWidget {
  const MusicList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        child: const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          title: Text('MusicName'),
          subtitle: Text('MovieName'),
        ),
        onTap: (){},
      ),
    );
}
}