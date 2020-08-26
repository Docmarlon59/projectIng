import 'dart:convert';
import 'package:cargas_maximas_f/src/models/datos_alumno.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AsistentesPage extends StatefulWidget {
  @override
  _AsistentesPageState createState() => _AsistentesPageState();
}

class _AsistentesPageState extends State<AsistentesPage> {
  bool presente = true;
  bool cargando = true;
  Color check = Colors.red[800];
  final String url = "http://148.202.89.11/d_alum/api/alumno/219284328";
  DatosAlumno datosAlumno;
  Future<String> getData() async {
    var respuesta = await http.get(url);
    setState(() {
      datosAlumno = datosAlumnoFromJson(respuesta.body);
      cargando = false;
    });
    return 'Exito!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Asistentes - {}',
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
        body: _cargandoDatos(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.only(
                top: 20.0, left: 125.0, right: 125.0, bottom: 20.0),
            child: FlatButton(
              onPressed: () {
                _mostrarAlert(context);
              },
              color: Colors.red[800],
              child: Text('\nALERTA\n', style: TextStyle(color: Colors.white)),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Widget _cargandoDatos() {
    if (cargando) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()],
            ),
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '\nAULA: CITA2   ',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  indent: 20.0,
                  endIndent: 20.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  title: Text(
                    datosAlumno.nombre.toLowerCase() +
                        ' ' +
                        datosAlumno.apaterno.toLowerCase(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                  subtitle: Text(datosAlumno.codigo +
                      "\n" +
                      datosAlumno.datosPersonales.carrera.carrera
                          .toLowerCase()),
                  trailing: FlatButton(
                    color: check,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    onPressed: () => {
                      setState(() {
                        presente = !presente;
                        if (check == Colors.red[800]) {
                          check = Colors.green;
                        } else {
                          check = Colors.red[800];
                        }
                      })
                    },
                    child: Text(
                      presente ? "PRESENTE" : '✓',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}

void _mostrarAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white70, Colors.white70, Colors.white54],
                  stops: [0.5, 0.5, 0.8],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Atención!!!'),
            content: Container(
              child:
                  Text('Se emitirá una alerta, en dado caso de que algún alumno'
                      ' haya incumplido alguna métrica de seguridad,'
                      'como desobedecer el limite máximo de personas'
                      ' en un aula.\n\nTambién de notificar si alguna'
                      ' persona dentro del aula/área puede tener los'
                      ' sintomas de la enfermedad.!!!'),
            ),
            actions: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  color: Color(0xFF58595B),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              MaterialButton(
                color: Color(0xFFB40404),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Text('Entendido, Continuar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      });
}
