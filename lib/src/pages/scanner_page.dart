import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter QR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScannerPage(),
    );
  }
}

class ScannerPage extends StatefulWidget {
  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            " ESCÁNER DE CÓDIGO QR ",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            GestureDetector(
              child: Container(
                child: new Image.asset(
                  'assets/scan.jpg',
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.fill,
                ),
              ),
              onTap: () => scanQrCode(),
            ),
            GestureDetector(
              onTap: () => scanQrCode(),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          code,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 580, left: 20, right: 20),
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        minWidth: size.width,
                        height: 50.0,
                        onPressed: () => Navigator.pop(context),
                        color: Color(0xFFB40404),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  scanQrCode() async {
    try {
      final result = await FlutterBarcodeScanner.scanBarcode(
          "#004297", "Cancelar", true, ScanMode.QR);

      setState(() {
        code = result.toString();
      });
    } catch (e) {
      print(e);
    }
  }
}
