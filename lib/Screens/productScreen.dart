import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tuliptest/Screens/cartScreen.dart';
import 'package:tuliptest/Screens/marketsScreen.dart';
import 'package:tuliptest/Widgets/btn.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _currentPageIndex = 0;
  final List<String> _imageUrls = [
    'https://i.pinimg.com/564x/dd/18/c5/dd18c5d18bc2146fdea397d13a705db4.jpg',
    'https://via.placeholder.com/150x350',
    'https://via.placeholder.com/250x250',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffef1f6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
           Padding(
             padding: const EdgeInsets.only(top: 5,right: 10),
             child: Container(
               child: IconButton(
                 icon: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 18,),
                 onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MarketScreen()));
                 },
               ),
               decoration: BoxDecoration(
                 color: Colors.grey[200],
                 shape: BoxShape.circle
               ),
             ),
           )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(top: 5,left: 0),
            child: Row(
              children: [
                Icon(Icons.shopping_bag_outlined,color: Colors.grey,),
                SizedBox(width: 8,),
                Icon(Icons.favorite,color: Colors.black,),
              ],
            ),
          ),

        ),
        body: SingleChildScrollView(physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/2,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _imageUrls.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(

                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(_imageUrls[index]),

                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(120.0),
                            )
                          ),
                          // child: Image.network(
                          //   _imageUrls[index],
                          //   fit: BoxFit.cover,
                          // ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                color: Color(0xfffef1f6),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'د.ع 7,500',
                      style: GoogleFonts.almarai(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'أسم المنتج',
                      style: GoogleFonts.almarai(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Container(
                color: Color(0xfffef1f6),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.star_border),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(backgroundColor: Colors.redAccent,),
                    SizedBox(width: 8),
                    CircleAvatar(backgroundColor: Colors.brown),
                    SizedBox(width: 8),
                    CircleAvatar(backgroundColor: Colors.black54),
                    SizedBox(width: 8),
                    CircleAvatar(backgroundColor: Colors.amberAccent),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  'وصف المنتج',
                  style: GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص،لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص،',style: GoogleFonts.almarai(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[800],

                ),
                textAlign: TextAlign.end,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    btnShopCartIcon(context, 'حفظ', Colors.white),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                        },
                        child: btnShopCart(context, 'اضافة الى السلة', Colors.black)),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _imageUrls.length; i++) {
      list.add(
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 8.0,
          width: i == _currentPageIndex ? 24.0 : 8.0,
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            color: i == _currentPageIndex ? Color(0xffdb5fa3) : Colors.grey,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      );
    }
    return list;
  }
}
