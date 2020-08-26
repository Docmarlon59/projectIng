import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InformacionEscaneoPage extends StatefulWidget {
  @override
  _InformacionEscaneoPageState createState() => _InformacionEscaneoPageState();
}

class _InformacionEscaneoPageState extends State<InformacionEscaneoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Información de escaneo',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.dehaze,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                _tarjetaDatos('\nCódigo, Nombre y Carrera',
                    '219284328\nLeonel Castillo Castñeda\nTecnologías de la Informacion\n'),
                _tarjetaDatos('\nProfesor, Materia y Aula',
                    'Erick Jorge Roberto Guerrero Muñoz\nDesarollo en Android\nCITA 02\n'),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 1.0,
                  shrinkWrap: true,
                  childAspectRatio: 2.0,
                  children: [
                    _tarjetasHoraCupo('08:05 AM', 'Hora de entrada',
                        Colors.grey[300], Colors.black87),
                    _tarjetasHoraCupo('08:05 AM', 'Hora de entrada',
                        Colors.grey[600], Colors.white),
                    _tarjetasHoraCupo(
                        '04', 'Cupo actual', Colors.white, Colors.black87),
                    _tarjetasHoraCupo(
                        '15', 'Cupo maximo', Colors.white, Colors.black87)
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, left: 110.0, right: 110.0),
                  child: FlatButton(
                      onPressed: () {},
                      child: Text('\nREGISTRAR SALIDA\n',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      color: Colors.red,
                      splashColor: Colors.redAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                )
              ],
            )));
  }

  Widget _tarjetaDatos(
    String titulo,
    String datos,
  ) {
    return Card(
      shadowColor: Colors.black,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.grey)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(titulo),
          ),
          Divider(
            height: 2.0,
            thickness: 1.0,
            indent: 20.0,
            endIndent: 20.0,
          ),
          ListTile(
            subtitle: Text(datos),
          )
        ],
      ),
    );
  }

  Widget _tarjetasHoraCupo(
      String dato1, String dato2, Color color, Color color2) {
    return Card(
      color: color,
      shadowColor: Colors.black,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text(
              dato1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: color2),
            ),
            subtitle: Text(
              dato2,
              textAlign: TextAlign.center,
              style: TextStyle(color: color2),
            ),
          ),
        ],
      ),
    );
  }
}

// children: List.generate(4, (index) {
//                     return _tarjetasHoraCupo();
//                   }),
