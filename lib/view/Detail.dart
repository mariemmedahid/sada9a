import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadague/Constante.dart';
import 'package:sadague/view/Payement.dart';

import '../Model/Projets.dart';


class Detail extends StatefulWidget {
Projets proj;
Detail({required this.proj});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool showFullText = false;



  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),



      ),
      body: Stack(
        children :[
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     widget.proj.nom!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    Container(
                      padding: EdgeInsets.all(7),


                      child: Icon(Icons.share_outlined)
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Image.network(
               widget.proj.image_url!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                SizedBox(height: 10),


                SizedBox(height: 25),

               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.proj.current_montant.toString()!+" أ.ج"),
                    Text("% "+((100/widget.proj.mont_total!)*widget.proj.current_montant!).toInt().toString()),
                    Text((widget.proj.mont_total!-widget.proj.current_montant!).toString()+" أ.ج"),
                  ],
                ),
                SizedBox(height: 5),
                const LinearProgressIndicator(
                  value: 0.5,
                  color: primaryColor,
                  backgroundColor: secondcolor,
                  minHeight: 10,
                ),
                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("المدفوع"),
                    Text("المتبقي"),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/lntnalo-ayah.svg',
                        width: 300,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text(
widget.proj.description!
                ),
             
                SizedBox(height: 5),





                 SizedBox(height: 30),



              ],
            ),
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,height: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                color:Colors.white,
              ),
              child:     Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Column(
                      children: [
                        Text("المبلغ المتبقي",style: TextStyle(color: Colors.black),),

                    Text((widget.proj.mont_total!-widget.proj.current_montant!).toString()+" أ.ج"),
                      ],
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Payement(projet: widget.proj,)));

                      },
                      child: Container(
                        width: 120,
                        height: 60,
                        padding: EdgeInsets.all(7),

                        decoration: const BoxDecoration(
                            color: secondcolor,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child:const Center(
                          child:  Text(
                            "تبرع الآن",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),))
  ]
      ),
    );
  }
}
