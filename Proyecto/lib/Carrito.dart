import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Usuario.dart';
import 'Pagar.dart';


void main() => runApp(new Carrito());

class Carrito extends StatelessWidget{
Carrito({Key key, this.usuario}) : super(key: key);
final Usuario usuario;
    
    
      @override
      Widget build(BuildContext context) {        
        int totalFin= 0;
        return new Scaffold(
            body: StreamBuilder(
              stream: Firestore.instance.collection("Carrito").document(usuario.user.uid).collection("Platillos").snapshots(),
              builder: (context,snapshot){
                
                if(!snapshot.hasData){
                  return new Center(child: Text("Cargando....",textAlign: TextAlign.justify,),);
                }
                else
            {
              return new NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    new SliverAppBar(
                      pinned: true,
                      title: new Text('Carrito'),
                      backgroundColor: Colors.orange,
                      leading: new IconButton(
                        icon: new Icon( Icons.arrow_back, color: Colors.white,),
                        onPressed: () {
                           Navigator.pop(context);
                        },
                      ),
                    ),
                  ];
                },
                body: new Column(
                  children: <Widget>[
                     new Container(
                       height: 400.0,
                        child: ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context,index){
                          DocumentSnapshot item = snapshot.data.documents[index];
                          int total = item['Precio'] * int.parse(item['Cantidad']);
                          totalFin = totalFin + total;
                          return new Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(children: <Widget>[
                              Image.asset(item['imagen'],width: 150.0,height: 120.0,),
                              new Padding(padding: const EdgeInsets.only(right: 15.0),),
                              Column(children: <Widget>[
                                new Padding(padding: const EdgeInsets.only(top: 10.0),),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Text("Precio: \$"+ item['Precio'].toString(),),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Text("Cantidad: "+item['Cantidad']),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Text("Total: \$"+total.toString()),
                                  ),
                                ),
                              ],
                              ),
                            ],
                            )
                          );
                       }
                      ),
                    ),
                    Text("Total a pagar: \$"+totalFin.toString()),
                    new Padding(padding: const EdgeInsets.only(top: 10.0),),
                  new RaisedButton(
                    child: new Text("Pagar",style: new TextStyle(color: Colors.white),),
                    color: Colors.green[300],
                    onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => new Pagar(usuario:usuario, total:totalFin)));
                    },
                  ),
                  ],
                ),
                );
            }
              }
              )
              
        );
      }
}