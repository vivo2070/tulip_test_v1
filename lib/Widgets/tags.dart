import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget tag()
{
  return Stack(
    overflow: Overflow.visible,
    children: [
      Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(
                color: Colors.pink,
                width: 0.5
            )
        ),
      ),
      Positioned(
        left: -6,
        bottom: 5,
        child: Image.asset(
          'images/shop.png',
          width: 50,
          height: 50,
        ),
      ),
      Positioned(
        left: 30,
        top: 6,
        child: Text('العناية بالبشرة',style: GoogleFonts.almarai(
            fontSize: 10,
            fontWeight: FontWeight.w600
        ),),
      )


    ],

  );
}