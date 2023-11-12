import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sadague/Constante.dart';
import 'package:sadague/view/Historique.dart';
import 'package:sadague/view/auth/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  
  State<Profil> createState() => _ProfilState();
  
  
}
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences? prefs;
Future initPerfs() async {
prefs = await _prefs;
}
class _ProfilState extends State<Profil> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPerfs();
  }
  @override
  Widget build(BuildContext context) {
  
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
Container(
     margin: EdgeInsets.symmetric(horizontal: 12),
  child:   Column(
  
    children: [
  
          Center(
  
        child:   Column(
  
      children: [
  
              CircleAvatar(radius: 60,backgroundColor: Colors.grey[100],backgroundImage: AssetImage("assets/images/logo.png"),),
  
              SizedBox(height: 10,),
  
              // Text(prefs!.getString("nom")!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
  
          ],
  
    
  
        ),
  
      
  
      ),
  
      SizedBox(height: 15,),
  
      InkWell(
        onTap: (){

        },
        child: Container(padding: EdgeInsets.all(15.0),

           decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(15.0),

                color: Colors.grey[100]

              ),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

           Icon(Icons.handshake_outlined,color: primaryColor,),


            SizedBox(width: 10,),
            Text("حسابي"),
  Spacer(),
  //tgba8 espace lbagui
  Icon(Icons.arrow_forward, color: Colors.black, size: 20),




            ],

          ),

        ),
      ),
      SizedBox(height: 15,),

      InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Historique()),
          );
        },
        child: Container(padding: EdgeInsets.all(15.0),

           decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(15.0),

                color: Colors.grey[100]

              ),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

           Icon(Icons.handshake_outlined,color: primaryColor,),


            SizedBox(width: 10,),
            Text("تبرعاتي"),
  Spacer(),
  //tgba8 espace lbagui
  Icon(Icons.arrow_forward, color: Colors.black, size: 20),




            ],

          ),

        ),
      ),
       SizedBox(height: 15,),

      InkWell(
        onTap: (){

        },
        child: Container(padding: EdgeInsets.all(15.0),

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(15.0),

              color: Colors.grey[100]

          ),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Icon(Icons.handshake_outlined,color: primaryColor,),


              SizedBox(width: 10,),
              Text("عن التطبيق"),
              Spacer(),
              //tgba8 espace lbagui
              Icon(Icons.arrow_forward, color: Colors.black, size: 20),




            ],

          ),

        ),
      ),
      SizedBox(height: 15,),

      InkWell(
        onTap: () async {
           await FirebaseAuth.instance.signOut();
         await  prefs?.remove("id");
         await  prefs?.remove("nom");
         Get.offAll(LoginView());
        },
        child: Container(padding: EdgeInsets.all(15.0),

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(15.0),

              color: Colors.grey[100]

          ),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Icon(Icons.handshake_outlined,color: primaryColor,),


              SizedBox(width: 10,),
              Text("تسجيل الخروج"),
              Spacer(),
              //tgba8 espace lbagui
              Icon(Icons.arrow_forward, color: Colors.black, size: 20),




            ],

          ),

        ),
      ),
      Spacer(),
      Text("1.0.1"),
      SizedBox(height: 20,)
          ],
  
  ),
)
,



     );
  }
}