import 'package:flutter/material.dart';

class TiempoRestante extends StatefulWidget {
  @override
  _TiempoRestanteState createState() => _TiempoRestanteState();
}

class _TiempoRestanteState extends State<TiempoRestante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Tiempo Restante',
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
                _tarjetaDatos('\nProfesor, Materia y Aula',
                    'Erick Jorge Roberto Guerrero Muñoz\nDesarollo en Android\nCITA 02\n'),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 1.0,
                  shrinkWrap: true,
                  childAspectRatio: 2.0,
                  children: [
                    _tarjetasHoraCupo(
                        '04', 'Cupo actual', Colors.white, Colors.black87),
                    _tarjetasHoraCupo(
                        '15', 'Cupo maximo', Colors.white, Colors.black87)
                  ],
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red[800],
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(1.0),
                                BlendMode.dstATop),
                            image: new NetworkImage(
                                'https://wallpapertag.com/wallpaper/full/b/4/f/121595-red-gradient-background-1920x1080-for-computer.jpg'))),
                    child: Card(
                      color: Colors.transparent,
                      shadowColor: Colors.black,
                      elevation: 10.0,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('\n5:00 min',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40.0)),
                          ),
                          ListTile(
                            subtitle: Text('Tiempo para llegar al aula\n',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            trailing: Text('CITA 2',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.only(
                top: 20.0, left: 80.0, right: 80.0, bottom: 20.0),
            child: FlatButton(
              onPressed: () {},
              color: Colors.red[800],
              child: Text('\nESCANEAR ENTRADA AL AULA\n',
                  style: TextStyle(color: Colors.white)),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
            ),
          ),
        ));
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
              style: TextStyle(
                color: color2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
