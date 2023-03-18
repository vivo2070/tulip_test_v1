import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuliptest/auth/OTP/otpScreen.dart';

import '../Screens/initialScreen.dart';
import '../Screens/landingPage.dart';
import '../models/userInfo.dart';

void signIn(String phone, password, BuildContext context) async {
  try {
    http.Response response = await post(
      Uri.parse("https://www.tulipm.net/api/Persons/Login/${phone},${password}"),
      body: {
        'userName':phone,
        'password':password
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      if (data['msg'] == "اسم المستخدم او كلمة المرور غير صحيحة") {
        print('Login failed');
        print(response.body);
        showAlertDialog(context, data['msg']);
      } else {
        print('Login successfully');

        // Store the authentication token and user ID in SharedPreferences

        String? token = data['data']['token'];
        int? userId = data['data']['id'];
        String? name = data['data']['name'];
        if (token != '' && userId != '' && name != '') {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('authToken', token!);
          prefs.setInt('userId', userId!);
          prefs.setString('userName', name!);
          // Navigate to the next screen passing the user object as a parameter
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InitialScreen(name: name,)),
          );

        } else {
          // Handle the error
        }
      }
    } else {
      var data = jsonDecode(response.body.toString());
      print('Login failed');
      print(response.body);
      showAlertDialog(context, data['msg']);
    }
  } catch(e) {
    print(e.toString());
    showAlertDialog(context, 'حدث خطأ في تسجيل الدخول');
  }
}




void reg(String phone , password,BuildContext context) async {


  try{

    http.Response response = await post(
      Uri.parse("https://www.tulipm.net/api/Persons/RegisterAccount"),
      body: {
        'phone':phone,
        'email':'z@yahoo.com',
        'name':'testname',
        'userName':'flutter',
        'password': password,
        'code':'123456'
      },
        headers: {
          "Accept": "application/json",
          "content-type":"application/json"
        }

    );


    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['msg']);
      if(data['msg']=="هذا الحساب موجود سابقا")
      {
        print('الحساب موجود مسبقا');
        print(response.body);
        showAlertDialog(context, data['msg']);
      }
      else if(data['msg']=="تم تسجيل حساب بنجاح")
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen()));
      }
    }



    else {
      var data = jsonDecode(response.body.toString());
      print('failed');
      print(response.body);
      print(data['msg']);



    }
  }catch(e){
    print(e.toString());
  }
}

register(String phone, password,BuildContext context) async {
  Map data = {
    'phone':phone,
    'email':'testemail.com',
    'name':'testuser',
    'userName':'testuser',
    'password': password,
    'code':'000000'

  };
  print(data);

  String body = json.encode(data);
  var url = "https://www.tulipm.net/api/Persons/RegisterAccount";
  try
  {
    var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type":"application/json"
        }
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['msg']);
      if(data['msg']=="هذا الحساب موجود سابقا")
      {
        print('الحساب موجود مسبقا');
        print(response.body);
        showAlertDialog(context, data['msg']);
      }
      else if(data['msg']=="حدث خطا اثناء عملية جلب البيانات")
      {
        print('الحساب موجود مسبقا');
        print(response.body);
        showAlertDialog(context, data['msg']);
      }




      else if(data['msg']=="تم تسجيل حساب بنجاح")
      {
        
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen()));

      }
    }

    else {
      print('error');
    }
  }
  catch(e)
  {
    print(e.toString());
  }

}



showAlertDialog(BuildContext context,String msg) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text(msg),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}