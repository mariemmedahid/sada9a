import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadague/Constante.dart';

import '../helper/size_config.dart';
import 'Alltbrou3at.dart';
import 'Kevala.dart';
import 'Mechari3.dart';
import 'Si9ayat.dart';
import 'marda.dart';

class Mecharie extends StatefulWidget {
  const Mecharie({Key? key}) : super(key: key);

  @override
  State<Mecharie> createState() => _MecharieState();
}

class _MecharieState extends State<Mecharie> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text("فرص التبرع",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          bottom:   TabBar(
            labelStyle: TextStyle(fontSize: 11,fontFamily: "Arabic"),
            labelColor: Colors.black,
            tabs: [
              Tab(
                icon: SvgPicture.asset(
                  "assets/images/main2.svg",
                  color: primaryColor,
                  height: getProportionateScreenHeight(20),
                ),
                text: "الجميع",
              ),
              Tab(
                icon:     SvgPicture.asset(
                  "assets/images/si9aya.svg",
                  color: primaryColor,
                  height: getProportionateScreenHeight(20),
                ),
                text: "سقايات",
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/images/machari3.svg",
                  color: primaryColor,
                  height: getProportionateScreenHeight(20),
                ),
                text: "مشاريع",
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/images/kavala.svg",
                  color: primaryColor,
                  height: getProportionateScreenHeight(20),
                ),
                text: "كفالة",
              ),

              Tab(
                icon: SvgPicture.asset(
                  "assets/images/marda.svg",
                  color: primaryColor,
                  height: getProportionateScreenHeight(20),
                ),
                text: "مرضى",
              ),


            ],
          ),
        ),
        body:  TabBarView(
          children: [
            Alltbrou3at(0),
            Si9ayat(1,""),
            Mechari3(2,""),
            Kevala(3,""),
            Marda(4,""),

          ],
        ),
      ),
    );
  }
}