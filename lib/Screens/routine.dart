// ignore_for_file: unused_field, dead_code

import 'package:flutter/material.dart';
import 'package:wslet/Core/const/app_colors.dart';
import 'package:wslet/Screens/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Routine extends StatefulWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  List<String> timeGo = [
    '---',
    '8:00',
    '8:30',
    '9:00',
    '9:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '1:00',
    '1:30',
  ];
  List<String> timeBack = [
    '---',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '1:00',
    '1:30',
    '2:00',
    '2:30',
    '3:00',
    '3:30'
  ];
  String selectedTimeGo = '---';
  String selectedTimeBack = '---';
  final List<String> days = [
    'سبت',
    'احد',
    'اثنين',
    'ثلاثاء',
    'اربعاء',
    'خميس',
    'جمعة'
  ];


  static const List<String> _kOptions = <String>[
    'مزة/جلاء',
    'مزة/الاتصالات',
    'مزة/فيلات الغربية',
    'مزة/سيتي مول',
    'مزة/الشيخ سعد',
    'مزة/مواساة',
    'مزة/كازية المزة',
    'كفرسوسة',
    'داريا',
    'ميدان',
    'صحنايا',
    'جديدة عرطوز',
    'جامعة اليرموك',
    'جامعة الاتحاد',
    'جامعة العربية',
    'جامعة السورية',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> selectedTimes = ['---','---','---','---','---','---','---',];
  List<String> selectedTimesBack = ['---','---','---','---','---','---','---',];

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: AppColors.c4,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            backgroundColor: AppColors.c1,
            centerTitle: true,
            actions: [],
            title: Text('الروتين الاسبوعي'),
          ),
          body: Center(
            child: ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 330.w,bottom: 40.h,top: 40.h),
                      child: InkWell(
                          onTap: () {
                            _showFilterDialog();
                          },
                          child: Icon(Icons.filter_list)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.c3,
                          border: Border.all(width: 1.w, color: AppColors.c3),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: {
                            0: FixedColumnWidth(100),
                            1: FixedColumnWidth(120),
                            2: FixedColumnWidth(120),
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                    child: Text(
                                  'اليوم',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                                TableCell(
                                    child: Text(
                                  'توقيت الوصول',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                                TableCell(
                                    child: Text(
                                  'توقيت الاياب',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ],
                            ),
                            for (int i = 0;i<days.length;i++) ...{
                              TableRow(
                                children: [
                                  TableCell(
                                      child: Text(
                                    days[i],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700),
                                  )),
                                  TableCell(
                                      child: Column(
                                    children: [
                                      DropdownButton<String>(
                                        items: timeGo
                                            .map((e) => DropdownMenuItem<String>(
                                                  child: Text("$e"),
                                                  value: e,
                                                ))
                                            .toList(),
                                        onChanged: (val) {
                                          setState(() {
                                            selectedTimeGo = val!;
                                            selectedTimes[i] = val;
                                            print(selectedTimeGo);
                                          });
                                        },
                                        value: selectedTimes[i],
                                      )
                                    ],
                                  )),
                                  TableCell(
                                      child: Column(
                                    children: [
                                      DropdownButton<String>(
                                        items: timeBack
                                            .map((e) => DropdownMenuItem<String>(
                                                  child: Text("$e"),
                                                  value: e,
                                                ))
                                            .toList(),
                                        onChanged: (val) {
                                          setState(() {
                                            selectedTimeBack = val!;
                                            selectedTimesBack[i] = val;
                                            print(selectedTimeBack);
                                          });
                                        },
                                        value: selectedTimesBack[i],
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            },
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back),
                                Text("تخطي"),
                              ],
                            ),
                          ),
                          MaterialButton(
                            color: AppColors.c1,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                            },
                            child: Text("تاكيد",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.c4,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text('الموقف \nالوجهة'),
          content: Form(

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
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
                    //       hintText: 'المنطقة/الموقف',
                    //     ),
                    //   );
                    // },
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
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