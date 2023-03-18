import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget btnWidget(String text,IconData iconData,Color btnColor,Color eleColor,Color brdColor)
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: brdColor,
          width: 2
        ),
          color: btnColor
      ),
      width: 190,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(iconData,color: eleColor,),
          Text(
            text,style: TextStyle(
              color:eleColor,
              fontSize: 22
          ),
          ),

        ],
      )


    ),
  );
}