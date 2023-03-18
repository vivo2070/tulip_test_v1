import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Screens/productScreen.dart';

import '../models/posts.dart';

enum DisplayMode { Grid, Staggered }

class ImageGridView extends StatefulWidget {
  @override
  _ImageGridViewState createState() => _ImageGridViewState();
}

class _ImageGridViewState extends State<ImageGridView> {
  DisplayMode _displayMode = DisplayMode.Grid;

  void _toggleDisplayMode() {
    setState(() {
      _displayMode = _displayMode == DisplayMode.Grid
          ? DisplayMode.Staggered
          : DisplayMode.Grid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'images/item.jpg',
      'images/item.jpg',
      'images/item.jpg',


    ];

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Card(
                elevation: 3,
                child: Container(
                  width: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _displayMode = DisplayMode.Grid;
                          });
                        },
                        icon: Icon(Icons.grid_view,size: 20,),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _displayMode = DisplayMode.Staggered;
                          });
                        },
                        icon: Icon(Icons.view_list,size: 20,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _displayMode == DisplayMode.Grid
                ? Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: Image.asset('images/item.jpg', fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height/5-10,
                          child: Image.asset('images/item.jpg', fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height/5-10,
                          child: Image.asset('images/item.jpg', fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ],
            )

        : Container(height: 400, child: postList()),
          ],
        ),
    );
  }
}
// GridView.builder(
// shrinkWrap: true,
// physics: BouncingScrollPhysics(),
// itemCount: imageUrls.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// childAspectRatio: 3 / 4,
// mainAxisSpacing: 4.0,
// crossAxisSpacing: 4.0,
// ),
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
// child: SizedBox(
// height: 500,
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.grey.withOpacity(0.5),
// spreadRadius: 3,
// blurRadius: 7,
// offset: Offset(0, 3),
// ),
// ],
// ),
// child: Column(
// children: [
// Expanded(
// flex:2,
//
// child: GestureDetector(
// onTap: (){
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
// },
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
// image: DecorationImage(
// image: AssetImage(imageUrls[index]),
// fit: BoxFit.contain,
// ),
// ),
// child: Align(
// alignment: Alignment.topLeft,
// child: IconButton(
// onPressed: () {},
// icon: Icon(Icons.star,color: Colors.amberAccent,),
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// Expanded(
// flex: 1,
// child: Container(
// height: 90,
// width: MediaQuery.of(context).size.width,
// color: Colors.grey[300],
// child: Column(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Text('سوفاج',style: GoogleFonts.almarai(
// fontSize: 19,
// fontWeight: FontWeight.w600,
// ),),
// Text('عطر مميز من شركة ديور',style: GoogleFonts.almarai(
// fontSize: 15,
// color: Colors.grey,
// fontWeight: FontWeight.w600,
// ),
// overflow: TextOverflow.ellipsis,),
// Text(' د.ع  40,000 ',style: TextStyle(
// color: Color(0xffec7db9),fontWeight: FontWeight.w700,
// fontSize: 18
// ),)
// ],
// ),
// ),
// )
//
// ],
// ),
// ),
// ),
// );
//
//
//
//
//
//
// },
// )