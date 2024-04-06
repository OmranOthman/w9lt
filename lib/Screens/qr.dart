import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QR extends StatefulWidget {
  final String qrData;
  const QR({Key? key,required this.qrData}) : super(key: key);

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImageView(
              data: widget.qrData,
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: 300.0,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          // Container(
          //   width: 300.0,
          //   child: TextField(
          //     onChanged: (value) {
          //       setState(() {
          //         data = value;
          //       });
          //     },
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //     decoration: InputDecoration(
          //       hintText: "Type the Data",
          //       filled: true,
          //       fillColor: AppStyle.textInputColor,
          //       border: InputBorder.none,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 24.0,
          ),
          // RawMaterialButton(
          //   onPressed: () {},
          //   fillColor: AppStyle.accentColor,
          //   shape: StadiumBorder(),
          //   padding: EdgeInsets.symmetric(
          //     horizontal: 36.0,
          //     vertical: 16.0,
          //   ),
          //   child: Text(
          //     "QR انشاء",
          //   ),
          // )
        ],
      ),
    );
  }
}







//We will set the app style colors
class AppStyle {
  static Color primaryColor = Color(0xFF222222);
  static Color textInputColor = Color(0xFF404040);
  static Color accentColor = Color(0xFF4c90d2);
}