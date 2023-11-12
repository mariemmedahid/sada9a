import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sadague/Controller/Si9ayatController.dart';
import 'package:sadague/helper/size_config.dart';

import '../Controller/ProjetController.dart';
import '../widgets/ProjetCard.dart';

class Si9ayat extends StatefulWidget {

  int? type;
  String header;

  Si9ayat(this.type,this.header);
  @override
  State<Si9ayat> createState() => _Alltbrou3atState();
}

class _Alltbrou3atState extends State<Si9ayat> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Si9ayatController>(
      autoRemove: true,
      init: Si9ayatController(type:widget.type),
      builder: (controller){


        return Scaffold(

          body :SafeArea(
            child: SingleChildScrollView(

              child: Column(
                children: [
                  SizedBox(height: 20,),
if(widget.header.length!=0)Text(widget.header),


                  controller.isloading?Center(child: CircularProgressIndicator()):
                 controller.projets.length==0?Center(
                   child: Column(
                     children: [
                       SizedBox(height: getProportionateScreenHeight(320),),
                       Text("لا يوجد اي مشروع في هذا الصنف")
                     ],
                   ),
                 ): ListView.separated(

                    shrinkWrap: true,
                    itemCount:  controller.projets.length,
                    itemBuilder: (BuildContext context, int index){
                      return ProjetCard(
                          controller.projets[index].image_url!,
                          controller.projets[index].nom!,
                          context,
                          controller.projets[index].mont_total!,
                          controller.projets[index].current_montant!,
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
          ),
        );
      },
    );
  }

}