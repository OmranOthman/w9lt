import 'package:flutter/material.dart';
import 'package:wslet/Core/const/app_colors.dart';
import 'package:wslet/Screens/qrScanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Supervisor extends StatefulWidget {

  const Supervisor({Key? key}) : super(key: key);

  @override
  State<Supervisor> createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {

  late String? value = '';
  final positions = ["حميد حمادة", "جمال راضي", "خالد حريري","مازن طحان", "رنا تيناوي", " قاسم يبرودي","احمد الراشدي", "جميلة نابلسي", "سمير غانم","صالح فتحي", "اميرة القادري", "سارة هوساوي",];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.c4,
        appBar: AppBar(
          title: Text('المشرف'),
          centerTitle: true,
          backgroundColor: AppColors.c1,
        ),
        drawer: Drawer(
          child: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("المزة",style: TextStyle(
                    fontSize: 35.sp,
                    color: Colors.white,
                  ),),
                  decoration: BoxDecoration(color: AppColors.c2), accountEmail: null,
                ),
                Expanded(
                  child: ListView(
                    itemExtent: 70,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    children: [
                      ListTile(
                        trailing: Icon(
                          Icons.location_on,
                          color: Color(0xFF472183),
                          //textDirection: TextDirection.rtl,
                        ),
                        title: Text(
                          'مواساة',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xFF472183),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        shape: StadiumBorder(side: BorderSide.none),
                        selectedColor: Colors.black,
                        onTap: () {},
                      ),
                      ListTile(
                        trailing: Icon(
                          Icons.location_on,
                          color: Color(0xFF472183),
                          //textDirection: TextDirection.rtl,
                        ),
                        title: Text(
                          'كازية المزة',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xFF472183),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        shape: StadiumBorder(side: BorderSide.none),
                        selectedColor: Colors.black,
                        onTap: () {
                          // ...
                        },
                      ),
                      ListTile(
                        trailing: Icon(
                          Icons.location_on,
                          color: AppColors.c1,
                          //textDirection: TextDirection.rtl,
                        ),
                        title: Text(
                          'الشيخ سعد',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xFF472183),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        shape: StadiumBorder(side: BorderSide.none),
                        selectedColor: Colors.black,
                        onTap: () {
                          // ...
                        },
                      ),
                      ListTile(
                        trailing: Icon(
                          Icons.location_on,
                          color: Color(0xFF472183),
                          //textDirection: TextDirection.rtl,
                        ),
                        title: Text(
                          'الجلاء',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xFF472183),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        shape: StadiumBorder(side: BorderSide.none),
                        selectedColor: Colors.black,
                        onTap: () {
                          // ...
                        },
                      ),
                      ListTile(
                        trailing: Icon(
                          Icons.location_on,
                          color: Color(0xFF472183),
                          //textDirection: TextDirection.rtl,
                        ),
                        title: Text(
                          'سيتي مول',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xFF472183),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        shape: StadiumBorder(side: BorderSide.none),
                        selectedColor: Colors.black,
                        onTap: () {
                          // ...
                        },
                      ),
                      ListTile(
                        trailing: Icon(
                          Icons.location_on,
                          color: Color(0xFF472183),
                          //textDirection: TextDirection.rtl,
                        ),
                        title: Text(
                          'فيلات الغربية',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xFF472183),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        shape: StadiumBorder(side: BorderSide.none),
                        selectedColor: Colors.black,
                        onTap: () {
                          // ...
                        },
                      ),
                      ListTile(
                        trailing: Icon(
                          Icons.location_on,
                          color: Color(0xFF472183),
                          //textDirection: TextDirection.rtl,
                        ),
                        title: Text(
                          'الاتصالات',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xFF472183),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        shape: StadiumBorder(side: BorderSide.none),
                        selectedColor: Colors.black,
                        onTap: () {
                          // ...
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsetsDirectional.only(start: 250),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.c1),
                color: AppColors.c3,
              ),
              child: DropdownButton<String?>(
                hint: Text("قائمة الباصات",style: TextStyle(),),
                items: [
                  DropdownMenuItem<String>(
                    value: "باص #1",
                    child: Text("باص #1"),
                  ),
                  DropdownMenuItem<String>(
                    value: "باص #2",
                    child: Text("باص #2"),
                  ),
                  DropdownMenuItem<String>(
                    value: "باص #3",
                    child: Text("باص #3"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
                value: value == '' ? null : value
              ),
            ),
            Column(
              children: positions
                  .map((position) => ListTile(
                title: Text(position),
                subtitle: Text("+1 234 567 8901"),
              ))
                  .toList(),
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRScanner(title: 'QR ماسح',),));
            },
            child: Icon(
              Icons.qr_code
            ),
          ),
        ),
      ),
    );
  }

}