import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(new Registrarse());


class Registrarse extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<Registrarse> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _usuario;
  String _contra;

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

  void performLogin()  async{
    try{
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _usuario, password: _contra);
        user.sendEmailVerification();
        Navigator.of(context).pop();
      }catch(e){
        print(e.message);
      }
     //Navigator.of(context).pushNamedAndRemoveUntil('/primera', ModalRoute.withName('/'));
  }
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            key: scaffoldKey,
            appBar: new AppBar(
              title: new Text("Registrar"),
              
            ),
            body: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Form(
                key: formKey,
                child: new ListView(
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Correo"),
                      validator: (user) {
                        if(user.isEmpty){
                          return "Usuario no valido";
                        }
                      },
                      onSaved: (val) => _usuario = val,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Contraseña"),
                      validator: (contra) {
                        if(contra.length < 6){
                          return "Contraseña de 6 caracteres";
                        }
                      },
                      onSaved: (val) => _contra = val,
                      obscureText: true,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new RaisedButton(
                      child: new Text(
                        "Registrarse",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: _submit,
                    )
                  ],
                ),
              ),
            ));
      }
}