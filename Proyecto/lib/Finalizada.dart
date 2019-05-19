import 'package:flutter/material.dart';

void main() => runApp(new Finalizada());

class Finalizada extends StatelessWidget{
  
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text("Compra Finalizada"),
              leading: new IconButton(
                icon: new Icon( Icons.arrow_back, color: Colors.white,          ),
                onPressed: () {
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