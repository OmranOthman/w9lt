import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wslet/Core/const/app_colors.dart';
import 'package:wslet/Screens/Otp.dart';
import 'package:wslet/Screens/home.dart';
import 'package:http/http.dart';
import 'package:wslet/Screens/signup.dart';
import '../Core/const/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static final String path = "lib/src/pages/login/login7.dart";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var passwordController = TextEditingController();
  var numberController = TextEditingController();
  GlobalKey<FormState> key =GlobalKey();
  String number ='';
  String password ='';
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c4,
      body: Form(
        key: key,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 295.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColors.c4, AppColors.c3])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColors.c3, AppColors.c2])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.h,
                        ),
                        Image(
                          image: AssetImage(
                            AppAssets.logo1
                          ),
                          height: 120.h,
                        ),

                        Text(
                          'أهلاً بعودتك',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 30.sp),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [AppColors.c2, AppColors.c1])),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 35).copyWith(bottom: 5),
              child: TextFormField(
                onSaved: ((newValue){
                  number=newValue!;
                }),
                validator: (value){
                  if(value!.isEmpty){
                    return "هذا الحقل فارغ";}
                  else return null;
                },
                textInputAction: TextInputAction.next,
                maxLength: 10,
                textAlign: TextAlign.end,
                //controller: numberController,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.5.sp,
                ),
                decoration: InputDecoration(
                  suffixIconConstraints: BoxConstraints(minWidth: 45),
                  suffixIcon: Icon(
                    Icons.call,
                    color: AppColors.c1,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  hintText: 'ادخل الرقم',
                  hintStyle:
                  TextStyle(color: Colors.black54, fontSize: 14.5.sp),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black)),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black45)),

                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 35).copyWith(bottom: 5),
              child: TextFormField(
                onSaved: ((newValue){
                  password=newValue!;
                }),
                validator: (value){
                  if(value!.isEmpty){
                    return "هذا الحقل فارغ";}
                  else return null;
                },
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.end,
                //controller: numberController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isPasswordVisible ? false : true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.5.sp,
                ),
                decoration: InputDecoration(
                  suffixIconConstraints: BoxConstraints(minWidth: 45),
                  prefixIconConstraints:
                  BoxConstraints(minWidth: 45, maxWidth: 46),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.c2,
                      size: 22,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.lock,
                    color: AppColors.c1,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  hintText: 'ادخل كلمة السر',
                  hintStyle:
                  TextStyle(color: Colors.black54, fontSize: 14.5.sp),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black)),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black45)),

                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red)),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: AppColors.c1),
                  // ignore: deprecated_member_use
                  child: MaterialButton(
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                   ),
                    onPressed: () async {
                      if(key.currentState!.validate()){
                        if (key.currentState!.validate()){
                          key.currentState!.save();
                          print(number);
                          print(password);
                        }
                       bool res = await _httpGet({'number':number,'password':password});
                        if(res){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),));}
                      }
                    },
                 ),
               )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp(),));
                  },
                  child: Text('ارسال رمز التحقق',
                      style: TextStyle(
                          color: AppColors.c1,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          decoration: TextDecoration.underline)),

                ),
                Text(
                  'هل نسيت كلمة السر؟ ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(
              height:20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup(),));
                  },
                    child: Text('انشاء حساب',
                        style: TextStyle(
                            color: AppColors.c1,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            decoration: TextDecoration.underline)),

                ),
                Text(
                  'لا تملك حساب؟ ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


Future <bool> _httpGet(Map<String, String> data) async {
  var jsonData = jsonEncode(data);
  var response =
  await post(Uri.parse("http://192.168.43.22:8000/user/"),body: jsonData);
  if (response.statusCode != 200) {
    throw Exception("API error");
  }
  else{
    print('test----------------------------------');
    return jsonDecode(response.body)['response'] ;
  }
}
