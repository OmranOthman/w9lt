// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:wslet/Core/const/app_colors.dart';
import 'package:wslet/Screens/notification.dart';
import 'package:wslet/Screens/profile.dart';
import 'package:wslet/Screens/qr.dart';
import 'package:wslet/Screens/supervisor.dart';
import '../Core/const/app_assets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> companyTripData = [
    {
      'destination':  'مزة/جلاء',
      'target': 'جامعة الاتحاد ',
      'day': ' السبت',
      'clock': '8:00 ',
      'price': '8000 ل.س ',
    },
    {
      'destination': 'مزة/جلاء',
      'target':   'جامعة الاتحاد ',
      'day': ' السبت',
      'clock': '9:30 ',
      'price': '8000 ل.س ',
    },
    {
      'destination': 'مزة/جلاء',
      'target': 'جامعة الاتحاد ',
      'day': ' السبت',
      'clock': '10:00 ',
      'price': '8000 ل.س ',
    },
    {
      'destination': 'مزة/جلاء',
      'target': 'جامعة الاتحاد ',
      'day': ' السبت',
      'clock': '11:00 ',
      'price': '8000 ل.س ',
    },
  ];


  final List<Map<String, dynamic>> companyHistoryTripData = [
    {
      'destination': 'مزة/جلاء',
      'target': 'جامعة الاتحاد ',
      'day': ' السبت',
      'clock': '8:00 ',
      'price': '8000 ل.س ',
    },
    {
      'destination': 'جامعة الاتحاد ',
      'target': 'مزة/جلاء',
      'day': ' السبت',
      'clock': '2:00 ',
      'price': '8000 ل.س ',
    },
    {
      'destination': ' مزة/جلاء',
      'target': ' جامعة الاتحاد ',
      'day': ' احد',
      'clock': '7:00 ',
      'price': '8000 ل.س ',
    },
    {
      'destination': '  جامعة الاتحاد ',
      'target': 'مزة/جلاء',
      'day': ' احد',
      'clock': '4:00 ',
      'price': '8000 ل.س ',
    },
    {
      'destination': '  مزة/جلاء',
      'target': 'جامعة الاتحاد ',
      'day': ' الثلاثاء',
      'clock': '9:30 ',
      'price': '8000 ل.س ',
    },
    {
      'destination': 'جامعة الاتحاد ',
      'target': 'مزة/جلاء',
      'day': ' الثلاثاء',
      'clock': '2:00 ',
      'price': '8000 ل.س ',
    },
  ];

  final List<Map<String, dynamic>> currentTripData = [
    {
      'name': ' حميد حمادة',
      'number': ' 0937914313',
      'destination': ' جامعة الاتحاد ',
      'position': ' مزة/جلاء',
      'tripType': ' ذهاب',
      'clock': ' 8:00 السبت',
      'price': '8000 ل.س ',
      'subscribe': ' يومي',
    },
  ];

  static const List<String> _kOptions = <String>[
    'مزة/الاتصالات',
    'مزة/فيلات الغربية',
    'مزة/سيتي مول',
    'مزة/جلاء',
    'مزة/الشيخ سعد',
    'مزة/كازية المزة',
    'مزة/مواساة',
    'كفرسوسة',
    'داريا',
    'ميدان/ساحة',
    'صحنايا',
    'جديدة عرطوز',
    'جامعة اليرموك',
    'جامعة الاتحاد',
    'جامعة العربية',
    'جامعة السورية',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  bool _isPressed = false;

  void _onPressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.c4,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.c1,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                AppAssets.logo,
              ),
              height: 80.h,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            color: AppColors.c1,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Noti(),
            ));
          },
        ),
      ),
      endDrawer: Drawer(
        child: IconTheme(
          data: IconThemeData(
            color: Colors.black,
          ),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  currentTripData[0]['name'],
                ),
                accountEmail: Text(
                  currentTripData[0]['number'],
                ),
                decoration: BoxDecoration(color: AppColors.c2),
              ),
              Expanded(
                child: ListView(
                  itemExtent: 70,
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
                  children: [
                    ListTile(
                      trailing: Icon(
                        Icons.account_circle,
                        color: Color(0xFF472183),
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'الحساب الشخصي',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Color(0xFF472183),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      shape: StadiumBorder(side: BorderSide.none),
                      selectedColor: Colors.black,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                      },
                    ),
                    ListTile(
                      trailing: Icon(
                        Icons.attach_money,
                        color: Color(0xFF472183),
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'الحساب المالي',
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
                        Icons.access_time_filled_outlined,
                        color: AppColors.c1,
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'المواعيد المطلوبة',
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
                        Icons.queue,
                        color: Color(0xFF472183),
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'الشركات المحفوظة',
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
                        Icons.mark_unread_chat_alt_sharp,
                        color: Color(0xFF472183),
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'الشكاوي و الاقتراحات',
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
                        Icons.contact_support,
                        color: Color(0xFF472183),
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'المساعدة',
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
                        Icons.privacy_tip,
                        color: Color(0xFF472183),
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'سياسة الخصوصية',
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
                        Icons.man,
                        color: Color(0xFF472183),
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'مشرف',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Color(0xFF472183),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      shape: StadiumBorder(side: BorderSide.none),
                      selectedColor: Colors.black,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Supervisor(),
                        ));
                      },
                    ),
                    ListTile(
                      trailing: Icon(
                        Icons.exit_to_app,
                        color: Color(0xFF472183),
                        //textDirection: TextDirection.rtl,
                      ),
                      title: Text(
                        'تسجيل الخروج',
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
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                color: AppColors.c1,
                child: TabBar(
                  // indicatorWeight: 4,
                  unselectedLabelColor: AppColors.c3,
                  indicatorColor: AppColors.c4,
                  labelStyle: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.c1,
                    decorationColor: Colors.transparent,
                    // backgroundColor: AppColors.c2
                  ),
                  tabs: [
                    Tab(
                      child: Text('الرحلة التالية',style: TextStyle(fontSize: 15.sp,),),
                    ),
                    Tab(
                      child: Text('رحلات المسجلة',style: TextStyle(fontSize: 15.sp,),),
                    ),
                    Tab(
                      child: Text('رحلات الشركة',style: TextStyle(fontSize: 15.sp,),),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.c3, AppColors.c2],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.0.h),
                        Row(
                          children: [
                            Text(
                              'رقم الموبايل',
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 170.0.w),
                            Text(
                              'الاسم',
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0.h),
                        Row(
                          children: [
                            Text(
                              currentTripData[0]['number'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 96.w),
                            Text(
                              currentTripData[0]['name'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.0.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.c1,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0.r),
                              topRight: Radius.circular(20.0.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'الوجهة',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 20.0.sp,
                                      ),
                                    ),
                                    Text(
                                      'الموقف',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 20.0.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      currentTripData[0]['destination'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      currentTripData[0]['position'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0.h),
                        Row(
                          children: [
                            Text(
                              'نوع الرحلة',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 175.w),
                            Text(
                              'الوقت',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Text(
                              currentTripData[0]['tripType'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 166.0.w),
                            Text(
                              currentTripData[0]['clock'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 3,
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(height: 8.0.h),
                        Row(
                          children: [
                            Text(
                              'الاشتراك',
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 145.0.w),
                            Text(
                              'سعر التذكرة',
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0.h),
                        Row(
                          children: [
                            Text(
                              currentTripData[0]['subscribe'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 166.w),
                            Text(
                              currentTripData[0]['price'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'انضمام لنقطة الاتصال',
                                      style: TextStyle(
                                          fontSize: 16.0.sp, color: AppColors.c4),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.c1,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32.0.w,
                                        vertical: 16.0.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  ElevatedButton(
                                    onPressed: () {
                                      String data =
                                          ' ${currentTripData[0]['name']}'
                                          ' ${currentTripData[0]['number']} '
                                          ' ${currentTripData[0]['destination']} '
                                          ' ${currentTripData[0]['position']}'
                                          ' ${currentTripData[0]['tripType']}'
                                          ' ${currentTripData[0]['clock']}'
                                          ' ${currentTripData[0]['subscribe']}'
                                          ' ${currentTripData[0]['price']}';
                                      //data.split(' ').toList();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => QR(
                                          qrData: data,
                                        ),
                                      ));
                                    },
                                    child: Text(
                                      'QR رمز',
                                      style: TextStyle(
                                          fontSize: 16.0.sp, color: AppColors.c4),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.c1,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32.0.w,
                                        vertical: 10.0.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: companyHistoryTripData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular((15.r)),
                        child: Slidable(
                          key: const ValueKey(1),
                          startActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                label: 'حذف الرحلة',
                                icon: Icons.delete,
                                onPressed: (context) => (removeData(index)),
                              ),
                            ],
                          ),
                          child: Card(
                            margin: EdgeInsets.all(5),
                            elevation: 5,
                            color: AppColors.c3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  trailing: Text(
                                    'الموقف:${companyHistoryTripData[index]['destination']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  title: Text(
                                    'الوجهة:${companyHistoryTripData[index]['target']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                ListTile(
                                  trailing: Text(
                                    'اليوم:${companyHistoryTripData[index]['day']}',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  title: Text(
                                    'الساعة: ${companyHistoryTripData[index]['clock']}',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: InkWell(
                            onTap: () {
                              _showFilterDialog();
                            },
                            child: Icon(Icons.filter_list)),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: companyTripData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              margin: EdgeInsets.all(5),
                              elevation: 5,
                              color: AppColors.c3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    trailing: Text(
                                      'الموقف:${companyTripData[index]['destination']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    title: Text(
                                      'الوجهة:${companyTripData[index]['target']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    indent: 20,
                                    endIndent: 20,
                                  ),
                                  ListTile(
                                    trailing: Text(
                                      'اليوم:${companyTripData[index]['day']}',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    title: Text(
                                      'الساعة: ${companyTripData[index]['clock']}',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    indent: 20,
                                    endIndent: 20,
                                  ),
                                  ListTile(
                                    trailing: Text(
                                      'سعر الرحلة: ${companyTripData[index]['price']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: EdgeInsets.only(
                                          left: 0,
                                          top: 0,
                                          right: 75.w,
                                          bottom: 5.h),
                                      child: FloatingActionButton(
                                        backgroundColor: _isPressed
                                            ? Colors.red
                                            : AppColors.c1,
                                        onPressed: () {
                                          _onPressed();
                                          //moveDataToHistory(index);
                                        },
                                        child: Icon(
                                          _isPressed ? Icons.remove : Icons.add,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  removeData(index) {
    setState(() {
      companyTripData.removeAt(index);
    });
  }

  moveDataToHistory(index) {
    setState(() {
      companyHistoryTripData.add(companyTripData[index]);
    });
  }

  ////////////////////function
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.c4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text(
            'الموقف \nالوجهة',
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return _kOptions.where((String option) {
                      return option
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) {
                    debugPrint('You just selected $selection');
                  },
                  // fieldViewBuilder: (BuildContext context,
                  //     TextEditingController textEditingController,
                  //     FocusNode focusNode,
                  //     VoidCallback onFieldSubmitted) {
                  //   return TextFormField(
                  //     controller: textEditingController,
                  //     decoration: InputDecoration(
                  //       hintText: 'المنطقة/الموقف',
                  //     ),
                  //   );
                  // },
                ),
                SizedBox(height: 16.h),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return _kOptions.where((String option) {
                          return option
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        debugPrint('You just selected $selection');
                      },
                      // fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                      //   return TextFormField(
                      //     controller: textEditingController,
                      //     decoration: InputDecoration(
                      //       hintText: 'الوجهة',
                      //     ),
                      //   );
                      // },
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('الغاء'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Apply filter logic here
                  Navigator.pop(context);
                }
              },
              child: Text('تأكيد'),
            ),
          ],
        );
      },
    );
  }
}

void doNothing(BuildContext context) {}
