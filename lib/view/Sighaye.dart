import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:sadague/widgets/ProjetCard.dart';

class Sighaya extends StatefulWidget {
  const Sighaya({super.key});

  @override
  State<Sighaya> createState() => _SighayaState();
}

class _SighayaState extends State<Sighaya> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
    appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0,
     
      
        actions: [ 
            Image.asset('assets/images/logo.png'),
      
        ],

        leading: 
        InkWell(
            onTap: (){
                          Navigator.pop(context);
                        },
          child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20)),
      
       // (Icons.arrow_back_ios, color: Colors.black, size: 20),
      ),
  
body: 

SingleChildScrollView(

  child:   Column(
  
    children: [
  
          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/sighaya.jpeg',width: 350,),
  
        ],

      ),
  
      // ProjetCard ('assets/images/tt.jpg',
  
      //                 'elmotba9i',
  
      //                 context,
  
      //                600,
      //   800
  
      //               ),
      //                ProjetCard ('assets/images/tt.jpg',
  
      //                 'elmotba9i',
  
      //                 context,
  
      //                700,
      //                    890
  
      //               ),
  
  
    ],
  
  ),
),

    );
  }
}