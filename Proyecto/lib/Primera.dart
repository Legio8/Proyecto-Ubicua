import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Usuario.dart';
import 'Producto.dart';
import 'Carrito.dart';
import 'Pagar.dart';
import 'Finalizada.dart';
import 'Cajon.dart';
import 'main.dart';


void main() => runApp(Primera());

//Archivo que contiene la pantalla de menu donde se muestra el menu que recibe desde la BD de firebase
//Recive el usuario que inicio sesion
//File that contains the menu screen where it show the menu items from the firebase DB
//Receives the user that's logged in 
class Primera extends StatelessWidget {
  Primera({Key key, this.user}) : super(key: key);
  final Usuario user;
  
  //Primera();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Principal',
      home: MyHomePage(user: user),
       routes: <String, WidgetBuilder>{ //app routes
      '/producto': (BuildContext context) => new Producto(),
      '/carrito': (BuildContext context) => new Carrito(),
      '/pagar': (BuildContext context) => new Pagar(),
      '/finalizada': (BuildContext context) => new Finalizada(),
      '/main': (BuildContext context) => new MyApp(),
    },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Usuario user;
  MyHomePage({Key key, this.user}) : super(key: key);

//Center(child: Text('Pantalla principal')),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),backgroundColor: Colors.orange,),
      drawer:new Cajon(usuario: user),
      //Se crea un stream builder para poder sacar los datos de la BD
      //We create a stream builder so we can access the data in the DB
      body: StreamBuilder(
          stream: Firestore.instance.collection("Menu").snapshots(),
          builder: (context,snapshot){
            //Si no hay datos muestra pantalla de carga
            //No data show loading screen
            if(!snapshot.hasData){
              return new Center(child: Text("Cargando....",textAlign: TextAlign.justify,),);
            }
            else
            {
              //Si ya hay datos muestralos
              //There is data show it
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  //Esta variable contiene los datos de cada item en la coleccion menu
                  //This variable has the data of the item on index fro the menu collection
                  DocumentSnapshot item = snapshot.data.documents[index];
                  return new Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: <Widget>[
                        //Se puede acceder a cada campo con solo poner su nombre como item[nombre_Del_Cmapo]
                        //You can access each field with the name of that field like item[name_Of_Field]
                        Center(child: Image.asset(item['imagen']),),
                        new Padding(padding: const EdgeInsets.only(top: 20.0,left: 20.0),),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text('Nombre: '+item['Nombre'],),
                          ),
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0,left: 20.0),),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text('Descripcion:\n'+item['Descripcion'],),
                          ),
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0,right: 20.0),),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Text("Precio: \$"+ item['Precio'].toString(),),
                          ),
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0),),
                        new RaisedButton(
                          child: new Text("Ir",style: new TextStyle(color: Colors.white),),
                          color: Colors.green[300],
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => new Producto(item: item,usuario:user)));
                          },
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0),),
                      ],
                    )
                  );
                  },
                );
              }
            },
          )
      );
  }
}