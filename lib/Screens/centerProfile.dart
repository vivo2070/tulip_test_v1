import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../Widgets/infoScreen.dart';
import '../Widgets/ratingScreen.dart';
import '../Widgets/servScreen.dart';
import '../test/gridTest.dart';
import 'initialScreen.dart';

class centerProfile extends StatefulWidget {
  const centerProfile({Key? key}) : super(key: key);

  @override
  State<centerProfile> createState() => _centerProfileState();
}

class _centerProfileState extends State<centerProfile> {

  bool loading = true;
  int index = 3;
  List myScreen = [
    Container(height: 500, child: MyExpansionTile()),
    Container(height: 500, child: InfoScreen()),
    Container(height: 500, child: ratingScreen()),
    ImageGridView(),
  ];

  bool _isLoading = true;
  int _selectedIndex = -1;
  List<String> containerList = ['اعلاناتي', 'تقييم', 'معلومات', 'خدمات'];
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
                              'https://picsum.photos/id/237/200/300'),
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
                        color: Color(0xffFFFFFFCC),
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
                  top: 150,
                  right: 10,
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
                Positioned(
                  bottom: -60,
                  right: 10,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: Color(0xffD2489F), width: 1),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                        size: 16,
                      ),
                      onPressed: () {
                        // TODO: Handle camera button pressed
                      },
                    ),
                  ),
                ),
                // Title and Location
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'علي باريس',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'بغداد-الكرادة',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
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
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: MediaQuery.of(context).size.width/2 - 14,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color:  Color(0xffA61379),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.telegram,color: Color(0xffA61379),),
                        SizedBox(width: 8,),
                        Text('مراسلة',style: GoogleFonts.almarai(
                            fontSize: 15
                        ),),

                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width/2 - 14,

                    alignment: AlignmentDirectional.center,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffA61379),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month,color: Colors.white,),
                        SizedBox(width: 8,),
                        Text('حجز موعد',style: GoogleFonts.almarai(
                            fontSize: 15,
                            color: Colors.white
                        ),),

                      ],
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
                itemCount: 4,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        index =
                            i; // update index to the selected screen's index
                      });
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      width: 90,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: index == i
                            ? Color(0xff1F1F1F)
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
        return 'الخدمات';
      case 1:
        return 'المعلومات';
      case 2:
        return 'التقييم';
      case 3:
        return 'اعلاناتي';
      default:
        return '';
    }
  }

}
