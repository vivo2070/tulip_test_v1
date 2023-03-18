import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../material/font.dart';

Widget btn(BuildContext context, String btnName,Color btnColor) {
  return Container(
    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: font().fontWeightBtn,
            color: Colors.white)),
    height: 56,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55.0), color: btnColor),
  );
}


Widget btnShop(BuildContext context, String btnName,Color btnColor) {
  return Container(
    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: font().fontWeightBtn,
            color: Colors.white)),
    height: 56,
    width: 130,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), color: btnColor),
  );
}

Widget btnShopItem(BuildContext context, String btnName,Color btnColor) {
  return Container(
    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: font().fontWeightBtn,
            color: Colors.white)),
    height: 40,
    width: 169,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0), color: btnColor),
  );
}

Widget btnShopItem2(BuildContext context, String btnName,Color btnColor) {
  return Container(
    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: font().fontWeightBtn,
            color: Colors.black)),
    height: 40,
    width: 169,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black
      ),
        borderRadius: BorderRadius.circular(5.0), color: btnColor),
  );
}



Widget btnShopAd(BuildContext context, String btnName,Color btnColor) {
  return Container(
    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 17,
            fontWeight: font().fontWeightBtn,
            color: Colors.white)),
    height: 46,
    width: 328,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), color: btnColor),
  );


}
Widget sizeContainer(String text)
{
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.black,
              width: 1
          )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,

          ),
        ),
      ),
    ),
  );
}

Widget btnShopCart(BuildContext context, String btnName,Color btnColor) {
  return Container(
    
    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: font().fontWeightBtn,
            color: Colors.white)),
    height: 46,
    width: 169,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
         color: Color(0xffBE338E)),
  );
}

Widget btnAddBus(BuildContext context, String btnName,Color btnColor) {
  return Container(

    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: font().fontWeightBtn,
            color: Colors.white)),
    height: 46,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffBE338E)),
  );
}


Widget btnShopCartOrder(BuildContext context, String btnName,Color btnColor) {
  return Container(
    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: font().fontWeightBtn,
            color: Colors.white)),
    height: 56,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
        color: btnColor),
  );
}


Widget btnShopCartIcon(BuildContext context, String btnName,Color btnColor) {
  return Container(

    alignment: AlignmentDirectional.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(btnName,
            style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: font().fontWeightBtn,
                color: Color(0xffBE338E))),
        SizedBox(width: 5,),
        Icon(Icons.favorite_border,color:  Color(0xffBE338E),)
      ],
    ),


    height: 46,
    width: 169,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color:  Color(0xffBE338E),
        width: 1
      ),
        color: btnColor),
  );
}

Widget btnShopCartnoIcon(BuildContext context, String btnName,Color btnColor) {
  return Container(

    alignment: AlignmentDirectional.center,
    child: Text(btnName,
        style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: font().fontWeightBtn,
            color: Color(0xffBE338E))),


    height: 46,
    width: 169,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color:  Color(0xffBE338E),
            width: 1
        ),
        color: btnColor),
  );
}



