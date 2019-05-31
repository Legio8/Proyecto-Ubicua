import 'package:firebase_auth/firebase_auth.dart';

//Clase Usuario que contiene el usuario de firebase y una bandera para saber si inicio sesion con Facebook
//User class that contains the firebase user and a bool to see if loged in with facebook or not
class Usuario {
  FirebaseUser user;
  bool isfacebook;

  Usuario({this.user, this.isfacebook});
}