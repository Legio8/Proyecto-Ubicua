import 'package:flutter/material.dart';
import 'Producto.dart';
import 'Perfil.dart';
import 'Direcciones.dart';
import 'Categorias.dart';

class Cajon extends StatelessWidget {

Cajon();

  @override
  Widget build(BuildContext context) {
   return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
       children: <Widget>[
         DrawerHeader(
           child: Text("Menu",style: TextStyle(color: Colors.white)),
           decoration: BoxDecoration(color: Colors.red),
         ),
          ListTile(
            title: Text("Producto"),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Producto()),);
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
       ],
     ),
     );
  }

}

