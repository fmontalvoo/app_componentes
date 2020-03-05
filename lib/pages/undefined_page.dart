import 'package:flutter/material.dart';

class UndefinedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Undefined'),
      ),
      body: Center(
        child: Text('Route not defined'),
      ),
    );
  }
}
