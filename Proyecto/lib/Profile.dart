import 'package:flutter/material.dart';
import 'Cajon.dart';
import 'Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


//Archivo que contiene la pantalla para mostrar el perfil del usuario (Recibe un objeto usuario)
//This file contains the screen to show the user's profile (Receives a Usuario object)
void main() => runApp(new Profile());

class Profile extends StatelessWidget {
Profile({Key key, this.usuario}) : super(key: key);
final Usuario usuario;


  @override
  Widget build(BuildContext context) {
    //Variables para guardar la imagen de perfil y los datos del usuario
    //Variables to save the users data and image
    String imagen;
      String nombre;
      String correo;
      String tel;
      //If para saber si el usuario entro con facebook o no
      //Si es con facebook regresa un scaffold para eso, si no regresa otro diferente 
      //If statement to know if the user loged in with facebook
      //If it is loged in with facebook returns a scafold for that
      if(usuario.isfacebook == true){
        imagen = usuario.user.photoUrl;
        nombre = usuario.user.displayName;
        correo = usuario.user.email;
        tel = usuario.user.phoneNumber;
        if(tel == null)
        {
          tel = 'No se encontro';
        }
        return Scaffold(
            appBar: new AppBar(
              title: new Text("Perfil"),
              backgroundColor: Colors.orange,
            ),
            drawer: Cajon(usuario: usuario),
            body: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
                    new Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(imagen),
                      )
                    )),
                    new Padding(padding: const EdgeInsets.only(top: 20.0),),
                    Text('Nombre: '+ nombre,textAlign: TextAlign.left,),
                    new Padding(padding: const EdgeInsets.only(top: 20.0),),
                    Text('Correo: '+ correo,textAlign: TextAlign.left,),
                    new Padding(padding: const EdgeInsets.only(top: 20.0),),
                    Text("Telefono: "+ tel,textAlign: TextAlign.left,),
                  ],
              ),
            ),
        );
      }
      else
      {
        //Si no debemos buscar los datos del usuario
      //If not we have to search for the users data
        imagen = 'https://banner2.kisspng.com/20180603/jx/kisspng-user-interface-design-computer-icons-default-stephen-salazar-photography-5b1462e1b19d70.1261504615280626897275.jpg';
        return Scaffold(
          appBar: AppBar(title: Text('Perfil'),),
          drawer:new Cajon(usuario: usuario),
          body: StreamBuilder(
              stream: Firestore.instance.collection("Cliente").snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return new Center(child: Text("Cargando....",textAlign: TextAlign.justify,),);
                }
                else
                {
                  for(int i=0;i<snapshot.data.documents.length;i++)
                  {
                    DocumentSnapshot item = snapshot.data.documents[i];
                    //Se busca en cada documento para ver cual es el del usuario y asi sacar los datos
                    //We search in each document to match the user uid & get the data
                    if(item.documentID == usuario.user.uid)
                    {
                      return ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20.0),
                        children: <Widget>[
                          new Column(children: <Widget>[
                            new Container(
                              width: 190.0,
                              height: 190.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(imagen),
                                )
                              )
                            ),
                            new Padding(padding: const EdgeInsets.only(top: 20.0),),
                            Center(child: Text("Nombre: "+item['nombre'],textAlign: TextAlign.left,),),
                            new Padding(padding: const EdgeInsets.only(top: 20.0),),
                            Center(child: Text("Correo: "+usuario.user.email,textAlign: TextAlign.left,),),
                            new Padding(padding: const EdgeInsets.only(top: 20.0),),
                            Center(child: Text("Telefono: "+ item['telefono'],textAlign: TextAlign.left,),),
                            new Padding(padding: const EdgeInsets.only(top: 20.0),),
                          ],
                          ),
                        ]
                      );
                    }
                  }
                }
              },
          )
        );
      }
  }
}
