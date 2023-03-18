import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'عن صالون بغداد',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'نحن نقدم منتجات عالية الجودة بأسعار مناسبة للجميع',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'موقعنا على الخريطة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: Placeholder(),
            ),
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 180),
                child: Text('مواقعنا على التواصل الاجتماعي',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.tiktok,size: 40,),
                    onPressed: () {},
                    color: Color(0xFFA61379),
                    tooltip: 'TikTok',
                  ),
                  IconButton(
                    icon: Icon(Icons.facebook,size: 40),
                    onPressed: () {},
                    color: Color(0xFFA61379),
                    tooltip: 'Facebook',
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram,size: 40),
                    onPressed: () {},
                    color: Color(0xFFA61379),
                    tooltip: 'Instagram',
                  ),
                  IconButton(
                    icon: Icon(Icons.language,size: 40),
                    onPressed: () {},
                    color: Color(0xFFA61379),
                    tooltip: 'Website',
                  ),
                  IconButton(
                    icon: Icon(Icons.whatsapp,size: 40),
                    onPressed: () {},
                    color: Color(0xFFA61379),
                    tooltip: 'WhatsApp',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
