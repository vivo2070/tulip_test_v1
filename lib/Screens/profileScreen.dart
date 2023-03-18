import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuliptest/Screens/centerProfile.dart';
import 'package:tuliptest/Screens/userProfile.dart';
import 'package:tuliptest/Widgets/btnWidget.dart';

import '../Widgets/gridView.dart';
import '../Widgets/infoScreen.dart';
import '../Widgets/ratingScreen.dart';
import '../Widgets/servScreen.dart';
import '../Widgets/tags.dart';
import '../test/gridTest.dart';
import 'AYB/addBusinessOne.dart';
import 'initialScreen.dart';

enum DisplayMode { Grid, Staggered }

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DisplayMode _displayMode = DisplayMode.Grid;
  String? authToken;
  bool loading = true;
  bool _isLoading = true;


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

    return SafeArea(
      child: authToken!=''? userProfile():
      userProfile()



    );



    }
  }





