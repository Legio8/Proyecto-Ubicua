import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:toast/toast.dart';
import 'Usuario.dart';
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
        Usuario usuario = Usuario(user: user,isfacebook: false);
        Navigator.push(context, MaterialPageRoute(builder: (context) => new Primera(user: usuario)));
      }catch(e){
        Toast.show(e.errorMessage ,context ,duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      }
  }

  login() async {
    final facebookLogin = new FacebookLogin();
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        FacebookAccessToken myToken = result.accessToken;
        final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: myToken.token);
        FirebaseUser user = await FirebaseAuth.instance.signInWithCredential(credential);
        Usuario usuario = Usuario(user: user,isfacebook: true);
        Navigator.push(context, MaterialPageRoute(builder: (context) => new Primera(user: usuario)));
        break;
      case FacebookLoginStatus.cancelledByUser:
        Toast.show("Cancelado por el usuario",context ,duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        break;
      case FacebookLoginStatus.error:
        Toast.show(result.errorMessage ,context ,duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        break;
    }
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
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    FacebookSignInButton(
                      onPressed: login,
                  ),
                  ],
                ),
              ),
            ));
      }
  }
