import 'package:flutter/material.dart';
import 'package:wslet/Screens/changePassword.dart';
import '../Core/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _numberController;
  late TextEditingController _emergencyController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'محمد حامد');
    _numberController = TextEditingController(text: '099999999');
    _emergencyController = TextEditingController(text: '099999999');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _emergencyController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // TODO: Implement code to save changes to the name, number, and emergency number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c4,
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
          'الحساب الشخصي',
          style: TextStyle(color: AppColors.c1),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Text(
                'اسم المستخدم',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'ادخل الرقم',
                      hintStyle:
                          TextStyle(color: Colors.white60, fontSize: 14.5.sp),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: AppColors.c1, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: AppColors.c1, width: 4))),
                ),
              ),
              SizedBox(height: 16.0.h),
              Text(
                'رقم الموبايل',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  controller: _numberController,
                  decoration: InputDecoration(
                      hintText: 'ادخل الرقم',
                      hintStyle:
                          TextStyle(color: Colors.white60, fontSize: 14.5.sp),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: AppColors.c1, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: AppColors.c1, width: 4))),
                ),
              ),
              SizedBox(height: 16.0.h),
              Text(
                'رقم الطوارىء',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  controller: _emergencyController,
                  decoration: InputDecoration(
                      hintText: 'ادخل رقم الطوارئ',
                      hintStyle:
                          TextStyle(color: Colors.white60, fontSize: 14.5.sp),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: AppColors.c1, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: AppColors.c1, width: 4))),
                ),
              ),
              SizedBox(height: 20.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: _saveChanges,
                      child: Text('حفظ التغييرات'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.c1,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text('الغاء',style: TextStyle(color: AppColors.c1,fontSize: 18.sp),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.c4,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0.h),
              Divider(
                color: Colors.grey[400],
                height: 0.0,
                thickness: 1.0,
                indent: 16.0,
                endIndent: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20.0.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangePassword(),
                      ));
                    },
                    child: Text('إعادة تعيين كلمة المرور'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.c1,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                  ),
                  SizedBox(height: 20.0.h),
                  Divider(
                    color: Colors.grey[400],
                    height: 0.0,
                    thickness: 1.0,
                    indent: 16.0,
                    endIndent: 16.0,
                  ),
                  SizedBox(height: 20.0.h),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('التحقق من وجود تحديثات للتطبيق'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.c1,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('حول التطبيق'),
                    style: ElevatedButton.styleFrom(
                       backgroundColor: AppColors.c1,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20.0.h),
              Text(
                'النسخة 0.0.1',
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
