import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Usuario.dart';
import 'Cajon.dart';
import 'ProdOrden.dart';

//Pantalla del carrito recive el usuario
//La variable total no sirve siempre muestra 0 ¿Arreglar? 
//Cart screen recieves the user
//The total variable doesnt work it always shows 0 ¿Fix?
void main() => runApp(new Ordenes());

class Ordenes extends StatelessWidget{
Ordenes({Key key, this.usuario}) : super(key: key);
final Usuario usuario;
    
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(title: Text('Ordenes'),backgroundColor: Colors.orange,),
      drawer: new Cajon(usuario: usuario),
      //Se crea un stream builder para poder sacar los datos de la BD
      //We create a stream builder so we can access the data in the DB
      body: StreamBuilder(
          stream: Firestore.instance.collection("Ordenes").document(usuario.user.uid).collection("Ordenes Usuario").snapshots(),
          builder: (context,snapshot){
            //Si no hay datos muestra pantalla de carga
            //No data show loading screen
            if(!snapshot.hasData){
              return new Center(child: Text("Cargando....",textAlign: TextAlign.justify,),);
            }
            else
            {
              int numer =0;
              //Si ya hay datos muestralos
              //There is data show it
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  //Esta variable contiene los datos de cada item en la coleccion menu
                  //This variable has the data of the item on index fro the menu collection
                  DocumentSnapshot item = snapshot.data.documents[index];
                  numer++;
                  return new Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: <Widget>[
                        //Se puede acceder a cada campo con solo poner su nombre como item[nombre_Del_Cmapo]
                        //You can access each field with the name of that field like item[name_Of_Field]
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text("Orden: "+ numer.toString(),),
                          ),
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0,right: 20.0),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Nombre:"),
                            Text("Hora:"),
                            Text("Lista:"),
                          ],
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0,right: 20.0),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(item['Nombre']),
                            Text(item['Hora']),
                            Text(item['Lista']),
                          ],
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0,right: 20.0),),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Text("Total: \$"+ item['Total'].toString(),),
                          ),
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 20.0),),
                        new RaisedButton(
                          child: new Text("Ver Platillos",style: new TextStyle(color: Colors.white),),
                          color: Colors.green[300],
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => new ProdOrden(usuario:usuario,id: item.documentID)));
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