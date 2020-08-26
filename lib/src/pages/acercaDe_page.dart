import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
  const AcercaDe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Acerca de la App',
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height:  orientation == Orientation.portrait 
            ?MediaQuery.of(context).size.height
            :MediaQuery.of(context).size.height+80,
            
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width, 
                padding: EdgeInsets.only(top: 40.0,left: 20.0),
                child: orientation == Orientation.portrait
                        ? Text(
                            'SICAM',
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.start,

                          )
                        : Text(
                            'SICAM /    Sistemas de Cargas Máximas\n\nSICAM le ayudará a saber si tiene permitido acceder a un aula o edificio '
                            ' del centro universitario, de acuerdo a los lineamientos de salud establecidos, evitando '
                            ' las multitudes dentro de un área.',
                            textAlign: TextAlign.justify,
                          )
              ),
              SizedBox(),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0),
                child: orientation == Orientation.portrait
                        ? Text(
                            'Sistemas de Cargas Máximas\n\nSICAM le ayudará a saber si tiene permitido acceder a un aula o edificio '
                            ' del centro universitario, de acuerdo a los lineamientos de salud establecidos, evitando '
                            ' las multitudes dentro de un área.')
                        : Text('')
              ),
              Container(
                padding: EdgeInsets.only(top: 30.0,),
                width: 200.0,
                height: 150,
                child: Center(
                  child:Image.asset(
                    'assets/escudo.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ), 
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0,),
                child: Text(
                      'Contacto\n\nTel: +52(000)0000000\nE-mail: valles@valles.udg.mx',
                      textAlign: TextAlign.center,
                ),
              ),
              Container(
                    child: orientation == Orientation.portrait
                        ? Center(
                            child: Text(
                              'Coordinación de Tecnologías para el Aprendizaje\n'
                              'Área de Generación de Contenido Educativo\n'
                              'Centro Universitario de los Valles\n 2020',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13),
                            ),
                          )
                        : Text(
                            'Coordinación de Tecnologías para el Aprendizaje\n'
                            'Área de Generación de Contenido Educativo\n'
                            'Centro Universitario de los Valles\n 2020',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                        )
              ),
            ],
          ),
        ),
      ),
    );
  }
}