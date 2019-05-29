import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'Usuario.dart';

void main() => runApp(new Producto());


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
  String valor = '1'; 
  
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

      anadeCarro(nombreP,precioP, imagen); 
      Flushbar(
          title:  "¡Añadido!",
          message:  "Se añadio el producto al carrito",
          duration:  Duration(seconds: 2),
          aroundPadding: EdgeInsets.all(8),
          borderRadius: 8,
        )..show(context).then((r)=> Navigator.pop(context));
    }
  }

     void anadeCarro(String nombreP,int precioP,String imagen) async{
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