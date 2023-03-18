import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuliptest/Screens/addProduct.dart';
import 'package:tuliptest/Screens/initialScreen.dart';
import 'package:tuliptest/Screens/productScreen.dart';

class myScreen extends StatelessWidget {
  const myScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              screen('اضافة اعلان',context,addProduct()),
              screen('اضافة منتج',context,addProduct()),
              screen('المنتج',context,ProductScreen())

            ],
          ),
        ),
      ),
    );
  }
}

Widget screen(String title,BuildContext context,Widget theScreen)
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> theScreen));
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 22
        ),),
      ),
    ),
  );
}
