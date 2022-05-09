import 'package:flutter/material.dart';


class QueueScreen extends StatelessWidget {
  static const routeName = '/queue-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const[
            Icon(Icons.queue , color: Colors.white,),
            Text('My queue')
          ],
        ),
      ),
      body: Container(),
      
    );
  }
}