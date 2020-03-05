import 'package:flutter/material.dart';
import 'package:app_componentes/pages/undefined_page.dart';
import 'package:app_componentes/routes/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: AppRoutes.getRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => UndefinedPage());
      },
    );
  }
}
