import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

//Archivo registrarse que contiene la pantalla para registrar a un usuario nuevo con correo, nombre y telefono
//This file contains the register screen for a new user with email, name & phone number 
void main() => runApp(new Registrarse());


class Registrarse extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<Registrarse> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  //Variables para guardar el correo, contraseña, tel, nombre
  //Variables to storage email, password, phone, name
  String _usuario;
  String _contra;
  String _tel;
  String _nomb;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Se guarda el estado de la form para poder tomar los valores ingresados
  //It saves the form state so we can take the input values on the form
  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  //Este metodo agrega al usuario con correo y contraseña ademas de registrar su nombre y telefono en la BD de firebase
  //This method adds a user with email & password and puts the name and phone in the Firebase DB 
  void performLogin()  async{
    try{
        //Crea el usuario con correo y contraseña
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _usuario, password: _contra);
        user.sendEmailVerification(); //Envia email de verificacion al usuario
        //Agrega el nombre y telefono a la BD
        //Adds the name and phone to the DB
        await Firestore.instance.collection('Cliente').document(user.uid).setData({'nombre': _nomb, 'telefono': _tel});
        //Flushbar que muestra el mensaje y al terminar regresa a la pantalla de inicio de sesion
        //Flushbar that show a message, when is done goes back to the login screen
        Flushbar(
          title:  "Confirmacion",
          message:  "Se envio un correo de verificacion para que pueda iniciar sesion",
          duration:  Duration(seconds: 4),
          aroundPadding: EdgeInsets.all(8),
          borderRadius: 8,
        )..show(context).then((r)=> Navigator.pop(context));
      }catch(e){
        //Errores posibles
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
              backgroundColor: Colors.orange,
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
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
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
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Nombre"),
                      validator: (nomb) {
                        if(nomb.isEmpty){
                          return "Llene este campo";
                        }
                      },
                      onSaved: (val) => _nomb = val,
                      keyboardType: TextInputType.text,
                    ),
                     new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Telefono"),
                      validator: (tel) {
                        if(tel.isEmpty){
                          return "Llene este campo";
                        }
                      },
                      onSaved: (val) => _tel = val,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new RaisedButton(
                      child: new Text(
                        "Registrarse",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.green[300],
                      onPressed: _submit, //When register button is hit call the submit method
                      //Cuando se da click en registrar se llama al metodo submit 
                    )
                  ],
                ),
              ),
            ));
      }
}