import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomReel()
{
  return Container(
    height: 60,
    color: Colors.transparent,
    child: BottomAppBar(

      color: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.person, color: Colors.grey),
                onPressed: () {

                },
              ),
              Positioned(
                top: 30,
                child: Text(
                  'الحساب',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.map, color: Colors.grey),
                onPressed: () {

                },
              ),
              Positioned(
                top: 30,
                child: Text(
                  'الخريطة',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Container(
            child: Image.asset('images/logo-grey.png'),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,color: Colors.grey[300]
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.grey),
                onPressed: () {

                },
              ),
              Positioned(
                top: 30,
                child: Text(
                  'الاشعارات',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart_sharp, color: Colors.grey),
                onPressed: () {

                },
              ),
              Positioned(
                top: 30,
                child: Text(
                  'المتاجر',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    ),

  );
}