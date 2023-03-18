import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/material/font.dart';
import 'package:tuliptest/models/category.dart';
import 'package:tuliptest/test/carsoulView.dart';
import '../Widgets/menuScreen.dart';
import '../models/posts.dart';
import '../test/Reels.dart';
import 'categoryPage.dart';

class landingPage extends StatefulWidget {

  final String? name;

  landingPage({this.name});

  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  bool _isLoading = false;

  Future<void> _refresh() async {
    // Implement the refresh functionality here, for example:
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xfffce3ee),
          leading:GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuScreen(name: widget.name,)));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffF38BB9), width: 1.3),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color(0xfffef4f8),
                ),
                child:  Icon(
                    Icons.menu,
                    color: Color(0xffA61379),
                  ),
                  // remove the onPressed property
                ),
              ),
            ),


          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 13, top: 10),
              child: Container(
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xffA61379),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      child: Image.asset('images/msg.png'),
                    )
                  ],
                ),
                width: 127,
                height: 46,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF38BB9), width: 1.3),
                    borderRadius: BorderRadius.circular(23.4),
                    color: Color(0xfffef4f8)),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xfffce3ee),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: reelsList(),
                ),
                SizedBox(height: 134, child: CategoryCarousel()),
                Container(
                  color: Color(0xffFEF1F6),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15, right: 40),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'افضل المختصين بحسب الفئات',
                        style: GoogleFonts.almarai(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Color(0xffFEF1F6),
                  height: 560,
                  child:categoryList()
                ),
                Stack(
                  children: [
                    Image.asset(
                      'images/Card 3.png',
                      fit: BoxFit.cover,
                      height: 134,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                          Center(child: Icon(Icons.error)),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 90,
                      child: IntrinsicWidth(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/btnfull.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Category',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

                ,
                SizedBox(height: 43),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: EdgeInsets.only(right: 45, top: 5),
                    child: Text(
                      '..أحدث الاعلانات',
                      style: GoogleFonts.almarai(
                        fontSize: 18,
                        fontWeight: font().fontWeightPrimary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 5,
                  color: Color(0xfffef1f6),
                ),

                SizedBox(height: 520, child: postList()),
              ],
            ),
          ),
        ),


      ),
    );
  }

}
