import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  List<int> _numeros = [];
  ScrollController _controller = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addItems(0, 7);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _loading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _controller,
        itemCount: _numeros.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/300/?image=${_numeros[index]}'));
        },
      ),
      onRefresh: _refresh,
    );
  }

  void _addItems(int min, int max) {
    for (var i = min; i < max; i++) {
      _numeros.add((i + 1));
    }
    setState(() {});
  }

  Future<void> _fetchData() async {
    _isLoading = true;
    setState(() {});
    Timer(Duration(seconds: 2), response);
  }

  void response() {
    _isLoading = false;
    _controller.animateTo(_controller.position.pixels + 100,
        duration: Duration(microseconds: 250), curve: Curves.fastOutSlowIn);
    _addItems(_numeros.length, (_numeros.length + 7));
  }

  Widget _loading() {
    if (_isLoading)
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
        ],
      );
    return Container();
  }

  Future _refresh() async {
    final duration = Duration(seconds: 1);
    Timer(duration, () {
      _numeros.clear();
      _addItems(7, 14);
    });
    return Future.delayed(duration);
  }
}
