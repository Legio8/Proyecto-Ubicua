import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Primera.dart';
import 'Registrarse.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(),
      home: new FormPage(),
      routes: <String, WidgetBuilder>{ //app routes
      '/primera': (BuildContext context) => new Primera(),
    },
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {
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
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _usuario, password: _contra);
        Navigator.of(context).pushNamedAndRemoveUntil('/primera', ModalRoute.withName('/'));
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
              title: new Text("Inicio de sesion"),
              
            ),
            body: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Form(
                key: formKey,
                child: new ListView(
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Usuario"),
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
                        "Login",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: _submit,
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
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Registrarse()),);
                      },
                    ),
                  ],
                ),
              ),
            ));
      }
}