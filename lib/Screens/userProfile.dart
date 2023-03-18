import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'AYB/addBusinessOne.dart';
import 'initialScreen.dart';

class userProfile extends StatefulWidget {
  const userProfile({Key? key}) : super(key: key);

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {

  bool loading = true;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
            ),
            // Circular Avatar
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
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

            SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>addBusinessOne()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFEF1F6),
                      border: Border.all(
                          color: Color(0xffA61379),
                          width: 2
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('اضافة عملك الخاص',style: GoogleFonts.almarai(
                            fontSize: 18,
                            color: Color(0xff2B2B2B)
                        ),),
                        SizedBox(width: 20,),
                        Image.asset('images/pre.png'),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
