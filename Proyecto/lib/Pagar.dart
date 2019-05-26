import 'package:flutter/material.dart';


void main() => runApp(new Pagar());



class Pagar extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<Pagar> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _numtar;
  String _fecha;
  String _nombre;

  

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

      performLogin();

    }
  }

  void performLogin() {
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
                    new RaisedButton(
                      child: new Text(
                        "Pagar",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: _submit,
                    ),
                  ],
                ),
              ),
            ));
      }
}