import 'package:flutter/material.dart';

void main() => runApp(new Producto());

class Producto extends StatelessWidget{

    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text("Producto"),
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
                             child: Image.asset('images/imagen1.jpg',width: 150.0,height: 100.0,),
                             ),
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_) {
                               return DetailScreen();
                             }));
                           },
                         ),
                         new Padding(padding: const EdgeInsets.only(right: 15.0),),
                         Column(children: <Widget>[
                           Text("Precio: 250,000"),
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
                      Text("Automovil camaro de agencia 2019 totalmente equipado con estereo, aire acondicionado,asientos de piel y direccion hidraulica para un mejor movimiento a la hora de manejar",textAlign: TextAlign.justify,),
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