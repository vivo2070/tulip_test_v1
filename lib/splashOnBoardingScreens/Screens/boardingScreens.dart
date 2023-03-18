import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class One extends StatelessWidget {
  const One({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset('images/One.png',height: 400,)),
        SizedBox(height: 20,),
        Center(
          child: Text('!أحجزي مواعيدك',style: GoogleFonts.almarai(
              fontSize: 27.0,fontWeight: FontWeight.w400,color: Colors.grey
          ),),

        ),
        Text('       بسهولة',style: GoogleFonts.almarai(
            fontSize: 27.0,fontWeight: FontWeight.w400,color: Colors.black
        ),),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/4.png')
              )
            ),
          ),
        )
      ],
    );
  }
}

class Two extends StatelessWidget {
  const Two({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset('images/Two.png',height: 400,)),
        SizedBox(height: 20,),
        Center(
          child: Text('!تسوقي المستحضرات',style: GoogleFonts.almarai(
              fontSize: 27.0,fontWeight: FontWeight.w400,color: Colors.grey
          ),),

        ),
        Text('من منزلك',style: GoogleFonts.almarai(
            fontSize: 27.0,fontWeight: FontWeight.w400,color: Colors.black
        ),),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/4.png')
                )
            ),
          ),
        )
      ],
    );
  }
}

class Three extends StatelessWidget {
  const Three({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset('images/Three.png',height: 400,)),
        SizedBox(height: 20,),
        Center(
          child: Text('كل ما تحتاجين في',style: GoogleFonts.almarai(
              fontSize: 27.0,fontWeight: FontWeight.w400,color: Colors.grey
          ),),

        ),
        Text('مكان واحد',style: GoogleFonts.almarai(
            fontSize: 27.0,fontWeight: FontWeight.w400,color: Colors.black
        ),),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/4.png')
                )
            ),
          ),
        )
      ],
    );
  }
}


