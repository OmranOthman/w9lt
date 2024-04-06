// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:wslet/Core/const/app_assets.dart';
import 'package:wslet/Screens/Otp.dart';
import 'package:wslet/Screens/login.dart';
import 'package:wslet/Core/const/app_colors.dart';
import 'package:wslet/components/components.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var fullnameController = TextEditingController();
  var numberController = TextEditingController();
  var numberEmergencyController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordResetController = TextEditingController();
  bool maleSelected = false;
  bool femaleSelected = false;
  bool isPasswordVisible = false;
  GlobalKey<FormState> key = GlobalKey();
  bool isConfirmPasswordVisible = false;
  String? password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.c4,
        padding: EdgeInsets.only(bottom: 0),
        child: Column(
          children: <Widget>[
            HeaderContainer("أهلاً بك"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    textInputSignup(
                        controller: fullnameController,
                        hint: "الاسم الكامل بللغة العربية",
                        icon: Icons.person,
                        keyboardType: TextInputType.name),
                    textInputSignup(
                        controller: numberController,
                        hint: "ادخل الرقم",
                        icon: Icons.call,
                        keyboardType: TextInputType.phone),
                    textInputSignup(
                        controller: numberEmergencyController,
                        hint: "ادخل رقم الطوارئ",
                        icon: Icons.call,
                        keyboardType: TextInputType.phone),
                    textInputPasswordSignup(
                      controller: passwordController,
                      hint: "كلمة السر",
                    ),
                    textInputPasswordSignup(
                      controller: passwordResetController,
                      hint: "تأكيد كلمة السر",

                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              maleSelected = true;
                              femaleSelected = false;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 20.h,
                                  width: 20.w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: maleSelected
                                      ? Container(
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black),
                                        )
                                      : SizedBox(
                                          height: 30.h,
                                        )),
                              Text('ذكر',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.5.sp))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              femaleSelected = true;
                              maleSelected = false;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 20.h,
                                  width: 20.w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: femaleSelected
                                      ? Container(
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black),
                                        )
                                      : SizedBox()),
                              Text('أنثى',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.5.sp))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: ButtonWidget(
                        btnText: "إنشاء حساب",
                        onClick: () async {
                          if (key.currentState!.validate()) {
                            if (key.currentState!.validate()) {
                              key.currentState!.save();
                              print(fullnameController.value);
                              print(password);
                              if (passwordResetController.text ==
                                  passwordResetController.text) {
                                bool res = await _httpGet({
                                  'name': fullnameController.text,
                                  'number': numberController.text,
                                  'numberEmergency':
                                      numberEmergencyController.text,
                                  'password': passwordResetController.text,
                                  'passwordReset':
                                      passwordResetController.text,
                                });
                                if (res) {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => Otp(),
                                  ));
                                }
                              }
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                          },
                          child: Text('تسجبل الدخول',
                              style: TextStyle(
                                  color: AppColors.c1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  decoration: TextDecoration.underline)),
                        ),
                        Text(
                          '  هل تملك حساب؟ ',
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
            ),
            // SizedBox(
            //   height: 40.h,
            // ),
          ],
        ),
      ),
    );
  }
  Widget textInputPasswordSignup ({controller, hint,}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: AppColors.c3,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "هذا الحقل فارغ";
          } else
            return null;
        },
        controller: controller,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.end,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isConfirmPasswordVisible ? false : true,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Icon(Icons.lock),
          prefixIcon: GestureDetector(
            onTap:(){ setState(() {
              isConfirmPasswordVisible = !isConfirmPasswordVisible;
            });},
            child: Icon(
              isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.white70,
              size: 22,
            ),
          ),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.c3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.c3)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }

}

class HeaderContainer extends StatelessWidget {
  var text = 'Sign';

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height.h * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.c1, AppColors.c2],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 3,
              right: 155,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.sp),
              )),
          Center(
            child: Image(
              image: AssetImage(AppAssets.logo1),
              height: 120.h,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  String? btnText = "";
  var onClick;

  ButtonWidget({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp(),));},
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.c1,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText!,
          style: TextStyle(
              fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


Future<bool> _httpGet(Map<String, String> data) async {
  var jsonData = jsonEncode(data);
  var response =
      await post(Uri.parse("http://192.168.43.22:8000/user/"), body: jsonData);
  if (response.statusCode != 200) {
    throw Exception("API error");
  } else {
    print('test----------------------------------');
    return jsonDecode(response.body)['response'];
  }
}
