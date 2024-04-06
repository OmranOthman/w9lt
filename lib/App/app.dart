import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wslet/Screens/Otp.dart';
import 'package:wslet/Screens/chooseCompany.dart';
import 'package:wslet/Screens/hiddenMenu.dart';
import 'package:wslet/Screens/home.dart';
import 'package:wslet/Screens/infoCompany.dart';

import 'package:wslet/Screens/notification.dart';
import 'package:wslet/Screens/profile.dart';
import 'package:wslet/Screens/qr.dart';
import 'package:wslet/Screens/qrScanner.dart';
import 'package:wslet/Screens/routine.dart';
import 'package:wslet/Screens/login.dart';
import 'package:wslet/Screens/signup.dart';
import 'package:wslet/Screens/splash_Animated.dart';
import 'package:wslet/Screens/supervisor.dart';
import 'package:wslet/Screens/welcome.dart';
import '../Screens/changePassword.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,


          home: Welcome(),
        );
      },
    );
  }
}