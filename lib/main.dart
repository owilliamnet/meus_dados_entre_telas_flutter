import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeuApp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<HomePage> {
  var _nomeTextField = TextEditingController();
  var _emailTextField = TextEditingController();
  var _foneTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados entre telas'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(150, 0, 100, 200),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: TextField(
                  controller: _nomeTextField,
                  decoration: InputDecoration(
                    labelText: 'Digite seu nome',
                    fillColor: Colors.greenAccent,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: TextField(
                  controller: _emailTextField,
                  decoration: InputDecoration(
                    labelText: 'Digite seu email',
                    fillColor: Colors.blueAccent,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              ListTile(
                title: TextField(
                  controller: _foneTextField,
                  decoration: InputDecoration(
                    labelText: 'Digite seu telefone',
                    fillColor: Colors.blueAccent,
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              ListTile(
                title: FlatButton(
                  child: Text('Mostrar relatório'),
                  textColor: Colors.blue,
                  onPressed: () {
                    if (_nomeTextField.text == '') {

                    } else if ( _emailTextField.text == '') {

                    } else if ( _foneTextField.text == '') {

                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage(
                          nome: _nomeTextField.text,
                          email: _emailTextField.text,
                          telefone: _foneTextField.text,
                        )),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(String campo) {
    
  }
}

class SecondPage extends StatefulWidget {
  final String nome;
  final String email;
  final String telefone;

  SecondPage({Key key, this.nome, this.email, this.telefone}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda tela'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(150, 0, 200, 100),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Nome'),
            subtitle: widget.nome != '' ? Text('${widget.nome}',style: _styleCampoPreenchido(),) : Text('Nome não informado' ,style: _styleCampoVazio(),),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: widget.email != '' ? Text('${widget.email}',style: _styleCampoPreenchido(),) : Text('Email não informado',style: _styleCampoVazio(),),
          ),
          ListTile(
            title: Text('Telefone'),
            subtitle: widget.telefone != '' ? Text('${widget.telefone}',style: _styleCampoPreenchido(),) : Text('Telefone não informado',style: _styleCampoVazio(),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text(
                  'Alterar',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  TextStyle _styleCampoVazio() {
    return TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
    );
  }
  TextStyle _styleCampoPreenchido() {
    return TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    );
  }


}
