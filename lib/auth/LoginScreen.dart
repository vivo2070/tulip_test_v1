import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Screens/landingPage.dart';
import 'package:tuliptest/auth/Register.dart';
import 'package:tuliptest/services/authService.dart';

import '../material/font.dart';
import '../material/padding.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
bool _passwordVisible=true;
TextEditingController phoneController=TextEditingController();
TextEditingController passController=TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xffFEF1F6),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 29),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                        },
                        child: Text('إنشاء حساب',
                            style: GoogleFonts.almarai(
                              fontSize: 17,
                              color: Color(0xffDB5FA3),
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 29),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_sharp),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                color: Colors.white,
                height: 2,
                width: double.infinity,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage('images/5.png')),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'أهلا بعودتك',
                        style: GoogleFonts.almarai(
                            fontWeight: font().fontWeightPrimary,
                            fontSize: font().fsTitle,
                            color: font().fcGrey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'تسجيل الدخول',
                        style: GoogleFonts.almarai(
                            fontWeight: font().fontWeightPrimary,
                            fontSize: font().fsTitle,
                            color: font().fcBlack),
                      ),
                    ],
                  ),
                ],
              )

              ,
              SizedBox(height: 10,),
              Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: padding().formPadding),
                          child: Text(
                            'رقم الهاتف',
                            style: GoogleFonts.almarai(
                                fontSize: font().fsHint,
                                fontWeight: font().fontWeightSecondary,
                                color: font().HintColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:padding().formPadding ),
                        child: TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Text(
                                '+964',
                                style: TextStyle(
                                  fontWeight: font().fontWeightPrimary,
                                  color: font().fcBlack,
                                  fontSize: font().fsNumber,
                                ),
                              ),
                            ),
                            prefixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                          ),
                          // keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: padding().formPadding),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Text(
                        'كلمة المرور',
                        style: GoogleFonts.almarai(
                            fontSize: font().fsHint,
                            fontWeight: font().fontWeightSecondary,
                            color: font().HintColor),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:padding().formPadding ),
                        child: TextFormField(
                          controller: passController,
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: padding().formPadding),
                child: GestureDetector(
                  onTap: () {
                    print('tap');
                     signIn(phoneController.text, passController.text, context);
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('تسحيل الدخول',style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: font().fontWeightBtn,
                        color: Colors.white
                    )),
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55.0),
                        color: Color(0xffBE338E)
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}



Future<void> sendLoginRequest(String email, String password,BuildContext context) async {

  final response = await http.post(
    Uri.parse("https://www.tulipm.net/api/Persons/Login/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print('success');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>landingPage()));
    print(response.body);
  } else {
    // Login failed
    print('Failed to log in: ${response.body}');
  }
}

