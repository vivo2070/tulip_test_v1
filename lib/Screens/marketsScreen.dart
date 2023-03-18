import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuliptest/Widgets/btn.dart';

import 'initialScreen.dart';
import 'marketplaces.dart';

class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading data
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xfffce3ee),
          title: Text("المتاجر",style: GoogleFonts.almarai(
            color: Colors.black
          ),),
          leading: IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
            onPressed: () {
              // Handle search icon tap here
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward,color: Colors.black,),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InitialScreen()));
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'أختاري الفئة التي تبحثين عنها',
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
            ),
            Expanded(
              child: _isLoading
                  ? _buildShimmerEffect()
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MarketTags()));

                            },
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],

                                border: Border.all(color: Colors.white, width: 1),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -40,
                                    left: 100,
                                    child: Container(
                                      width: 200,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('images/shop.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 30,
                                    top: 60,
                                    child: Text(
                                      'ميك اب',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ));
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Stack(
                children: [
                  Positioned(
                      left: 10,
                      top: 50,
                      child: btnShop(context, 'عرض المتاجر', Colors.black)),
                  Positioned(
                    left: 100,
                    child: Container(
                      width: 200,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/shop.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 50,
                    child: Text(
                      'ميك اب',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      period: Duration(seconds: 2),
    );
  }
}
