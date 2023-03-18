import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tuliptest/Widgets/btn.dart';

import 'myScreens.dart';

class addProduct extends StatefulWidget {
  const addProduct({Key? key}) : super(key: key);

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  @override
  List<File> _imageFiles = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black54,),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>myScreen()));
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        'صالون بغداد',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'تحرير اعلان جديد',
                        style: TextStyle(
                          color: Color(0xffFF9083),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('images/logo.png'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(width: 10), // added SizedBox with width of 10
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _imageFiles.length,
                      itemBuilder: (context, index) {
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
                              left: 5
                              ,child: Container(
                                alignment: AlignmentDirectional.center,
                                height: 28,
                                width: 28
                                ,decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                                )
                                ,child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _imageFiles.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete, color: Colors.grey,size: 14,),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('تحرير النص',textDirection: TextDirection.rtl,style: GoogleFonts.almarai(
                      fontSize: 24
                  ),),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    height: 2,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                     textDirection: TextDirection.rtl,
                    maxLines: 3,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(
                    //     RegExp('[\u0600-\u06FF\s]'), // Arabic characters and spaces
                    //   ),
                    // ],
                    decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintText: 'اكتب شرح مختصر للمنتج'
                    ),
                  )
                  // Text('اكتب شرح مختصر للمنتج',textDirection: TextDirection.rtl,style: GoogleFonts.almarai(
                  //   fontSize: 20,
                  //   color: Colors.grey
                  //
                  // ),)

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: btnShopAd(context, 'نشر الاعلان', Color(0xffBE338E)),
          )
        ],
      )
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
