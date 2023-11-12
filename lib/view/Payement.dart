import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sadague/Constante.dart';
import 'package:sadague/Controller/PaymentController.dart';
import 'package:sadague/Model/Aides.dart';
import 'package:sadague/Model/Projets.dart';
import 'package:sadague/helper/size_config.dart';
import 'package:sadague/view/homepage.dart';

import '../widgets/Mybutton.dart';

class Payement extends StatefulWidget {
  Projets? projet ;
  Payement({required this.projet});

  @override
  State<Payement> createState() => _PayementState();
}

class _PayementState extends State<Payement> {
  final List<String> images = [
    'assets/images/Bn.png',
    'assets/images/se.png',
    'assets/images/m.png',
    'assets/images/b.png',
  ];

  final List<String> Ptype = [
    'بنكيلي',
    'السداد',
    'مصرفي',
    'بيم بنك',
  ];
  final List<int> Ptypeindex = [
    1,
    2,
    3,
   4,
  ];
  List<Color> buttonColors = [
    Colors.grey.shade200,
    Colors.grey.shade200,
    Colors.grey.shade200,
    Colors.grey.shade200,
  ];
  List<Color> textColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  List<Color> borderColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  List<String> buttonTexts = [
    '50',
    '100',
    '200',
    '400',
  ];

  int currentIndex = -1;
  TextEditingController controller=new TextEditingController();

  int Pytype=1;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return GetBuilder<PayementController>(
        init: PayementController(),
        builder: (maris) {
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

              title: Text(widget.projet!.nom!,style: TextStyle(fontSize: 15,color: Colors.black),),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        padding: EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor.withOpacity(0.2),
                          border: Border.all(color:primaryColor),
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text((widget.projet!.mont_total!-widget.projet!.current_montant!).toString()+" أ.ج"),
                                SizedBox(height: 5,),
                                Text("المبلغ المتبقي"),
                              ],
                            ),
                            Icon(Icons.money_rounded)


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding:  EdgeInsets.all(12),
                      child:   Text("حدد مبلغ التبرع"),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < buttonColors.length; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentIndex == i) {
                                    currentIndex = -1;
                                  } else {
                                    currentIndex = i;
                                  }
                                  _updateButtonColors();
                                });
                              },

                              child: Container(
                                width: getProportionateScreenWidth(80),
                                padding: EdgeInsets.all(20),
                                decoration:  BoxDecoration(
                                  color: buttonColors[i],
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                    color: borderColors[i],
                                    width: 2.0,
                                  ),

                                ),
                                child: Center(
                                  child: Text(
                                    buttonTexts[i],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: textColors[i],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding:  EdgeInsets.only(left: 12,right: 12),
                      child: TextFormField(
                          controller: controller,
                          keyboardType: TextInputType.number,//tsehl 3lik 4e li lhi tevet7 3no clavier
                          decoration: InputDecoration(
                            hoverColor: primaryColor,
                            hintText: "مبالغ اخرى",//elyn tlaw nktbo y5tv
                            // labelText: "Email",//y6la3 lvewgue
                            border: OutlineInputBorder(),


                          )

                      ),
                    ) ,

                    SizedBox(height: 30,),

                    Center(child: Text("اختر طريقة الدفع",style: TextStyle(color: primaryColor),)),

                    SizedBox(height: 30,),
                    Padding(
                      padding:  EdgeInsets.only(left: 12,right: 12),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < images.length; i++)
                            InkWell(
                              onTap: (){
                                Pytype=i;
                                setState(() {

                                });
                                print("oppppp"+Pytype.toString());
                              },
                              child: Container(
                                width: 60,
                                color: Pytype==i?primaryColor:Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      image: DecorationImage(
                                        image: AssetImage(images[i]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(110)),
                  


                   Container(
                   width: double.infinity,height: 100,
                   decoration: BoxDecoration(
                     color:primaryColor,
                   ),
                   child:     Padding(
                     padding:  EdgeInsets.all(15),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(controller.text+" أ.ج",style: TextStyle(color: Colors.white,fontSize: 18),),

                         InkWell(
                           onTap: (){

                             maris.AddAide(widget.projet!.id_projet!,int.parse(controller.text),Pytype, context);
                           },
                           child: Container(
                             width: 120,
                             height: 60,
                             padding: EdgeInsets.all(7),

                             decoration: const BoxDecoration(
                                 color: secondcolor,
                                 borderRadius: BorderRadius.all(Radius.circular(15))
                             ),
                             child: Center(
                               child:  Text(
                                 "تبرع الآن",
                                 style: TextStyle(fontWeight: FontWeight.bold),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),)


                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  void _updateButtonColors() {
    controller.text=buttonTexts[currentIndex];

    for (int i = 0; i < buttonColors.length; i++) {

      if (i == currentIndex) {

        buttonColors[i] = primaryColor;
        textColors[i] = Colors.white;
        borderColors[i] = primaryColor;

      } else {

        buttonColors[i] = Colors.white;
        textColors[i] = primaryColor;
        borderColors[i] = primaryColor;


      }
    }
  }
}
