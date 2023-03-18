
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/auth/authLandingPage.dart';
import 'package:tuliptest/material/font.dart';
import 'package:tuliptest/splashOnBoardingScreens/Screens/boardingScreens.dart';

class onScreen extends StatefulWidget {
  @override
  State<onScreen> createState() => _onScreenState();
}

class _onScreenState extends State<onScreen> {

  int indicator = 0;
  final PageController pageController = PageController(initialPage: 0);
  int pageNum=3;
  Widget indicatorItem(bool isActive)
  {
    return AnimatedContainer(duration: Duration(milliseconds: 300),
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: isActive?25:13,
      decoration: BoxDecoration(
        color: isActive? Color(0xffFF9083):Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  List<Widget> pageBuilder()
  {
    List<Widget> list=[];
    for(int i=0;i < pageNum;i++)
    {
      list.add(i==indicator? indicatorItem(true):indicatorItem(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: font().pinkBG,
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              PageView(
                physics: BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (int page){
                  setState(() {
                    indicator=page;
                  });

                },
                children: <Widget>[
                  One(),Two(),Three()
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height-175,
                child: Row(
                  children:
                    pageBuilder()
                ),
              ),

              Positioned(
                  right: MediaQuery.of(context).size.width / 20,
                  top: MediaQuery.of(context).size.height - 90,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => authScreen()));
                    },
                    child: Text('تخطي الكل',
                        style: GoogleFonts.almarai(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          color: Colors.black54,
                        )),
                  )),
            ],
          )),
    );
  }
}
