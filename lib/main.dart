import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuliptest/Screens/addITem.dart';
import 'package:tuliptest/Screens/addProduct.dart';
import 'package:tuliptest/Screens/cartScreen.dart';
import 'package:tuliptest/Screens/initialScreen.dart';
import 'package:tuliptest/Screens/landingPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tuliptest/Screens/productScreen.dart';
import 'package:tuliptest/Screens/profileScreen.dart';
import 'package:tuliptest/Widgets/menuScreen.dart';
import 'package:tuliptest/auth/LoginScreen.dart';
import 'package:tuliptest/splashOnBoardingScreens/splashScreen.dart';
import 'package:tuliptest/test/facebook.dart';
import 'package:tuliptest/test/carsoulView.dart';
import 'package:tuliptest/test/gridTest.dart';
import 'package:tuliptest/test/ikView.dart';
import 'package:tuliptest/test/services.dart';
import 'package:tuliptest/test/storyTest.dart';
import 'package:tuliptest/test/testRes.dart';
import 'package:tuliptest/test/Reels.dart';
import 'package:tuliptest/videoPlayer.dart';

import 'Screens/additemThird.dart';
import 'Screens/categoryPage.dart';
import 'Screens/marketplaces.dart';
import 'Screens/marketsScreen.dart';
import 'Screens/myScreens.dart';
import 'auth/authLandingPage.dart';
import 'generated/l10n.dart';
import 'models/posts.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String authToken = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Retrieve the authentication token from SharedPreferences
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        authToken = prefs.getString('authToken') ?? '';
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (isLoading) {
      // Show a loading indicator while retrieving the authentication token
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xfffce3ee),
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 1,
            ),
          ),
        ),
      );
    } else {
      // Check if the user is already authenticated
      if (authToken.isNotEmpty) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: InitialScreen(),
        );
      } else {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: splashScreen(),
        );
      }
    }
  }
}




