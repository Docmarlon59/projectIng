import 'package:cargas_maximas_f/src/pages/tiempo_restante.dart';
import 'package:flutter/material.dart';

import 'package:cargas_maximas_f/pages/horarios/horarios_page.dart';
import 'package:cargas_maximas_f/pages/recently_scan/informacion_escaneo.dart';
import 'package:cargas_maximas_f/pages/scanner/scan_page.dart';
import 'package:cargas_maximas_f/pages/home/home_page.dart';
import 'package:cargas_maximas_f/pages/login/login.dart';
import 'package:cargas_maximas_f/pages/welcome/welcome.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => MyHomePage(),
    'welcome': (BuildContext context) => WelcomePage(),
    'login': (BuildContext context) => Login(),
    'schedule': (BuildContext context) => Horarios(),
    'scan': (BuildContext context) => ScanPage(),
    'recently': (BuildContext context) => InformacionEscaneoPage(),

    'timer': (BuildContext context) => TiempoRestante(),
  };
}