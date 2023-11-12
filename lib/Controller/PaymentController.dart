import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sadague/API.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constante.dart';
import '../Model/Aides.dart';
import '../Model/Projets.dart';
import 'package:http/http.dart' as http;

import '../helper/size_config.dart';
import '../view/homepage.dart';

class PayementController extends GetxController{


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
bool isloading=false;


 Future AddAide(int id_project,int montant,int pytpe,BuildContext context) async {
isloading=true;
update();
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
final SharedPreferences prefs = await _prefs;

var now = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String formattedDate = formatter.format(now);


Map<String, dynamic> payload = {
  "id_donneur":prefs.getInt("id") ,
  "id_project": id_project,
  "montant": montant,
  "payment_type": pytpe,
   "datePost":formattedDate

};


String jsonPayload = json.encode(payload);
final reponse = await http.post(
  Uri.parse(INSERT_AIDE),
  headers: {'Content-Type': 'application/json'},

  body:jsonPayload,

);
print("st"+reponse.statusCode.toString());


if(reponse.statusCode==200){
 // ignore: use_build_context_synchronously
 AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.leftSlide,
                          headerAnimationLoop: false,
                          showCloseIcon: true,
                          btnOkText: "تم",


                          body:         Center(
                            child: Column(
                              children: [

                                Text("تم بنجاح "),
                                SvgPicture.asset(
                                  'assets/images/ahseno-ayah.svg',
                                  width: getProportionateScreenWidth(220),
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                          btnOkOnPress: () {
                            Get.back();
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (_) =>Homepage()));
                            debugPrint('OnClcik');
                          },
                        ).show();

}




   
  }

}