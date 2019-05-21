import 'package:firebase_auth/firebase_auth.dart';

class Usuario {
  FirebaseUser user;
  bool isfacebook;

  Usuario({this.user, this.isfacebook});
}