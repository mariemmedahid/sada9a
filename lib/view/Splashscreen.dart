import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:sadague/helper/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin/Mechari3.dart';
import 'admin/homeAdmin.dart';
import 'auth/login_view.dart';
import 'homepage.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    Timer(Duration(seconds: 4), () async {
      final SharedPreferences prefs = await _prefs;
int? type= prefs.getInt("type");
print("id"+type.toString());

     type!=null? type==1?Navigator.of(context)
         .pushReplacement(MaterialPageRoute(builder: (_) => HomeAdmin())): Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Homepage())):Navigator.of(context)
         .pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
    });
  }

  @override
  Widget build(BuildContext context) {
     FlutterStatusbarcolor.setStatusBarColor(Colors.grey.shade200);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),
            SizedBox(
              height: 20,
            ),
            // const CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            // )
          ],
        ),
      ),
    );
  }
}
