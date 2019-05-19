import 'package:flutter/material.dart';
import 'Cajon.dart';
import 'Producto.dart';

void main() => runApp(new Categorias());

class Categorias extends StatelessWidget {

    
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text("Categorias"),
            ),
            drawer: Cajon(),
            body: ListView(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                Text("Categoria 1", textAlign: TextAlign.left,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                           child: Image.asset('images/camaro.png',width: 150.0,height: 100.0,),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro1.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro2.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro3.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro4.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro5.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro6.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                    ],
                  ),
                ),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                Text("Categoria 2", textAlign: TextAlign.left,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                           child: Image.asset('images/carro7.jpg',width: 150.0,height: 100.0,),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro8.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro9.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro10.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro11.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro12.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro13.jpeg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                    ],
                  ),
                ),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                Text("Categoria 3", textAlign: TextAlign.left,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                           child: Image.asset('images/carro14.jpg',width: 150.0,height: 100.0,),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro15.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro16.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro17.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro18.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro19.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro20.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                    ],
                  ),
                ),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                Text("Categoria 4", textAlign: TextAlign.left,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                           child: Image.asset('images/carro21.jpg',width: 150.0,height: 100.0,),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro22.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro23.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro24.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro25.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro26.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro27.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                    ],
                  ),
                ),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                Text("Categoria 5", textAlign: TextAlign.left,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                           child: Image.asset('images/carro28.jpg',width: 150.0,height: 100.0,),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro29.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro30.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro31.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro32.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro33.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                      GestureDetector(
                           child:  Image.asset('images/carro34.jpg',width: 150.0,/*height: 100.0,*/),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Producto()),);
                           },
                        ),
                    ],
                  ),
                ),
                new RaisedButton(
                      child: new Text(
                        "Regresar",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                ),
              ],
            ),
      );
    }
}