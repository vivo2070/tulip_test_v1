import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reelsIcon()
{
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            decoration: BoxDecoration(
              shape: BoxShape.circle,

            ),
            child: Column(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '22',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Column(
              children: [
                Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '22',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Column(
              children: [
                Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '22',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        // Add any other child elements you want to overlay on the video here
      ],
    ),
  );
}