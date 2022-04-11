import 'package:flutter/material.dart';
import '../widgets/songs.dart';

class MusicLists extends StatelessWidget {
  const MusicLists({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Songs(),
    );
  }
}