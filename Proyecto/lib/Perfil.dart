import 'package:flutter/material.dart';
import 'Cajon.dart';

void main() => runApp(new Perfil());

class Perfil extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<Perfil> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _nombre;
  String _intereses;

  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Nombre : $_nombre\nIntereses : $_intereses"),
      duration: Duration(seconds: 3),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            key: scaffoldKey,
            appBar: new AppBar(
              title: new Text("Perfil"),
            ),
            drawer: Cajon(),
            body: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Form(
                key: formKey,
                child: new ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
                    new Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/doge.jpg'),
                        )
                    )),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Nombre", hintText: 'Su nombre',),
                      validator: (nombre) {
                        if(nombre.contains(new RegExp(r'[0-9]')) || nombre == ""){
                          return "Nombre Invalido";
                        }
                      },
                      onSaved: (val) => _nombre = val,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Intereses",hintText: '¿Que le gusta hacer?',),
                      validator: (interes) {
                        if(interes == ""){
                          return "Campo vacio";
                        }
                      },
                      onSaved: (val) => _intereses = val,
                    ),
                    
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new RaisedButton(
                      child: new Text(
                        "Guardar",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: _submit,
                    ),
                    new RaisedButton(
                      child: new Text(
                        "Regresar",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            )
        );
      }
}