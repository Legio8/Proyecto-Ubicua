import 'package:flutter/material.dart';
import 'Cajon.dart';


void main() => runApp(new Direcciones());

class Direcciones extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<Direcciones> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _numcasa;
  String _telefono;
  String _direccion;

  

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
      content: new Text("Direccion : $_direccion\nNo. Casa : $_numcasa\nTelefono : $_telefono"),
      duration: Duration(seconds: 3),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            key: scaffoldKey,
            appBar: new AppBar(
              title: new Text("Direccion"),
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
                    Center(child: Text("Direcciones y envio",),),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Direccion",hintText: 'Direccion de su casa',),
                      validator: (dir) {
                        if(dir == ""){
                          return "Campo vacio";
                        }
                      },
                      onSaved: (val) => _direccion = val,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "No. de Casa",hintText: 'Su numero de casa',),
                      validator: (numcas) {
                        if( numcas == "")
                        {
                          return "Numero no valido";
                        }
                      },
                      onSaved: (val) => _numcasa = val,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Celular",hintText: 'Su numero de celular',),
                      validator: (tel) {
                        if( tel.length != 10)
                        {
                          return "Numero no valido";
                        }
                      },
                      onSaved: (val) => _telefono = val,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
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
            ));
      }
}