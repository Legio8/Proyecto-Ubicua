import 'package:flutter/material.dart';



void main() => runApp(new Carrito());

class Carrito extends StatelessWidget{

    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text("Carrito"),
              backgroundColor: Colors.orange,
              leading: new IconButton(
                icon: new Icon( Icons.arrow_back, color: Colors.white,          ),
                onPressed: () {
                   Navigator.pop(context);
                },
               ),
            ),
            body: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
                   Table(
                     defaultColumnWidth: IntrinsicColumnWidth(),
                     border: TableBorder.all(width: 1.0, color: Colors.black),
                     children: [
                       TableRow( 
                         children: [ TableCell(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               Text("     Producto",),
                               Text("   Cantidad",),
                               Text(" Sub Total",),
                             ],
                           ),
                         )
                        ]
                       ),
                       TableRow(
                         children: [ 
                           TableCell(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: <Widget>[
                                 Image.asset('images/imagen2.jpg',width: 90.0,height: 50.0,),
                                 Text("2",),
                                 Text("500,000",),
                             ],
                           ),
                          )
                         ]
                       ),
                       TableRow(
                         children: [ 
                           TableCell(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: <Widget>[
                                 Image.asset('images/imagen3.jpg',width: 90.0,height: 50.0,),
                                 Text("1",),
                                 Text("300,000",),
                             ],
                           ),
                          )
                         ]
                       ),
                       TableRow(
                         children: [ 
                           TableCell(
                             verticalAlignment: TableCellVerticalAlignment.middle,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: <Widget>[
                                 Image.asset('images/imagen4.jpg',width: 90.0,height: 50.0,),
                                 Text("1",),
                                 Text("400,000",),
                             ],
                           ),
                          )
                         ]
                       ),
                     ],
                     ),
                     new Padding(padding: const EdgeInsets.only(top: 60.0),),
                     Text("Total: ", textAlign: TextAlign.right,),
                     Text("1,200,000", textAlign: TextAlign.right, style: TextStyle(color: Colors.red),),
                     new Padding(padding: const EdgeInsets.only(top: 40.0),),
                     new RaisedButton(
                       child: new Text("Registrar Tarjeta",style: new TextStyle(color: Colors.white),),
                       color: Colors.blue,
                       onPressed: (){
                         Navigator.of(context).pushNamed('/pagar');//Navigator.push(context, MaterialPageRoute(builder: (context) => Pagar()),);
                       },
                     ),
                  ],
                ),
            )
        );
      }
}