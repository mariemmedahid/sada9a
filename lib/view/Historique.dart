import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sadague/helper/size_config.dart';

import '../Constante.dart';
import '../Controller/HistUserController.dart';

class Historique extends StatefulWidget {
  const Historique({super.key});

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HistUserController>(
        init :HistUserController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,

                leading:
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20)),
              ),
              body:

              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/lntnalo-ayah.svg',
                          width: 200,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 10,),
                      controller.isloading?Center(child: CircularProgressIndicator()):
                      controller.hist.length==0?Column(children: [
                        SizedBox(height:getProportionateScreenHeight(320),),
                        Text("لا يوجد اي تبرع هنا")
                      ],):ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
reverse: true,
                        itemCount:  controller.hist.length,

                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.grey.shade200,
                              child: Row(
                                children: [
                                  CircleAvatar(radius: 30,backgroundColor: Colors.grey[100],backgroundImage: AssetImage("assets/images/logo.png"),),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(controller.GetType(controller.hist[index]!.typeP!)),
                                        Text(controller.hist[index].id_aide.toString()),

                                        Text(controller.hist[index].date_poste!,style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                                      ],),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(controller.hist[index].montant.toString()+"أ.ج"),
                                        Text("مدفوع",style: TextStyle(color: Colors.green),),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },

                        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                      ),


                    ],
                  ),
                ),
              )





          );
        }
    );
  }
}