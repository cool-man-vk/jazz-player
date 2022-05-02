import 'package:flutter/material.dart';
import './music_list.dart';


class MusicLists extends StatelessWidget {
  const MusicLists({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context,index) => 
        const MusicList(
          
        )
      ),
    );
  }
}