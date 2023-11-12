import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Mechari3Controller.dart';
import '../../Model/Projets.dart';
import '../../helper/size_config.dart';
import '../../widgets/ProjetCard.dart';

class Mechari3ADM extends StatelessWidget {
   Mechari3ADM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Mechari3Controller>(

      init: Mechari3Controller( type: 0),
      builder: (controller) {
        return Scaffold(
          body :SingleChildScrollView(

            child: Column(
              children: [
                controller.isloading?Center(child: CircularProgressIndicator()):
                controller.projets.length==0?Center(
                  child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(320),),
                      Text("لا يوجد اي مشروع بعد")
                    ],
                  ),
                ): ListView.separated(
physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:  controller.projets.length,
                  itemBuilder: (BuildContext context, int index){
                    return ProjetCardADM(
                        controller.projets[index].image_url!,
                        controller.projets[index].nom!,
                        context,
                        controller.projets[index]
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),


                )
                // ProjetCard(
                //     'assets/images/v6our.jpg',
                //     'فطور الصائمين',
                //     context,
                //     10075,
                //     600,
                // ),
                // ProjetCard(
                //     'assets/images/v6our.jpg',
                //     'فطور الصائمين',
                //     context,
                //     10075,
                //     600
                // ),
                // ProjetCard(
                //     'assets/images/v6our.jpg',
                //     'فطور الصائمين',
                //     context,
                //     10075,
                //     600
                // ),
              ],
            ),
          ),
        );
      }
    );
  }
}
