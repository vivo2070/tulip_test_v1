import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Screens/profileScreen.dart';
import 'package:tuliptest/Screens/storeScreen.dart';

import 'cartScreen.dart';
import 'landingPage.dart';
import 'marketsScreen.dart';

class InitialScreen extends StatefulWidget {

  final String? name;

  InitialScreen({this.name});

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  int _currentIndex = 1;
   List<Widget> Screens =[    ProfileScreen(),    landingPage(),    storeScreen(),    MarketScreen(),  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Screens[_currentIndex],
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.white,
          child: BottomAppBar(
            elevation: 0,
            shape: CircularNotchedRectangle(),
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
                        _onItemTapped(0);
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
                        _onItemTapped(1);
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
                SizedBox(
                  width: 40,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.grey),
                      onPressed: () {
                        _onItemTapped(2);
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
                        _onItemTapped(3);
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
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InitialScreen()));
          },
          tooltip: 'Image',
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/t-logo.png'),
              ),
              Positioned(
                top: 50,
                left: -4,
                child: Text(
                  'الرئيسية',
                  style: GoogleFonts.almarai(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

