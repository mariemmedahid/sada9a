import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sadague/Constante.dart';
import 'package:sadague/helper/size_config.dart';
import 'package:sadague/view/admin/DetailMchrou3.dart';

import '../Model/Projets.dart';
import '../view/Detail.dart';
import '../view/admin/ges_mechrou3.dart';
import 'Mybutton.dart';

Widget ProjetCard(String image, String text, BuildContext context, int total ,int  current,Projets projet) {
  return InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail(proj: projet,)));

    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Card(
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                 // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: getProportionateScreenHeight(150),
            ),

           Stack(
              children: [
                SizedBox(
                  height: 16,
                  child: LinearProgressIndicator(
                    value: (current*100/total)/100,
                    backgroundColor: secondcolor,
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),

                  ),
                ),
                Center(child:Text((current*100/total).toString()+" %",style: TextStyle(fontSize: 10,color: Colors.white),))
              ],
           ),

           Padding(
             padding: const EdgeInsets.all(5),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('تم جمع'),
                            Text(current.toString()+" أ.و"),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('المتبقي'),
                            Text((total-current).toString()+" أ.و"),
                          ],
                        ),


                      ],
                    ),
           ),

            Container(height: 2,color: Colors.black,),
            Center(child: Text("تفاصيل الحالة"),)



          ],
        ),
      ),
    ),
  );
}
Widget ProjetCardADM(String image, String text, BuildContext context,Projets projet) {
  return InkWell(
    onTap: (){
      Get.off(GesMchrou3(proj: projet,));

    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Card(
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                 // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: getProportionateScreenHeight(150),
            ),





Container(height: 2,color: Colors.black,),
            Center(child: Text("تفاصيل الحالة"),)












          ],
        ),
      ),
    ),
  );
}
