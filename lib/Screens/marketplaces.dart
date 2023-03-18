import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuliptest/Screens/profileScreen.dart';

import '../Widgets/btn.dart';
import '../Widgets/tags.dart';
import 'marketsScreen.dart';

class MarketTags extends StatefulWidget {
  const MarketTags({Key? key}) : super(key: key);

  @override
  _MarketTagsState createState() => _MarketTagsState();
}

class _MarketTagsState extends State<MarketTags> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay
    Future.delayed(Duration(microseconds: 0), () {
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MarketScreen()));
            },
          ),
        ],
      ),
      body: _isLoading
          ? _buildLoadingShimmer()
          : Column(
              children: [
               
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: tag(),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Row(
                          children: [
                            Icon(Icons.keyboard_double_arrow_down_outlined),
                            SizedBox(width: 2,),
                            Text('الاقرب اولا',style: GoogleFonts.almarai(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 14
                            ),),
                          ],
                        )
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('قائمة المتاجر المعروضة(10)',style: GoogleFonts.almarai(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 14
                        ),),
                      ),
                    ),

                  ],
                )
                ,
                Expanded(
                  child: _isLoading
                      ? _buildShimmerEffect()
                      : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));

                      }
                      ,child: marketPlaces(context));
                    },
                  ),
                )

              ],
            ),
    );
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
  Widget _buildLoadingShimmer() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

        )
      ),
    ]);
  }
}

Widget marketPlaces(BuildContext context)
{
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
    child: Card(
      elevation: 3,
      child: Container(
        height: 125,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          child: Icon(Icons.favorite_border,color: Colors.pinkAccent,),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5
                              )
                          ),
                        ),
                        Text(
                          'علي باريس',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'المنصور شارع ابو جعفر',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Icon(Icons.location_on, size: 13,color: Colors.pinkAccent,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            if (index < 5) {
                              return Icon(Icons.star,size: 15, color: Colors.yellow);
                            } else {
                              return Icon(Icons.star_border,size: 15,);
                            }
                          }),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '(50)',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.check,color: Colors.pinkAccent,),
                              SizedBox(width: 4),
                              Text('ميك اب '),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.check,color: Colors.pinkAccent,),
                              SizedBox(width: 4),
                              Text('عناية في البشرة '),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.check,color: Colors.pinkAccent,),
                              SizedBox(width: 4),
                              Text('عناية في الشعر '),

                            ],
                          ),
                        ),

                      ],

                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/08/5c/46/085c462ec91e044d01220aeb429b4852.jpg'
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
