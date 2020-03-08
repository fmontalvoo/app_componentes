import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderPage();
}

class _SliderPage extends State<SliderPage> {
  double _valor = 0.0;
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImage())
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño imagen',
        divisions: 20,
        value: _valor,
        min: 0.0,
        max: 300.0,
        onChanged: !_check
            ? (value) {
                setState(() {
                  _valor = value;
                });
              }
            : null);
  }

  Widget _checkBox() {
    // return Checkbox(
    //     value: _check,
    //     onChanged: (value) {
    //       setState(() {
    //         _check = value;
    //       });
    //     });
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _check,
        onChanged: (value) {
          setState(() {
            _check = value;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _check,
        onChanged: (value) {
          setState(() {
            _check = value;
          });
        });
  }

  Widget _crearImage() {
    return Image(
        width: _valor,
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://pm1.narvii.com/6712/703a6ad98b711913c49ec1f82059e3b15da07f55_00.jpg'));
  }
}
