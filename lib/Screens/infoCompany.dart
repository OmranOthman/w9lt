import 'package:flutter/material.dart';
import 'package:wslet/Screens/routine.dart';
import '../Core/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCompany extends StatefulWidget {
  const InfoCompany({Key? key}) : super(key: key);

  @override
  _InfoCompanyState createState() => _InfoCompanyState();
}


class _InfoCompanyState extends State<InfoCompany> {
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.c4,
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.arrow_forward,size: 28,),
            ),
          ],
          title: Text("معلومات الشركة"),
          centerTitle: true,
          backgroundColor: AppColors.c1,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h,right: 20.w),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/company1.png'),
                      radius: 40.r,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20.h,right: 20.w),
                    child: Text('الشام',style: TextStyle(
                        fontSize: 35.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h,right: 40.w),
                    child: InkWell(
                      child: Icon(Icons.add_box,size: 50,color: Colors.green,),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Routine(),));
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
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
                        padding: const EdgeInsets.only(top:12),
                        child: Text('رقم الهاتف : 0114235326',style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                      ),
                      Text('                        '),
                      Text(
                          'عنوان الشركة : دمشق, جسر الابيض,\n مقابل حلويات نبيل نفيسة',style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.h, bottom: 0, left: 0, right: 0),
                        child: Container(
                          height: 310.h,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero),
                          ),
                          child: Container(
                            height: 90.h,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.h,right: 40.w),
                                      child: Text('المناطق المخدمة : ',
                                        style: TextStyle(fontSize: 22.sp,
                                            fontWeight: FontWeight.bold),),
                                    ),
                                    Text(' ركن الدين\n مزرعة\n مزة\n مزرعة\n مالكي\n مهاجرين\n صحنايا',
                                         style: TextStyle(fontSize: 22.sp),),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
