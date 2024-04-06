import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wslet/Core/const/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR ماسح',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QRScanner(title: 'Flutter Demo Home Page'),
    );
  }
}

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              width: 250,
              child: QRView(
                  key: _gLobalkey,
                  onQRViewCreated: qr
              ),
            ),
            Container(
              height: 100,width: 330,
              decoration: BoxDecoration(
              color: AppColors.c3,
              borderRadius: BorderRadius.circular(100),
            ),
              child: Center(
                child: (result !=null) ? Text('${result!.code}') : Text('ابدأ بلمسح'),
              ),
            )
          ],
        ),
      ),
    );
  }
}