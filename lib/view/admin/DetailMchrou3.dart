import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadague/Constante.dart';
import 'package:sadague/view/Payement.dart';

import '../../Model/Projets.dart';


class DetailMchrou3 extends StatefulWidget {
  late Projets proj;
  DetailMchrou3({required this.proj});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailMchrou3> {
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
                        "FDdffd",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        Container(
                            padding: EdgeInsets.all(7),


                            child: Icon(Icons.edit)
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      "fdfddd",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                    SizedBox(height: 10),


                    SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.proj.current_montant.toString()+" أ.ج"),
                        Text("% "+((100/799)*777).toInt().toString()),
                        Text((6767-777).toString()+" أ.ج"),
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

                    Text(
                      "jkjjjjjhjh"
                    ),

                    SizedBox(height: 5),


                    SizedBox(height: 20,),


                    SizedBox(height: 30),



                  ],
                ),
              ),
            ),

          ]
      ),
    );
  }
}
