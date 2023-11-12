import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:sadague/Controller/NewsController.dart';
import 'package:sadague/helper/size_config.dart';
import 'package:sadague/widgets/ProjetCard.dart';

import '../widgets/News_Card.dart';

class Newpage extends StatefulWidget {
  const Newpage({Key? key}) : super(key: key);

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

     return GetBuilder<NewsController>(
       init: NewsController(),
       builder: (controller) {
         return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text("مقالات",style: TextStyle(color: Colors.black),),
            actions: [
                Image.asset('assets/images/logo.png'),

            ],
            leading:
            InkWell(
                onTap: (){
                              Navigator.pop(context);
                            },
              child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20)),
          ),
          body: SingleChildScrollView(
            child: Column(

              children: [
                controller.isloading?Center(child: CircularProgressIndicator()):


                controller.news.length==0?Column(

                  children: [
                    SizedBox(height: getProportionateScreenHeight(350),),
                    Center(child: Text("لا توجد اي اخبار هنا"),),
                  ],
                ):ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  reverse: true,
                  itemCount:  controller.news.length,

                  itemBuilder: (BuildContext context, int index){
                    return   NewsCard(controller.news[index].image_url!,controller.news[index].title!);
                  },

                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                ),


              ],
            ),
          ),
    );
       }
     );
  }
}
