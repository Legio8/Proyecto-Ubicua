import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Usuario.dart';
import 'Cajon.dart';

//Pantalla del carrito recive el usuario
//La variable total no sirve siempre muestra 0 ¿Arreglar? 
//Cart screen recieves the user
//The total variable doesnt work it always shows 0 ¿Fix?
void main() => runApp(new ProdOrden());

class ProdOrden extends StatelessWidget{
ProdOrden({Key key, this.usuario,this.id}) : super(key: key);
final Usuario usuario;
final String id;
    
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(title: Text('Productos Orden'),backgroundColor: Colors.orange,
      leading: new IconButton(
                icon: new Icon( Icons.arrow_back, color: Colors.white,),
                onPressed: () {
                   Navigator.pop(context);
                },
               ),
      ),
      
      //Se crea un stream builder para poder sacar los datos de la BD
      //We create a stream builder so we can access the data in the DB
      body: StreamBuilder(
          stream: Firestore.instance.collection("Ordenes").document(usuario.user.uid).collection("Ordenes Usuario").document(id).collection("Platillos").snapshots(),
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
                        Row(children: <Widget>[
                              Image.asset(item['imagen'],width: 150.0,height: 120.0,),
                              new Padding(padding: const EdgeInsets.only(right: 50.0),),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Column(children: <Widget>[
                                new Padding(padding: const EdgeInsets.only(top: 10.0),),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 150.0,
                                    child: Text("Nombre: \n"+ item['Nombre'],),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Text("Cantidad: "+item['Cantidad']+"               "),
                                  ),
                                ),
                              ],
                              ),
                              ),
                            ],
                            ),
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