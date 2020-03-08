import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  List<int> _numeros = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      itemCount: _numeros.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://picsum.photos/500/300/?image=${_numeros[index]}'));
      },
    );
  }
}
