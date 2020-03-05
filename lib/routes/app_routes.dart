import 'package:flutter/material.dart';

import 'package:app_componentes/pages/alert_page.dart';
import 'package:app_componentes/pages/avatar_page.dart';
import 'package:app_componentes/pages/home_page.dart';
import 'package:app_componentes/pages/card_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      'home': (BuildContext context) => HomePage(),
      'alert': (BuildContext context) => AlertPage(),
      'avatar': (BuildContext context) => AvatarPage(),
      'card': (BuildContext context) => CardPage(),
    };
  }
}
