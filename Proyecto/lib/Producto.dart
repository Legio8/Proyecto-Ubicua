import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'Usuario.dart';

void main() => runApp(new Producto());

//Archivo que contiene la pantalla donde se muestra la imagen del producto, el precio, la cantidad que puede ingresar el usuario y añadir a carrito
//Recibe un Documentsnapshot que es el item a mostrar y el usuario para saber a que carrito se añade
//This file contains the Product screen where it shows the image of the product, price, the number o products the user wants, and add to cart button
//Receives a Documentsnapshot that is the item to display and the user so we know wich cart use
class Producto extends StatefulWidget {
  Producto({Key key, this.item, this.usuario}) : super(key: key);
  final DocumentSnapshot item;
  final Usuario usuario;
  @override
  _FormPageState createState() => new _FormPageState(item: item,usuario: usuario);
}

class _FormPageState extends State<Producto> {
  _FormPageState({Key key, this.item, this.usuario});
  DocumentSnapshot item;
  Usuario usuario;
  //Variable to know how many the user wants
  String valor = '1'; //Variable para saber la cantidad que quiere el usuario
  
  
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit(String nombreP,int precioP,String imagen) {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      //Llamada a la funcion para añadir a carrito
      //Call to function to add to cart
      anadeCarro(nombreP,precioP, imagen); 
      //Flushbar para mostrar que se añadio con exito y despues regresa a la pantalla de menu
      //Flushbar to display a message that it's added to the cart then returns to the menu screen
      Flushbar(
          title:  "¡Añadido!",
          message:  "Se añadio el producto al carrito",
          duration:  Duration(seconds: 2),
          aroundPadding: EdgeInsets.all(8),
          borderRadius: 8,
        )..show(context).then((r)=> Navigator.pop(context));
    }
  }
      //Funcion que añade el item al carrito en la BD de firebase 
      //Function to add the item to the cart in the firebase DB.
     void anadeCarro(String nombreP,int precioP,String imagen) async{
       //Simplemente se añade a la subcoleccion PLatillos y se agregan los datos
       //It just adds the data to the subcollection Platillos
      await Firestore.instance.collection('Carrito').document(usuario.user.uid).collection("Platillos").document().setData({'Nombre': nombreP, 'Precio': precioP, 'Cantidad':valor,'imagen':imagen});
    }
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text('Producto'),
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
              child: 
              new Form(
                key: formKey,
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
                             child: Image.asset(item['imagen'],width: 150.0,height: 120.0,),
                             ),
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_) {
                               return DetailScreen(item: item);
                             }));
                           },
                         ),
                         new Padding(padding: const EdgeInsets.only(right: 15.0),),
                         Column(children: <Widget>[
                           new Padding(padding: const EdgeInsets.only(top: 10.0),),
                           Text("Precio: \$"+item['Precio'].toString()),
                           new Container( 
                             width: 90.0,
                             child: new TextFormField(
                            decoration: new InputDecoration(labelText: "Cantidad",),
                            validator: (canti) {
                              if(canti.isEmpty){
                                return "No dejar vacio";
                              }
                            },
                            onSaved: (val) => valor = val,
                            keyboardType: TextInputType.phone,
                            maxLength: 1,
                            initialValue: '1',
                            maxLines: 1,
                           ),
                           ),
                         ],
                        )
                       ],
                      ),
                      new Padding(padding: const EdgeInsets.only(top: 20.0),),
                       Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text('Descripcion:\n'+item['Descripcion'],),
                          ),
                        ),
                      new Padding(padding: const EdgeInsets.only(top: 20.0),),
                      new RaisedButton(
                             child: new Text("Añadir a carrito",style: new TextStyle(color: Colors.white),),
                              color: Colors.blue,
                              onPressed: (){
                                _submit(item['Nombre'], item['Precio'],item['imagen']);                                
                              },
                           ),
                     ],
                   ),
                  ],
                ),
              ),
            )
        );
      }
}
class DetailScreen extends StatelessWidget {
DetailScreen({Key key, this.item}) : super(key: key);
final DocumentSnapshot item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset(item['imagen'],fit: BoxFit.contain,)
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}