import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuliptest/Widgets/btn.dart';
import 'package:tuliptest/auth/LoginScreen.dart';
import 'package:tuliptest/material/font.dart';
import 'package:tuliptest/material/padding.dart';
import 'package:tuliptest/services/authService.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}


bool _passwordVisible = true;
 TextEditingController phoneController=TextEditingController();
TextEditingController passController=TextEditingController();
class _RegisterState extends State<Register> {


  @override

  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFEF1F6),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Image.asset('images/fr.png'),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 29),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            },
                            child: Text('تسجيل دخول ',
                                style: GoogleFonts.almarai(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                ),
                            textDirection: TextDirection.rtl,),
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

                  Positioned(
                    top: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage('images/4.png'),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'مستخدم جديد',
                              style: GoogleFonts.almarai(
                                  fontWeight: font().fontWeightPrimary,
                                  fontSize: font().fsTitle,
                                  color: font().fcGrey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'إنشاء حساب',
                              style: GoogleFonts.almarai(
                                  fontWeight: font().fontWeightPrimary,
                                  fontSize: font().fsTitle,
                                  color: font().fcBlack),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(height: 30,),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: padding().formPadding),
                        child: TextFormField(

                          controller: phoneController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            hintText: '',
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
                            const BoxConstraints(minWidth: 0, minHeight: 0),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: padding().formPadding),
                          child: Text(
                            'البريد الالكتروني (أختياري)',
                            style: GoogleFonts.almarai(
                                fontSize: font().fsHint,
                                fontWeight: font().fontWeightSecondary,
                                color: font().HintColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding().formPadding),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              isDense: true, hintText: 'Tulip@gmail.com'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: padding().formPadding),
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



              const SizedBox(
                height: 70,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: padding().formPadding),
                child: GestureDetector(
                    onTap: () async {
                      print('log');
                      register(
                            phoneController.text, passController.text, context);
                    },
                    child:
                        btn(context, 'إرسال رمز التفعيل',Color(0xffBE338E))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
