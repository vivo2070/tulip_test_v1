import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Screens/initialScreen.dart';

import '../Widgets/btn.dart';
import '../Widgets/tags.dart';
import 'addITem.dart';
import 'myScreens.dart';

class addItemThird extends StatefulWidget {
  const addItemThird({Key? key}) : super(key: key);

  @override
  State<addItemThird> createState() => _addItemThirdState();
}

class _addItemThirdState extends State<addItemThird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('images/label3.png')
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => myScreen()));
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'اضافة منتج جديد',
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              height: 3.0,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffEA6CB0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            SizedBox(height: 100,),
            Image(image: AssetImage('images/box.png'),
            ),
            SizedBox(height: 10,),
            Text('!تمت اضافة المنتج بنجاح',style: GoogleFonts.almarai(
              fontWeight: FontWeight.w700,
              fontSize: 28
            ),),

            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => addItems()));
                    },
                    child: btnShopItem2(context, 'العودة الى المتجر', Colors.white)),

                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => InitialScreen()));
                    },
                    child: btnShopCart(context, 'اضافة المنتج', Color(0xff202124)))
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
