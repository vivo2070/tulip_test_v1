import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Screens/landingPage.dart';
import 'package:tuliptest/Widgets/btn.dart';
import 'package:tuliptest/material/font.dart';
import 'package:tuliptest/material/padding.dart';

import 'otpField.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: font().pinkBG,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100, bottom: 25),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 90,
                  backgroundImage: AssetImage('images/logo.png'),
                ),
              ),
            ),
            Text(
              'OTP Verification',
              style: GoogleFonts.roboto(
                  color: font().fcBlack,
                  fontSize: font().fsTitle,
                  fontWeight: font().fontWeightPrimary),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'يرجى إدخال رمز التحقق المُرسل الى الرقم 07712345678',
              style: GoogleFonts.almarai(
                  fontWeight: font().fontWeightSecondary,
                  fontSize: font().fsHint,
                  color: font().fcGrey),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInput(_fieldOne, true), // auto focus
                OtpInput(_fieldTwo, false),
                OtpInput(_fieldThree, false),
                OtpInput(_fieldFour, false),
                OtpInput(_fieldFive, false),
                OtpInput(_fieldSix, false)
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    //TODO resend the OTP Code
                  },
                  child: Text(
                    'إعادة ارسال',
                    style: GoogleFonts.almarai(
                        fontSize: font().fsHint,
                        wordSpacing: 2,
                        fontWeight: font().fontWeightSecondary,
                        color: Colors.blueAccent),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text('لم يتم استلام الرمز؟',style: GoogleFonts.almarai(
                  wordSpacing: 2,
                    fontSize: font().fsHint,
                    fontWeight: font().fontWeightSecondary,
                    color: font().fcBlack),),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding().formPadding),
              child: btn(context, 'تأكيد الرمز', font().btnColor),
            ),

          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>landingPage()));
          }, icon: Icon(Icons.arrow_forward_ios_sharp))
          ],
        ),
      ),
    ));
  }
}
