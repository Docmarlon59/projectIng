import 'package:flutter/material.dart';
import 'package:cargas_maximas_f/pages/login/login.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Inicio',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "home");
            },
          ),
          _createDrawerItem(
            icon: Icons.calendar_today,
            text: 'Horario',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "schedule");
            },
          ),
          _createDrawerItem(
            icon: Icons.camera_alt,
            text: 'Escaner',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "scan");
            },
          ),
          _createDrawerItem(
            icon: Icons.note,
            text: 'Escaneo reciente',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "recently");
            },
          ),
          Divider(),
          _createDrawerItem(icon: Icons.list, text: 'Asistencias'),
          Divider(),
          _createDrawerItem(icon: Icons.info, text: 'Acerca de la APP'),
          //SOLO PRUEBA PARA ABRIR EL TIMER DESDE EL DRAWER
          Divider(),
          _createDrawerItem(icon: Icons.info, text: 'TIMER', onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, "timer");
          }),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
                      (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/cuvalles_entry2.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 60.0,
              left: 16.0,
              child: Text('Nombre del usuario',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ))),
          Positioned(
              bottom: 40.0,
              left: 16.0,
              child: Text('apellido',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ))),
          Positioned(
              bottom: 15.0,
              left: 16.0,
              child: Text('Codigo del usuario',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
