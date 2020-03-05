import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = List<dynamic>();

  _MenuProvider();

  Future<List<dynamic>> cargaDatos() async {
    final data = await rootBundle.loadString('data/menu.json');
    Map dataMap = json.decode(data);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = _MenuProvider();
