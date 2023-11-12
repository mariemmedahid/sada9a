import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sadague/view/admin/add_mechrou3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constante.dart';
import '../../Controller/AdminController.dart';
import '../../helper/size_config.dart';
import '../News.dart';
import '../auth/login_view.dart';
import 'Mechari3.dart';
import 'add_5abar.dart';

class HomeAdmin extends StatefulWidget {
  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferences? prefs;

  Future initPerfs() async {
    prefs = await _prefs;
  }
@override
  void initState() {
    // TODO: implement initState
  initPerfs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      init:AdminController() ,
      builder: (controller) {
        return Scaffold(
         body:     SafeArea(
           child: Container(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 InkWell(
                   onTap: () async {
                     await FirebaseAuth.instance.signOut();
                     await  prefs?.remove("id");
                     await  prefs?.remove("nom");
                     Get.offAll(LoginView());
                   },
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Icon(Icons.logout),
                   ),
                 ),
                 SizedBox(height: getProportionateScreenHeight(20),),
                 controller.isloading?Center(child: CircularProgressIndicator())
                     :       Row(
                   children: [


                     Expanded(child:
                     Padding(
                       padding: const EdgeInsets.all(15),
                       child: Container(
                         color: primaryColor,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             children: [
                               Text(controller.statistique[0].nb_projet.toString(),style: TextStyle(color: Colors.white,fontSize: 14),),
                               SizedBox(height: 30,),
                               Text("المشاريع",style: TextStyle(color: Colors.white,fontSize: 12),)
                             ],
                           ),
                         ),
                       ),
                     )),
                     Expanded(child:
                     Padding(
                       padding: const EdgeInsets.all(15),
                       child: Container(
                         color: primaryColor,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             children: [
                               Text(controller.statistique[0].nb_aide.toString(),style: TextStyle(color: Colors.white,fontSize: 14),),
                               SizedBox(height: 30,),
                               Text("المساعدين",style: TextStyle(color: Colors.white,fontSize: 12),)
                             ],
                           ),
                         ),
                       ),
                     )),
                     Expanded(child:
                     Padding(
                       padding: const EdgeInsets.all(15),
                       child: Container(
                         color: primaryColor,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             children: [
                               Text(controller.statistique[0].total_montant.toString(),style: TextStyle(color: Colors.white,fontSize: 14),),
                               SizedBox(height: 30,),
                               Text("المساعدات",style: TextStyle(color: Colors.white,fontSize: 12),)
                             ],
                           ),
                         ),
                       ),
                     )),

                   ],
                 ),
                 SizedBox(height: getProportionateScreenHeight(40),),
                 Expanded(
                   child: Row(children: [
  Expanded(
        child: InkWell(
          onTap: (){
            Get.to(AddMchrou3());
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              color:Colors.grey.shade300,
              child:Column(
                children: [
                    Icon(Icons.add,size: 75,color: primaryColor,),
                    SizedBox(height: 20,),
                    Text("اضافة مشروع")
                ],
              )),
          ),
        ),
  ),
  Expanded(
        child: InkWell(
          onTap: (){
            Get.to(Mechari3ADM());
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                color:Colors.grey.shade300,
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/images/main2.svg",
                          color: primaryColor,

                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("المشاريع")
                    ],
                )),
          ),
        ),
  ),
],),
                 ),
                 Expanded(child:Row(children: [
                 Expanded(
                   child: InkWell(
                     onTap: (){
                       Get.to(Newpage());
                     },
                     child: Padding(
                       padding: const EdgeInsets.all(20),
                       child: Container(
                           color:Colors.grey.shade300,
                           child: Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: SvgPicture.asset(
                                   "assets/images/main3.svg",
                                   color: primaryColor,
                                 ),
                               ),
                               SizedBox(height: 20,),
                               Text("مقالات")
                             ],
                           )),
                     ),
                   ),
                 ),
                 Expanded(
                   child: InkWell(
                     onTap: (){
                       Get.off(Add5abar());
                     },
                     child: Padding(
                       padding: const EdgeInsets.all(20),
                       child: Container(
                           color:Colors.grey.shade300,
                           child:const Column(
                             children: [
                               Icon(Icons.add,size: 80,color: primaryColor,),
                               SizedBox(height: 20,),
                               Text("اضافة مقال")
                             ],
                           )),
                     ),
                   ),
                 ),

               ],), )  ,
// Row(children: [
//   Expanded(
//         child: InkWell(
//           onTap: (){
//
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Container(
//               color:Colors.grey.shade300,
//               child:Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SvgPicture.asset(
//                       "assets/images/aides.svg",
//                       color: primaryColor,
//                     ),
//                   ),
//                   SizedBox(height: 20,),
//                   Text("التبرعات")
//                 ],
//               )),
//           ),
//         ),
//   ),
//
// ],),
                 Spacer(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("صدقة 1.0.0"),
                     Image.asset(
                       'assets/images/logo.png',
                       height: 40,
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ),

        );
      }
    );
  }
}
