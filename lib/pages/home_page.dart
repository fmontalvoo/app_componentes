import 'package:app_componentes/providers/menu_provider.dart';
import 'package:app_componentes/utils/icon_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargaDatos(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaItems(BuildContext context, List<dynamic> opciones) {
    List<Widget> items = List<Widget>();
    opciones.forEach((op) {
      items
        ..add(ListTile(
          title: Text(op['texto']),
          leading: getIconByName(op['icon']),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.pushNamed(context, op['ruta']);
          },
        ))
        ..add(Divider());
    });
    return items;
  }
}
