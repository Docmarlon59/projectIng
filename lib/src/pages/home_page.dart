
import 'package:cargas_maximas_f/src/pages/horarios_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              '¿Qué hacer?',
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(
                  Icons.dehaze,
                  color: Color(0xFF58595B),
                ),
                onPressed: () async {},
              ),
            ),
          ],
        ),
        body: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (widget, animation) {
            return ScaleTransition(
              scale: animation,
              child: widget,
            );
          },
          child: orientation == Orientation.portrait
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      //sacner
                      tarjetasInfo('assets/esc.jpeg', 'Escanear'),
                      //consultar horario
                      tarjetasInfo2('assets/agr.jpeg', 'Consultar Horario'),
                      //escaneo reciente
                      tarjetasInfo3('assets/cons.jpeg', 'Escaneo Reciente')
                    ],
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          tarjetasInfo('assets/esc.jpeg', 'Escanear'),
                          //consultar horario
                          tarjetasInfo2('assets/agr.jpeg', 'Consultar Horario'),
                          //escaneo reciente
                          tarjetasInfo3('assets/cons.jpeg', 'Escaneo Reciente')
                        ],
                      ),
                    );
                  }),
        ));
  }

  Widget tarjetasInfo(String asset, String texto) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
              image: ExactAssetImage(asset), fit: BoxFit.cover)),
      child: FlatButton(
        onPressed: () {
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 0),
          child: ListTile(
            title: Text(
              '$texto',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic),
            ),
            subtitle: Text(
              'Escanear códigos QR',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tarjetasInfoPortrait(String asset, String texto) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            image: DecorationImage(
                image: ExactAssetImage(asset), fit: BoxFit.cover)),
        child: FlatButton(
          onPressed: () {
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 0),
            child: ListTile(
              title: Text(
                '$texto',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic),
              ),
              subtitle: Text(
                'Escanear códigos QR',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tarjetasInfo2(String asset, String texto) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
              image: ExactAssetImage(asset), fit: BoxFit.cover)),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Horarios()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: ListTile(
            title: Text(
              '$texto',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic),
            ),
            subtitle: Text(
              'Mi horario',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tarjetasInfo3(String asset, String texto) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
              image: ExactAssetImage(asset), fit: BoxFit.cover)),
      child: FlatButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: ListTile(
            title: Text(
              '$texto',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic),
            ),
            subtitle: Text(
              'Información sobre escaneo reciente',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
