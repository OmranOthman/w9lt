import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wslet/Screens/signup.dart';

import '../Core/const/app_assets.dart';

class Splash_Animated extends StatelessWidget {
  const Splash_Animated({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 200,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.topToBottom,
        splashTransition: SplashTransition.rotationTransition,
        splash:  Container(
          //radius: 90,
          child:Image(image:AssetImage(AppAssets.logo1
          ),
          ),
        ),
        nextScreen: const Signup(),

// we can use
        duration: 500,
//5000= 5 Second

//control the duration of the image , we can use
        animationDuration: const Duration(seconds: 3));
//small number : the duration will be speed
//large number : the duratiion will be slow);
  }
}