import 'package:flutter/material.dart';
import 'package:wslet/Screens/infoCompany.dart';
import '../Core/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCompany extends StatefulWidget {
  const ChooseCompany({Key? key}) : super(key: key);

  @override
  _ChooseCompanyState createState() => _ChooseCompanyState();
}

class _ChooseCompanyState extends State<ChooseCompany> {
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.c4,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search,size: 28,),
            )
          ],
          title: Text("اختيار الشركة"),
          centerTitle: true,
          backgroundColor: AppColors.c1,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 50.h,left: 10.w,right: 10.w),
            child: Container(

              decoration: BoxDecoration(
                color: AppColors.c3,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: GestureDetector(
                        onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoCompany(),));},
                        child: Container(
                          height: 90.h,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, right: 20.w,),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/company1.png'),
                                  radius: 35.r,
                                ),
                              ),
                              Text(
                                'الشام',
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Container(
                        height: 90.h,
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w, right: 20.w,),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/company.png'),
                                radius: 35,
                              ),
                            ),
                            Text(
                              'الرمال',
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        height: 90.h,
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w, right: 20.w,),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/company2.jpg'),
                                radius: 35,
                              ),
                            ),
                            Text(
                              'النواعير',
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        height: 90.h,
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w, right: 20.w,),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/company3.png'),
                                radius: 35,
                              ),
                            ),
                            Text(
                              'الباشا',
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        height: 90.h,
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w, right: 20.w,),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/company4.jpg'),
                                radius: 35,
                              ),
                            ),
                            Text(
                              'الاحمد',
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
