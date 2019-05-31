import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Usuario.dart';


void main() => runApp(new Pagar());
//Archivo que contiene la pantalla de pagar donde se registra una tarjeta, un nombre y la hora en la que pasara por la comida
//Recive el usuario que va a pagar y el total del pago
//File that contains the pay screen where it shows a credit card register, a name & the time the user picks up the food
//Receives the user & the total of the payment

class Pagar extends StatefulWidget {
  Pagar({Key key, this.usuario, this.total}) : super(key: key);
  final Usuario usuario;
  final int total;
  @override
  _FormPageState createState() => new _FormPageState(usuario: usuario, total:total );
}

class _FormPageState extends State<Pagar> {
  _FormPageState({Key key,this.usuario,this.total});
  Usuario usuario;
  int total;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _numtar;
  String _fecha;
  String _nombre;
  String hora;

  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      //Despues de que se guarda la form se llama al metodo que tiene el metodo añade orden
      //Inside the performlogin method is the add order method
      performLogin(_nombre,total,hora);

    }
  }

  //Metodo que añade la orden y copia los items del carrito a la orden
  //Function that adds the order and copies the items in the cart to that order
  void anadeOrden(String nombreC,int total,String hora,) async{
      //Variable para obtener la instancia de la colleccion de platillos en carrito
      //Variable to obtain the instance of the platillos collection in cart
      CollectionReference f = Firestore.instance.collection('Carrito').document(usuario.user.uid).collection("Platillos");
      //Variable para obtener todos los documentos en platillos
      //Variable to obtain the documents in the cart
      QuerySnapshot a = await f.getDocuments();
      //Para cada elemnto se copia a la coleccion de orden en ordenes
      //For each elemnt we add it to the order subcollection in orders
      a.documents.forEach((document) async{
        await Firestore.instance.collection('Ordenes').document(usuario.user.uid).collection("Orden").document().setData({'Nombre': document['Nombre'], 'Cantidad':document['Cantidad']});
      });
      //En la misma orden se añade el nombre, hora, total y si esta lista la orden o no (De esta forma solo se agrega 1 orden por usuario ¿Arreglarlo?)
      //In the same order we add the name, hour, total & if the order is ready or not (This way only allows 1 order per user ¿Fix it?)
      await Firestore.instance.collection('Ordenes').document(usuario.user.uid).setData({'Nombre': nombreC, 'Total': total, 'Hora':hora, 'Lista': 'No'});
      //Se borran todos los elementos en carrito para que quede vacio y se pidan nuevos
      //Delete all teh items in the cart so is empty and we can add new ones
      a.documents.forEach((documento) async{
        documento.reference.delete();
      });
    }

//Funcion que llama a la funcion añade orden y se va a la pantalla de compra finalizada
//Function that calls the anadeorden function then goes to the finished screen
  void performLogin(String nombreC,int total,String hora,) {
    anadeOrden(nombreC,total,hora);
    Navigator.of(context).pushNamed('/finalizada');
   }
    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            key: scaffoldKey,
            appBar: new AppBar(
              title: new Text("Registro Tarjeta"),
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
              child: new Form(
                key: formKey,
                child: new ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
                    Image.asset('images/tarjeta.png',fit: BoxFit.fitWidth,),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "No. de Tarjeta",hintText: 'Su numero de tarjeta',),
                      validator: (numtar) {
                        if( numtar == "" || numtar.length < 16)
                        {
                          return "Numero no valido";
                        }
                      },
                      onSaved: (val) => _numtar = val,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Valida hasta",hintText: 'Formato: mes/año(11/21)',),
                      validator: (year) {
                        var anio = year.split("/");
                        var fecha = DateTime.now();
                        if( int.tryParse("20"+anio[1]) < fecha.year || int.tryParse(anio[0]) < fecha.month){
                          return "Fecha no valida";
                        }
                      },
                      onSaved: (val) => _fecha = val,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Nombre", hintText: 'Su nombre',),
                      validator: (nombre) {
                        if(nombre.contains(new RegExp(r'[0-9]')) || nombre == ""){
                          return "Nombre Invalido";
                        }
                      },
                      onSaved: (val) => _nombre = val,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: "Hora para recoger", hintText: 'La hora en la que pasara por su comida (10 am a 4 pm)',),
                      validator: (hr) {
                        if(hr.contains(new RegExp(r'[a-z]')) || hr == ""){
                          return "Hora invalida";
                        }
                      },
                      onSaved: (val) => hora = val,
                      keyboardType: TextInputType.number,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new RaisedButton(
                      child: new Text(
                        "Pagar",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: (){
                        _submit();
                      }
                    ),
                  ],
                ),
              ),
            ));
      }
}