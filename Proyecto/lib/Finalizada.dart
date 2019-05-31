import 'package:flutter/material.dart';



//Pantalla que muestra que se realizo la compra exitosamente (Nada especial aqui)
//Screen that shows that the purchase is finished (Nothing special here)
void main() => runApp(new Finalizada());

class Finalizada extends StatelessWidget{
  
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text("Compra Finalizada"),
              backgroundColor: Colors.orange,
              leading: new IconButton(
                icon: new Icon( Icons.arrow_back, color: Colors.white,          ),
                onPressed: () {
                  //Tal vez esto, al presionar el boton nos regresa a la pantalla de inicio y no a la anterior
                  //Maybe this, the button goes back to the main screen not the one before 
                   Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                },
               ),
            ),
            body: new Padding(
              padding: const EdgeInsets.all(20.0),
              child:new ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
                    Image.asset('images/comparfin.jpg',fit: BoxFit.fitWidth,),
                    new Padding(padding: const EdgeInsets.only(top: 40.0),),
                    Text("¡Compra Finalizada!",textAlign: TextAlign.center,),
                  ],
                ),
              ),
            );
      }
}