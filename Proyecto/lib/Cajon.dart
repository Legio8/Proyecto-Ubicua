import 'package:ejemplo1/Primera.dart';
import 'package:ejemplo1/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'Carrito.dart';


//Pantalla del drawer recibe el usuario para saber que informacion mostrar
//Drawer screen receives the user so we know wich data to use
class Cajon extends StatelessWidget {
Cajon({Key key, this.usuario}) : super(key: key);
final Usuario usuario;

//Cajon();

  @override
  Widget build(BuildContext context) {
    String imagen;
    String nombre;
    String correo;
    //If para saber si inicio sesion con facebook y saber que datos mostrar
    //If statement to know if facebook login & know wich data display
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
          decoration: BoxDecoration(color: Colors.orange),
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
            title: Text("Menu",style: TextStyle(color: Colors.blue)),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Primera(user: usuario)),);
            },
          ),
          ListTile(
            title: Text("Perfil",),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Profile(usuario: usuario)),);
            },
          ),
          ListTile(
            title: Text("Carrito"),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Carrito(usuario:usuario)),);
            },
          ),
          ListTile(
            title: Text("Cerrar Sesion",style: TextStyle(color: Colors.red)),
            onTap: (){
              logout();
             Navigator.pushReplacementNamed(context,'/main');
            }
          ),
       ],
     ),
     );
  }
  //Simple funcion para cerrar sesion
  //log out function doesnt do much
  logout() async {
    await FirebaseAuth.instance.signOut();
  }

}

