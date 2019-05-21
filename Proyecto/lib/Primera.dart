import 'package:flutter/material.dart';
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
      appBar: AppBar(title: Text('Principal'),),
      drawer:new Cajon(usuario: user),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Center(child: Image.asset('images/camaro.png'),),
          new Padding(padding: const EdgeInsets.only(top: 20.0),),
          Center(child: Text("Automovil camaro de agencia 2019 totalmente equipado con estereo, aire acondicionado,asientos de piel y direccion hidraulica para un mejor movimiento a la hora de manejar",textAlign: TextAlign.justify,),),
          new Padding(padding: const EdgeInsets.only(top: 20.0),),
          new RaisedButton(
            child: new Text("Ir",style: new TextStyle(color: Colors.white),),
            color: Colors.blue,
            onPressed: (){
              Navigator.of(context).pushNamed('/producto');/*Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Producto()),);*/
            },
          ),
        ],
      ),
    );
  }
}