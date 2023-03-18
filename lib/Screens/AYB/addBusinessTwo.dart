import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuliptest/Screens/AYB/addBusinessOne.dart';

import '../../Widgets/btn.dart';
import '../../Widgets/timePicker.dart';
import 'addBusinessThree.dart';

class addBusinessTwo extends StatefulWidget {
  const addBusinessTwo({Key? key}) : super(key: key);

  @override
  State<addBusinessTwo> createState() => _addBusinessTwoState();
}

class _addBusinessTwoState extends State<addBusinessTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('images/label2.png')
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black54,),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>addBusinessOne()));
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('اضافة عملك الخاص',style: TextStyle(
            color: Colors.black
        ),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              height: 3.0,
              width: MediaQuery.of(context).size.width/2,
              color: Color(0xffEA6CB0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [

            SizedBox(height: 50,),
            Center(child: Image.asset('images/text.png')),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimePickerContainer(iconColor: Colors.red[300]),
                  TimePickerContainer(iconColor: Colors.green[300]),
                  SizedBox(width: 12,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('السبت',style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                      textDirection: TextDirection.rtl,),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffBE338E),
                        shape: BoxShape.circle
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimePickerContainer(iconColor: Colors.red[300]),
                  TimePickerContainer(iconColor: Colors.green[300]),
                  SizedBox(width: 12,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('السبت',style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                      textDirection: TextDirection.rtl,),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffBE338E),
                        shape: BoxShape.circle
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimePickerContainer(iconColor: Colors.red[300]),
                  TimePickerContainer(iconColor: Colors.green[300]),
                  SizedBox(width: 12,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('السبت',style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                      textDirection: TextDirection.rtl,),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffBE338E),
                        shape: BoxShape.circle
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimePickerContainer(iconColor: Colors.red[300]),
                  TimePickerContainer(iconColor: Colors.green[300]),
                  SizedBox(width: 12,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('السبت',style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                      textDirection: TextDirection.rtl,),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffBE338E),
                        shape: BoxShape.circle
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimePickerContainer(iconColor: Colors.red[300]),
                  TimePickerContainer(iconColor: Colors.green[300]),
                  SizedBox(width: 12,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('السبت',style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                      textDirection: TextDirection.rtl,),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffBE338E),
                        shape: BoxShape.circle
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimePickerContainer(iconColor: Colors.red[300]),
                  TimePickerContainer(iconColor: Colors.green[300]),
                  SizedBox(width: 12,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('السبت',style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                      textDirection: TextDirection.rtl,),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffBE338E),
                        shape: BoxShape.circle
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>addBusinessTwo()));
                      },

                      child: btnShopCartnoIcon(context,'رجوع',Colors.white)),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>addBusniessThree()));
                      },

                      child: btnShopCart(context, 'التالي', Colors.black)),


                ],
              ),
            ),




          ],
        ),
      ),

    );
  }
}
