import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Screens/productScreen.dart';
import 'package:tuliptest/services/authService.dart';

import '../Widgets/btn.dart';
import 'marketsScreen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _counter = 1;
  double _price = 7500.0; // price of each item
  double _totalPrice = 7500.0; // initial total price for one item

  void _incrementCounter() {
    setState(() {
      _counter++;
      _totalPrice = _counter * _price;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
        _totalPrice = _counter * _price;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 10),
              child: Container(
                width: 35,
                height: 35,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                    size: 15,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MarketScreen()));
                  },
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
              ),
            )
          ],
          leading: GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
            },
            child: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'السلة',
            style: GoogleFonts.almarai(fontSize: 18, color: Colors.black),
          ),
        ),
        body:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2,
                    child: Container(
                      height: 125,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'اسم المنتج',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'وصف المنتج',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Color(0xffD2489F),
                                                  width: 1)),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: _decrementCounter,
                                                child: Container(
                                                  alignment:
                                                  AlignmentDirectional.center,
                                                  width: 25,
                                                  height: 25,
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8.0),
                                              Text(
                                                '$_counter',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Cairo',
                                                ),
                                              ),
                                              SizedBox(width: 8.0),
                                              GestureDetector(
                                                onTap: _incrementCounter,
                                                child: Container(
                                                  alignment:
                                                  AlignmentDirectional.center,
                                                  width: 25,
                                                  height: 25,
                                                  child: Text(
                                                    '+',
                                                    style: TextStyle(
                                                        color: Color(0xffD2489F),
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '$_totalPrice د.ع',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Cairo',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 5,
                            child: Image.network(
                              'https://i.pinimg.com/564x/dd/18/c5/dd18c5d18bc2146fdea397d13a705db4.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                },
              ),

              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 59,
                  alignment: AlignmentDirectional.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_totalPrice * 3} د.ع', // multiply by the number of items (3 in this example)
                        style: TextStyle(
                          color: Color(0xffD2489F),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      Text(
                        ': السعر الإجمالي',
                        style: GoogleFonts.almarai(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 59,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الدفع عن الاستلام', // multiply by the number of items (3 in this example)
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      Text(
                        ' طريقة الدفع',
                        style: GoogleFonts.almarai(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: GestureDetector(
                    onTap: (){
                      showAlertDialog(context, 'تم الطلب بنجاح');
                    },
                    child: btnShopCartOrder(context, 'ارسال الطلب', Color(0xffD2489F))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
