import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Screens/landingPage.dart';
import 'package:tuliptest/auth/Register.dart';

import '../Screens/initialScreen.dart';

class authScreen extends StatefulWidget {
  const authScreen({Key? key}) : super(key: key);

  @override
  State<authScreen> createState() => _authScreenState();
}

class _authScreenState extends State<authScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        width: double.infinity,
        height:double.infinity ,
        decoration: BoxDecoration(
          color:  Color(0xffFEF1F6),
          image: DecorationImage(
            image: AssetImage('images/sw.png')
          )
        ),
        child: Scaffold(

          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/to.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Column(
                children: [
                  Center(
                    child: Image.asset('images/14.png', width: 150, height: 100),
                  ),
                  SizedBox(height: 54),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => InitialScreen()));
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'الدخول كـ زائر',
                        style: GoogleFonts.almarai(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff323232)),
                      ),
                      width: 326,
                      height: 47,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffEA6CB0),
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'تسجيل الدخول',
                        style: GoogleFonts.almarai(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      width: 326,
                      height: 47,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffEA6CB0),
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffBE338E),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                flex: 1,
                child: Image.asset(
                  'images/fo.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 220,
                ),
              ),
            ],
          )


        ),
      ),
    );
  }
}
