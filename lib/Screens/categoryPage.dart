import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Screens/initialScreen.dart';
import 'package:tuliptest/Widgets/btn.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('الصالونات',
                style: GoogleFonts.almarai(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            SizedBox(width: 10),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => InitialScreen()));
              },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              )),
        ],
        elevation: 1,
        backgroundColor: Colors.white,
        leading: Row(
          children: [
            Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list_outlined,
                      color: Colors.black,
                    ))),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.map_outlined, color: Colors.black))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 151,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/Card 1.png'))),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  child: Container(
                    height: 185,
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Vitalia',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'اربيل,شارع 100',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: Color(0xffEA6CB0),
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      RatingBar(
                                        textDirection: TextDirection.rtl,
                                        itemSize: 14,
                                        initialRating: 3,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 2.0),
                                        ratingWidget: RatingWidget(
                                          full: Icon(Icons.star,
                                              color: Colors.amber),
                                          half: Icon(Icons.star_half,
                                              color: Colors.amber),
                                          empty: Icon(Icons.star_border,
                                              color: Colors.amber),
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      SizedBox(width: 5),
                                      Text('(12)'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Text('قص شعر'),
                                          Icon(Icons.done,color: Color(0xffEA6CB0),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('مكياج'),
                                          Icon(Icons.done,color: Color(0xffEA6CB0),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.arrow_circle_left),
                                          Text('عرض الخدمات'),
                                        ],
                                      ),
                                      SizedBox(width: 12,),

                                      Container(

                                        alignment: AlignmentDirectional.center,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.calendar_month, color: Colors.white,size: 14,),
                                            SizedBox(width: 5),
                                            Text(
                                              'حجز موعد',
                                              style: GoogleFonts.almarai(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        width: 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xffBE338E),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: 114,
                          height: 109,
                          child: Image.asset(
                            'images/vi.png',
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
