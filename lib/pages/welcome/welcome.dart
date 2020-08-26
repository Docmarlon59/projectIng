import 'package:flutter/material.dart';

import 'package:cargas_maximas_f/pages/login/login.dart';
import 'package:cargas_maximas_f/pages/welcome/custom_widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                child: ImageWelcome(
                  imgHeight: MediaQuery.of(context).size.height * 0.8,
                )),
            Positioned(
                bottom: 5,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: [
                        Text(
                          'Bienvenido/a al',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          'Sistema de Cargas Máximas (SICAM)',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          btnText: 'Continuar',
                          onBntPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return Login();
                                }));
                          },
                        )
                      ],
                    )))
          ],
        ));
  }
}
