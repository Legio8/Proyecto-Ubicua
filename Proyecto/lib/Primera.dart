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
      body: StreamBuilder(
          stream: Firestore.instance.collection("Menu").snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return new Center(child: Text("Cargando....",textAlign: TextAlign.justify,),);
            }
            else
            {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  DocumentSnapshot item = snapshot.data.documents[index];
                  return new Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: <Widget>[
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