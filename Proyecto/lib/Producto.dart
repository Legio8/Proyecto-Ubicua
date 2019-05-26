import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new Producto());

class Producto extends StatelessWidget{
Producto({Key key, this.item}) : super(key: key);
final DocumentSnapshot item;
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text("Producto"),
              backgroundColor: Colors.orange,
              leading: new IconButton(
                icon: new Icon( Icons.arrow_back, color: Colors.white,),
                onPressed: () {
                   Navigator.pop(context);
                },
               ),
            ),
            //drawer: Cajon(),
            body: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
                   Column(
                     children: <Widget>[
                       Row(children: <Widget>[
                         GestureDetector(
                           child: Hero(
                             tag: 'imageHero',
                             child: Image.asset(item['imagen'],width: 150.0,height: 100.0,),
                             ),
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_) {
                               return DetailScreen();
                             }));
                           },
                         ),
                         new Padding(padding: const EdgeInsets.only(right: 15.0),),
                         Column(children: <Widget>[
                           Text("Precio: "+item['Precio'].toString()),
                           new Padding(padding: const EdgeInsets.only(top: 20.0),),
                           new RaisedButton(
                             child: new Text("Comprar",style: new TextStyle(color: Colors.white),),
                              color: Colors.blue,
                              onPressed: (){
                                Navigator.of(context).pushNamed('/carrito');
                              },
                           ),
                         ],
                        )
                       ],
                      ),
                      new Padding(padding: const EdgeInsets.only(top: 50.0),),
                      Text("Descripcion: ",textAlign: TextAlign.left,),
                      new Padding(padding: const EdgeInsets.only(top: 20.0),),
                      Text(item['Descripcion'],textAlign: TextAlign.justify,),
                     ],
                   ),
                  ],
                ),
              ),
            );
      }
}
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset('images/imagen1.jpg',fit: BoxFit.contain,)
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}