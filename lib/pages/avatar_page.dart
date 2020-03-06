import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('FM'),
              ))
        ],
      ),
      body: Center(
        child: FadeInImage(
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://gommera.files.wordpress.com/2018/10/fantasy_world.jpg')),
      ),
    );
  }
}
