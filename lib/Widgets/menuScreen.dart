import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuliptest/Screens/initialScreen.dart';

import '../main.dart';

class MenuScreen extends StatefulWidget {
  final String? name;

  MenuScreen({this.name});
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String authToken = '';
  bool _loggingOut = false;
  String _userName = '';
  String? name;



  @override
  void initState() {
    super.initState();
    _loadUserName();

  }

  void _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('userName') ?? '';
    setState(() {
      _userName = userName;
      print(_userName);
    });
  }

  Future<String?> getName() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      name = prefs.getString('userName');
      print(name);
    } catch (e) {
      print('Error getting name: $e');
    }

    return name;
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    border: Border.all(color: Color(0xffA61379)),
                    color: Color(0xffFEF1F6),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InitialScreen()));

                      },
                      child: Icon(
                        Icons.close,
                        color: Color(0xffA61379),
                      ))),
            )
          ],
          centerTitle: true,
          title: Text('الاعدادات',
              style:
                  GoogleFonts.almarai(fontSize: 30, color: Color(0xffD2489F))),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                          radius: 30.0,
                        ),

                        SizedBox(
                          width: 14,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                             getName().toString(),
                              style: GoogleFonts.almarai(
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Column(

                  children: [Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('الرئيسية',style: GoogleFonts.almarai(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54
                      ),),
                    ),
                  ),

                    SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                           color: Color(0xffFEF1F6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('(4)',style: TextStyle(
                                  color: Color(0xffA61379),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('الاشعارات',style: GoogleFonts.almarai(
                                      fontSize: 18,
                                      color: Color(0xff2B2B2B)
                                  ),),
                                  SizedBox(width: 20,),
                                  Icon(Icons.notifications,color: Color(0xffA61379),size: 30,),

                                ],
                              ),
                            ),

                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffFEF1F6)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('تعديل الملف الشخصي',style: GoogleFonts.almarai(
                                    fontSize: 18,
                                    color: Color(0xff2B2B2B)
                                ),),
                                SizedBox(width: 20,),
                                Icon(Icons.edit,color: Color(0xffA61379),size: 30,),

                              ],
                            ),
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFEF1F6)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('مواعيد العمل',style: GoogleFonts.almarai(
                                  fontSize: 18,
                                  color: Color(0xff2B2B2B)
                              ),),
                              SizedBox(width: 20,),
                              Icon(Icons.calendar_month,color: Color(0xffA61379),size: 30,),

                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Column(

                  children: [Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text('الادوات',style: GoogleFonts.almarai(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54
                      ),),
                    ),
                  ),

                    SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffFEF1F6)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('خدمة الزبائن',style: GoogleFonts.almarai(
                                    fontSize: 18,
                                    color: Color(0xff2B2B2B)
                                ),),
                                SizedBox(width: 20,),
                                Icon(Icons.call,color: Color(0xffA61379),size: 30,),

                              ],
                            ),
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFEF1F6)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 60),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('العربية',style: TextStyle(
                                    color: Color(0xffA61379),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700
                                ),),
                              ),
                              Text('اللغات',style: GoogleFonts.almarai(
                                  fontSize: 18,
                                  color: Color(0xff2B2B2B)
                              ),),


                            ],
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFEF1F6)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text('اعلانات مدفوعة',style: GoogleFonts.almarai(
                                fontSize: 18,
                                color: Color(0xff2B2B2B)
                            ),),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFEF1F6),
                    border: Border.all(
                        color: Color(0xffA61379),
                      width: 2
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('اضافة عملك الخاص',style: GoogleFonts.almarai(
                            fontSize: 18,
                            color: Color(0xff2B2B2B)
                        ),),
                        SizedBox(width: 20,),
                        Image.asset('images/pre.png'),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.exit_to_app,color: Color(0xffB3261E)),
                    SizedBox(width: 5,),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      _loggingOut = true;
                    });

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('authToken', '');

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        _loggingOut = false;
                      });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp()));
                    });
                  },
                  child: Text(
                    'تسجيل خروج',
                    style: GoogleFonts.almarai(
                      fontWeight: FontWeight.w700,
                      color: Color(0xffB3261E),
                      fontSize: 20,
                    ),
                  ),
                ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
