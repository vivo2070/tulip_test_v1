import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuliptest/Screens/AYB/addBusinessTwo.dart';
import 'dart:io';

import 'package:tuliptest/Screens/profileScreen.dart';
import 'package:tuliptest/test/gridTest.dart';

import '../../Widgets/btn.dart';

class addBusinessOne extends StatefulWidget {
  const addBusinessOne({Key? key}) : super(key: key);

  @override
  State<addBusinessOne> createState() => _addBusinessOneState();
}

class _addBusinessOneState extends State<addBusinessOne> {
  List<File> _imageFiles = [];
  String? _selectedOption;
  CircleAvatar _avImage = CircleAvatar(
    child: Image.asset('images/lo.png'),
    radius: 45,
    backgroundColor: Color(0xffF38BB9),
  );

  BoxDecoration _containerDecoration=BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/cover.png'),
      fit: BoxFit.cover
    )
  );
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
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
              width: MediaQuery.of(context).size.width/3,
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
            Stack(
              overflow: Overflow.visible,
              children: [
                GestureDetector(
                  onTap: _getFromGallery,
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: _containerDecoration,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 0,
                  right: 0,

                  child: Center(child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1
                      )
                    ),
                    child: _avImage
                  )),
                ),
                Positioned(
                  top: 130,
                  left: 50,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      onPressed: _getFromGalleryAvatar,
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      iconSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Text('* حقل اجباري',style: TextStyle(
                    fontSize: 18
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('* اسم العمل التجاري',style: TextStyle(
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
                      hintText: 'ادخل اسم المتجر هنا'
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DropdownButtonFormField<String>(

                    decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: '* نوع العمل التجاري',
                      hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    value: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                    items: [    DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),    DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),    DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),  ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.black54,
                  ),
                  Text('اختر فئة العمل من القائمة',style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    color: Colors.grey

                  ),
                    textDirection: TextDirection.rtl,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text('اضف خدمة من قائمة الخدمات',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 15
                    ),),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add,color: Colors.black54,),
                        Text('اضافة خدمة',style: TextStyle(
                            fontSize: 22,
                            color: Colors.black54

                        ),),

                      ],
                    ),
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.black54
                        )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('* عنوان العمل التجاري',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                    textDirection: TextDirection.rtl,),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.black54,
                  ),
                  Text('اضف عنوانك المفضل',style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey

                  ),
                    textDirection: TextDirection.rtl,),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  btnShopCartnoIcon(context,'رجوع',Colors.white),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>addBusinessTwo()));
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
  Future<void> _getFromGallery() async {
    List<PickedFile>? pickedFiles = await ImagePicker().getMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFiles != null) {
      List<File> imageFiles = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      setState(() {
        _imageFiles.addAll(imageFiles); // add images to the list
        // update container decoration with the first selected image
        if (_imageFiles.isNotEmpty) {
          DecorationImage image = DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(_imageFiles[0]),
          );
          _containerDecoration = BoxDecoration(
            image: image,
            color: Colors.white,
          );
        }
      });
    }
  }

  Future<void> _getFromGalleryAvatar() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      setState(() {
        _avImage = CircleAvatar(
          backgroundColor: Color(0xffF38BB9),
          backgroundImage: FileImage(imageFile),
          radius: 45,
        );
      });
    }
  }





}