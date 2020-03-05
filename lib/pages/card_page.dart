import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipoUno(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipoDos()
        ],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Título'),
            subtitle: Text(
                'No hay nadie que ame el dolor mismo, que lo busque, lo encuentre y lo quiera, simplemente porque es el dolor.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(child: Text('Cancelar'), onPressed: () {}),
              FlatButton(child: Text('Acpetar'), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoDos() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
              height: 250.0,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/2/2c/NZ_Landscape_from_the_van.jpg')),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Un texto muy importante'))
        ],
      ),
    );
  }
}
