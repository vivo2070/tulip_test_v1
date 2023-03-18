import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/btn.dart';
import '../Widgets/tags.dart';
import 'addITem.dart';
import 'additemThird.dart';
import 'myScreens.dart';

class addItemSecond extends StatefulWidget {
  const addItemSecond({Key? key}) : super(key: key);

  @override
  State<addItemSecond> createState() => _addItemSecondState();
}

class _addItemSecondState extends State<addItemSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('images/label2.png')
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
              width: MediaQuery.of(context).size.width / 2,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Container(
                  width: 350,
                  height: 149,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.redAccent, width: 1),
                    color: Color(0xfffef8fb),
                    image: DecorationImage(
                        alignment: AlignmentDirectional.centerEnd,
                        image: AssetImage('images/i.png')),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'بحاجة الى المساعدة',
                          style: GoogleFonts.almarai(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'يمكنك الاتصال بموظفينا لمساعدتك',
                          style: GoogleFonts.almarai(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Add your phone call logic here
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.phone, color: Colors.redAccent),
                                  SizedBox(width: 5),
                                  Text(
                                    'اتصل الان',
                                    style: TextStyle(
                                        color: Colors.redAccent, fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 1,
                              color: Colors.grey,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            Text('لاحقا', style: TextStyle(fontSize: 17)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'اسم المنتج',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      ' اكتب اسم المنتج باختصار',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'معلومات المنتج',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      ' اكتب شرح عن المنتج باختصار',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'السعر',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('تغيير العملة',style: TextStyle(
                        fontSize: 20,color: Colors.pinkAccent
                      ),),
                      SizedBox(width: 15,),
                      Text(
                        'العملة بالدينار العراقي',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('تحديد كمنتج مفضل',style: GoogleFonts.almarai(
                        fontSize: 17,
                        color: Colors.grey
                      ),),
                      Checkbox(

                        value: false,
                        onChanged: (bool? value) {},
                      ),

                    ],
                  )



                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => addItems()));
                      },
                      child: btnShopItem2(context, 'رجوع', Colors.white)),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => addItemThird()));
                      },
                      child: btnShopItem(context, 'التالي', Color(0xff202124)))
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
