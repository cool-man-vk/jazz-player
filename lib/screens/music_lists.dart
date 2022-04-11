import 'package:flutter/material.dart';
import 'package:music_player_app/widgets/songs.dart';

class MusicLists extends StatelessWidget {
  const MusicLists({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 450,
      child: Songs(),
    );
  }
}