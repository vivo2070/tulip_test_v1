import 'package:flutter/material.dart';
import 'package:tuliptest/Screens/initialScreen.dart';

import '../../Widgets/btn.dart';
import 'addBusinessTwo.dart';

class addBusniessThree extends StatefulWidget {
  const addBusniessThree({Key? key}) : super(key: key);

  @override
  State<addBusniessThree> createState() => _addBusniessThreeState();
}

class _addBusniessThreeState extends State<addBusniessThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('images/label3.png')
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black54,),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>addBusinessTwo()));
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
              width: MediaQuery.of(context).size.width,
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
            Center(child: Image.asset('images/text2.png')),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('* معلومات العمل التجاري',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                    textDirection: TextDirection.rtl,),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.black54,
                  ),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'ادخل معلومات المتجر هنا'
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 100,),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical: 12),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InitialScreen()));
                  },
                  child: btnAddBus(context, 'اضافة العمل التجاري', Colors.black)),
            ),




          ],
        ),
      ),

    );
  }
}
