import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuliptest/Screens/addItemSecond.dart';
import 'package:tuliptest/Widgets/tags.dart';

import '../Widgets/btn.dart';
import 'myScreens.dart';

class addItems extends StatefulWidget {
  const addItems({Key? key}) : super(key: key);

  @override
  State<addItems> createState() => _addItemsState();
}

class _addItemsState extends State<addItems> {
  List<File> _imageFiles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('images/label1.png')
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black54,),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>myScreen()));
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('اضافة منتج جديد',style: TextStyle(
          color: Colors.black
        ),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              height: 3.0,
              width: MediaQuery.of(context).size.width/3,
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
                    border: Border.all(
                      color: Colors.redAccent,
                      width: 1
                    ),
                    color: Color(0xfffef8fb),
                    image: DecorationImage(
                      alignment: AlignmentDirectional.centerEnd,
                      image: AssetImage('images/i.png')
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text('بحاجة الى المساعدة',style: GoogleFonts.almarai(
                          fontSize: 20,

                        ),),
                        SizedBox(height: 5,),
                        Text('يمكنك الاتصال بموظفينا لمساعدتك',style: GoogleFonts.almarai(
                          fontSize: 17,

                        ),),
                        SizedBox(height: 10,),
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: double.infinity,
                        ),
                        SizedBox(height: 10,),
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
                                  Text('اتصل الان',style: TextStyle(
                                    color: Colors.redAccent,fontSize: 17
                                  ),),
                                ],
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 1,
                              color: Colors.grey,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            Text('لاحقا',style: TextStyle(
                                fontSize: 17
                            )),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
  Align(
    alignment: AlignmentDirectional.topEnd,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('اضافة صور للمنتج',style: TextStyle(
              fontSize: 22
          ),),
          Text('اختر خمس صور مناسبة للمنتج',style: TextStyle(
              fontSize: 18,color: Colors.grey
          ),)
        ],
      ),
    ),
  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // added SizedBox with width of 10
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  // Add spacing between the items
                  children: List.generate(
                    _imageFiles.length,
                        (index) {
                      return Stack(
                        children: [
                          Container(
                            height: 210,
                            width: 106,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(_imageFiles[index]),
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 170,
                            left: 5,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _imageFiles.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete, color: Colors.grey, size: 14,),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
                  SizedBox(width: 10),
                  Container(
                    height: 210,
                    width: 106,
                    decoration: BoxDecoration(
                      color: Color(0xfffacfe6),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                            onPressed: _getFromGallery,
                            icon: Icon(
                              Icons.image,
                              color: Colors.grey,
                            ),
                            iconSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                          width: 70,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                            onPressed: _getFromCamera,
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                            ),
                            iconSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('تفاصيل المنتج',style: TextStyle(
                        fontSize: 22
                    ),),
                    Text('اختر فئة واحدة على الاقل',style: TextStyle(
                        fontSize: 18,color: Colors.grey
                    ),),
                    SizedBox(height: 14,),
                    tag(),
                    SizedBox(height: 15,),
                    Text('أختر لون المنتج',style: TextStyle(
                        fontSize: 18,color: Colors.grey
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(width: 5,),
                        CircleAvatar(
                          backgroundColor: Colors.brown,
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Text('أختر قياس المنتج',style: TextStyle(
                        fontSize: 18,color: Colors.grey
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        sizeContainer('S'),
                        sizeContainer('M'),
                        sizeContainer('L'),
                        sizeContainer('XL'),
                        sizeContainer('XXL'),
                        sizeContainer('XXL'),

                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        btnShopItem2(context, 'رجوع', Colors.white),
                        SizedBox(width: 10,),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>addItemSecond()));
                            },
                            child: btnShopItem(context, 'التالي',Color(0xff202124)))
                      ],
                    )

                  ],
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
  Future<void> _getFromGallery() async {
    List<PickedFile>? pickedFiles = await ImagePicker().getMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFiles != null) {
      List<File> imageFiles =
      pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      setState(() {
        _imageFiles.addAll(imageFiles); // add images to the list
      });
    }
  }

  Future<void> _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      List<File> imageFiles = [File(pickedFile.path)];
      setState(() {
        _imageFiles.addAll(imageFiles); // add image to the list
      });
    }
  }
}
