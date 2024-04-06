// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, unused_local_variable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../Core/const/app_assets.dart';
import 'package:wslet/Screens/signup.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
  @override
  void initState() {
    Timer(Duration(seconds: 4),
    () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>Signup() ,)),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(body:Center(
      child:
      Image(image:AssetImage(AppAssets.logo1
        ),
       ),
      )
    );
  }
}