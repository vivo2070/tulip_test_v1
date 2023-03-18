import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tuliptest/material/font.dart';
import 'package:tuliptest/splashOnBoardingScreens/OnScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();

}



class _splashScreenState extends State<splashScreen> {
  int splashtime = 3;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
        //pushReplacement = replacing the route so that
        //splash screen won't show on back button press
        //navigation to Home page.
          builder: (context){
            return onScreen();
          }));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffef87bc),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: AlignmentDirectional.topStart
                      ,child: Image.asset('images/frameTop (2).png')),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset('images/3.png'),
              ),
            ),
             Expanded(
               child: Align(
                 alignment: AlignmentDirectional.bottomEnd

                 ,child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                        Image.asset('images/botFrame.png'),
                  ],
            ),
               ),
             )
          ],
        ),
      ),
    );
  }
}
