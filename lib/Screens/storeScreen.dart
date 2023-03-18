import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuliptest/Screens/addITem.dart';

import '../Widgets/infoScreen.dart';
import '../Widgets/ratingScreen.dart';
import '../Widgets/servScreen.dart';
import '../test/gridTest.dart';
import 'initialScreen.dart';

class storeScreen extends StatefulWidget {
  const storeScreen({Key? key}) : super(key: key);

  @override
  State<storeScreen> createState() => _storeScreenState();
}

class _storeScreenState extends State<storeScreen> {

  bool loading = true;
  int index = 2;
  List myScreen = [
    Container(height: 500, child: InfoScreen()),
    Container(height: 500, child: ratingScreen()),
    ImageGridView(),
  ];

  bool _isLoading = true;
  int _selectedIndex = -1;
  String? authToken;
  int selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Set _isLoading to false after a delay of 2 seconds
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
      });
    });

    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        authToken = prefs.getString('authToken');
        loading=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(120)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/564x/d2/8a/48/d28a488054135a54ad5a56c75d3c804f.jpg'),
                          fit: BoxFit.cover)),
                ),
                // Cover Image
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios_sharp),
                      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InitialScreen())),
                      color: Colors.black,
                    ),
                  ),
                ),
                // Circular Avatar
                Positioned(
                  top: 140,
                  right: MediaQuery.of(context).size.width/3,


                  child: Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: _isLoading
                            ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                          ),
                        )
                            : Image.network(
                          'https://picsum.photos/id/1011/200/200',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // Title and Location
              ],
            ),
            SizedBox(height: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'علي باريس',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'بغداد-الكرادة',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1,
                            color: Color(0xff323232)
                        )
                    ),
                    width: 48,
                    height: 40,
                    child: Icon(Icons.edit),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>addItems()));
                    },
                    child: Container(
                      width: 200,

                      alignment: AlignmentDirectional.center,
                      height: 40,
                      decoration: BoxDecoration(

                        color: Color(0xffA61379),

                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline,color: Colors.white,),
                          SizedBox(width: 8,),
                          Text('اضافة منتجات',style: GoogleFonts.almarai(
                              fontSize: 15,
                              color: Colors.white
                          ),),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 3,
              color: Color(0xfffef1f6),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 30,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        index =
                            i; // update index to the selected screen's index
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        width: 90,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: index == i
                              ? Color(0xffA61379)
                              : Colors.transparent,
                          border: Border(),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          _getListTitle(i),
                          style: GoogleFonts.almarai(
                              fontSize: 17,
                              color:
                              index == i ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            myScreen[index],
          ],
        ),
      ),
    );
  }

  String _getListTitle(int index) {
    switch (index) {
      case 0:
        return 'المعلومات';
      case 1:
        return 'التقييم';
      case 2:
        return 'المتجر';
      default:
        return '';
    }
  }

}
