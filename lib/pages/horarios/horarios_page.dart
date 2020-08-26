import 'package:cargas_maximas_f/pages/drawer/drawer.dart';
import 'package:cargas_maximas_f/src/models/materia.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Horarios extends StatefulWidget {
  const Horarios({Key key}) : super(key: key);

  @override
  _HorariosState createState() => _HorariosState();
}

class _HorariosState extends State<Horarios> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        endDrawer: AppDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Horario',
              style: TextStyle(color: Colors.black),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Color(0xFFB40404),
            labelColor: Color(0xFFB40404),
            indicatorWeight: 5,
            unselectedLabelColor: Color(0xFFB40404),
            tabs: [
              Tab(text: 'L'),
              Tab(text: 'M'),
              Tab(text: 'I'),
              Tab(text: 'J'),
              Tab(text: 'V'),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black,
        ),
        body: TabBarView(
          children: [
            Dias(),
            Dias(),
            Dias(),
            Dias(),
            Dias(),
          ],
        ),
      ),
    );
  }
}

class Dias extends StatefulWidget {
  @override
  _DiasState createState() => _DiasState();
}

class _DiasState extends State<Dias> {
  List<Materia> _materias = List<Materia>();

  Future<List<Materia>> fetchMateria() async {
    var url = "http://148.202.89.11/encuesta/api/materias.php?codigo=219737144";
    var response = await http.get(url);

    var materias = List<Materia>();

    if (response.statusCode == 200) {
      var materiasjson = json.decode(response.body);
      for (var materia in materiasjson) {
        materias.add(Materia.fromJson(materia));
      }
    }
    return materias;
  }

  @override
  void initState() {
    fetchMateria().then((value) {
      setState(() {
        _materias.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: orientation == Orientation.portrait
          ? ListView.builder(
              itemCount: _materias.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Hora inicia - Hora final"),
                              Divider(
                                height: 10,
                              ),
                              Text(_materias[index].nombre_materia,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(_materias[index].nombre_profesor,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 15)),
                              Divider(height: 10.0),
                              Text(
                                  "Aula: Favor de revisar la planeación que te proporcionó tu profesor.",
                                  style:
                                      TextStyle(color: Colors.grey.shade700)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: _materias.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text("Hora inicia - Hora final"),
                              Divider(
                                height: 10,
                              ),
                              Text(_materias[index].nombre_materia,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(_materias[index].nombre_profesor,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 15)),
                              Divider(height: 10.0),
                              Text(
                                  "Aula: Favor de revisar la planeación que te proporcionó tu profesor.",
                                  style:
                                      TextStyle(color: Colors.grey.shade700)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
