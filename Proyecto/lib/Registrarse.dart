import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

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
        Flushbar(
          title:  "Confirmacion",
          message:  "Se envio un correo de verificacion para que pueda iniciar sesion",
          duration:  Duration(seconds: 4),
          aroundPadding: EdgeInsets.all(8),
          borderRadius: 8,
        )..show(context).then((r)=> Navigator.pop(context));
      }catch(e){
        if(e is PlatformException){
          if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
            Toast.show("Usuario ya existe",context ,duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
          }
          if(e.code == 'ERROR_INVALID_EMAIL') {
            Toast.show("Formato de correo invalido",context ,duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
          }
          if(e.code == 'ERROR_WEAK_PASSWORD') {
            Toast.show("Contraseña debil",context ,duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
          }
        }
      }
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