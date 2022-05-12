import 'package:flutter/material.dart';
import '../widgets/music_lists.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [Icon(Icons.music_note), Text('Jazz Player')],
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(height: 800, child: MusicLists()),
      ),
    );
  }
}


