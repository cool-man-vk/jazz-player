import 'package:flutter/material.dart';

class PlayingScreen extends StatelessWidget {
  static const routeName = '/playingscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing Item'),
      ),   
    );
  }
}