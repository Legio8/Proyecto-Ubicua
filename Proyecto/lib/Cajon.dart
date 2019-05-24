import 'package:ejemplo1/Primera.dart';
import 'package:ejemplo1/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Producto.dart';
import 'Perfil.dart';
import 'Direcciones.dart';
import 'Categorias.dart';

class Cajon extends StatelessWidget {
Cajon({Key key, this.usuario}) : super(key: key);
final Usuario usuario;

//Cajon();

  @override
  Widget build(BuildContext context) {
    String imagen;
    String nombre;
    String correo;
    if(usuario.isfacebook == true){
      imagen = usuario.user.photoUrl;
      nombre = usuario.user.displayName;
      correo = usuario.user.email;
    }
    else
    {
      imagen = 'https://banner2.kisspng.com/20180603/jx/kisspng-user-interface-design-computer-icons-default-stephen-salazar-photography-5b1462e1b19d70.1261504615280626897275.jpg';
      nombre = '';
      correo = usuario.user.email;
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
       children: <Widget>[
         UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.red),
            margin: EdgeInsets.only(bottom: 40.0),                                            
          currentAccountPicture: Container(  
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        NetworkImage(imagen))),
          ),
          accountName: new Container(
              child: Text(nombre,
            style: TextStyle(color: Colors.black),
          )),
          accountEmail: new Container(
              child: Text(
            correo,
            style: TextStyle(color: Colors.black),
          )),
        ),
          ListTile(
            title: Text("Producto"),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Primera()),);
            },
          ),
          ListTile(
            title: Text("Perfil",style: TextStyle(color: Colors.blueAccent,)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Perfil()),);
            },
          ),
          ListTile(
            title: Text("Direcciones"),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Direcciones()),);
            },
          ),
          ListTile(
            title: Text("Categorias",style: TextStyle(color: Colors.blueAccent,)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Categorias()),);
            },
          ),
          ListTile(
            title: Text("Cerrar Sesion"),
            onTap: (){
              logout();
             Navigator.pushReplacementNamed(context,'/main');
            }
          ),
       ],
     ),
     );
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }

}

