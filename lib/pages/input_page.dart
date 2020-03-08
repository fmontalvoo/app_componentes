import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";
  String _opcion = "Volar";
  List _poderes = ["Volar", "Super Fuerza", "Teletrasnpotacion"];

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la perosona',
          labelText: 'Nombre',
          helperText: 'Ingrese el nombre de la persona',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock_outline),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearFecha() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha',
          labelText: 'Fecha',
          suffixIcon: Icon(Icons.calendar_view_day),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _seleccionarFecha(context);
      },
    );
  }

  Widget _crearDropdown() {
    List<DropdownMenuItem<String>> lista = List();
    _poderes.forEach((pw) {
      lista.add(DropdownMenuItem(
        child: Text(pw),
        value: pw,
      ));
    });

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _opcion,
              items: lista,
              onChanged: (opt) {
                setState(() {
                  _opcion = opt;
                });
              }),
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcion),
    );
  }

  Future<void> _seleccionarFecha(BuildContext context) async {
    DateTime seleccionada = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        locale: Locale('es', 'ES'));
    if (seleccionada != null) {
      setState(() {
        _fecha = seleccionada.toString();
        _controller.text = _fecha;
      });
    }
  }
}
