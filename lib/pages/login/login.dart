import 'package:flutter/material.dart';

import 'package:cargas_maximas_f/pages/home/home_page.dart';
import 'package:cargas_maximas_f/pages/welcome/custom_widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final codigoController = TextEditingController();
  final passwordController = TextEditingController();
  String message = ' ';

  @override
  void dispose() {
    codigoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.1,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  Image.asset(
                    'assets/images/udg.jpg',
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text('Inicia sesion con tus credenciales de SIIAU',
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)),
                                  labelText: 'Código',
                                  labelStyle: TextStyle(fontSize: 20)),
                              controller: codigoController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'El código es necesario';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)),
                                  labelText: 'NIP',
                                  labelStyle: TextStyle(fontSize: 20)),
                              controller: passwordController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'El NIP es obligatorio';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30),
                            CustomButton(
                              onBntPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  var codigo = codigoController.text;
                                  var password = passwordController.text;
                                  setState(() {
                                    message = 'Espere...';
                                  });
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return MyHomePage(
                                            );
                                          }));
                                    } else {
                                      setState(() {
                                        message = 'Credenciales incorrectas';
                                      });
                                    }
                              },
                              btnText: 'INICIAR SESIÓN',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(message)
                          ],
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
