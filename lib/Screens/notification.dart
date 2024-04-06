
import 'package:flutter/material.dart';
import 'package:wslet/Core/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Noti extends StatefulWidget {
  const Noti({Key? key}) : super(key: key);

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  final List<Map> notiList = [
    {
      "title":
      "تم الصعود بلرحلة الاولى مزة شيخ سعد - الجامعة السورية الخاصة",
    },{
      "title":
      "تم تعديل اوقات الرحلة الاولى يرجى مراجعة خطة النقل",
    },
    {
      "title":
      "تم الصعود بلرحلة الثالثة مزة شيخ سعد - الجامعة السورية الخاصة",
    },
    {
      "title": "تم الصعود بلرحلة الاولى مزة شيخ سعد - الجامعة السورية الخاصة",
    },
    {
      "title":
      "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c3,
      appBar: AppBar(
        backgroundColor: AppColors.c4,
        elevation: 5,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.c1,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          'الاشعارات',
          style: TextStyle(color: AppColors.c1),
        ),
      ),
      body:SingleChildScrollView(
        child:Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: notiList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildList(context, index);
                        }),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.c4,
      ),
      width: double.infinity,
      height: 160.h,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  notiList[index]['title'],
                  style: TextStyle(color: Colors.black,
                      fontSize: 20.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
