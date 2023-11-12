import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sadague/Controller/HomeController.dart';
import 'package:sadague/helper/size_config.dart';
import 'package:sadague/view/Detail.dart';
import 'package:sadague/view/Sighaye.dart';
import 'package:sadague/view/Splashscreen.dart';

import '../Constante.dart';
import '../widgets/Mybutton.dart';
import '../widgets/ProjetCard.dart';
import 'Kevala.dart';
import 'Mechari3.dart';
import 'Mecharie.dart';
import 'News.dart';
import 'Profil.dart';
import 'Si9ayat.dart';
import 'marda.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> images = [

    'assets/images/ads1.png',
    'assets/images/ads2.jpg',
    'assets/images/ads3.png',
  ];

  final List<String> imagesC = [
    'assets/images/cat1.jpg',
    'assets/images/cat2.png',
    'assets/images/cat3.jpg',
    'assets/images/cat4.jpg',
  ];

  final List<String> imageTexts = [
    'سقاية',
    'كفالة',
    'مرضى',
    'مشاريع',
  ];
  final List<String> BannerTexts = [
    'تفريج كرب',
    'مشاريع',
    'اكفلهم',
  ];


  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    const duration = Duration(seconds: 3);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        _currentPage = (_currentPage + 1) % images.length;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Text('Bottom Sheet'),
          ),
        );
      },
    );
  }

  void navigateToPage(int index) {
    switch (index) {
      case 0:
      // Navigate to page 1
        Navigator.push(context, MaterialPageRoute(builder: (context) => Si9ayat(1,"سقايات")));
        break;
      case 1:
      // Navigate to page 2
        Navigator.push(context, MaterialPageRoute(builder: (context) => Kevala(3,"كفالة"),));
        break;
      case 2:
      // Navigate to page 3
      Navigator.push(context, MaterialPageRoute(builder: (context) => Marda(4,"مرضى")));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Mechari3(2,"مشاريع")));

        // Navigate to page 4
      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => Page4()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return GetBuilder<HomeController>(
        init: HomeController(),
        autoRemove: true,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Image.asset('assets/images/logo.png'),

              title: Text("صدقة",style: TextStyle(color: Colors.black),),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    height: getProportionateScreenHeight(150),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(35),
                                child: Text(BannerTexts[index],style: TextStyle(color: Colors.white,fontSize: 24),),
                              )
                            ],
                          ),
                        );

                      },
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < imagesC.length; i++)
                          Container(
                            width: getProportionateScreenWidth(60),
                            child: InkWell(
                              onTap: (){
                                navigateToPage(i);
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Container(
                                      width: getProportionateScreenWidth(60),
                                      height: getProportionateScreenHeight(60),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(imagesC[i]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:getProportionateScreenHeight(10)),
                                  Text(
                                    imageTexts[i],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 12),
                                  ),

                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/ahseno-ayah.svg',
                      width: getProportionateScreenWidth(220),
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20),),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),

                      child: Text("اخر فرص التبرع",style: TextStyle(fontSize: 14),)),
                  controller.isloading?CircularProgressIndicator():


                  controller.projets.length==0?Center(child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(120),),
                      Text("لا توجد اي مشاريع الان"),
                    ],
                  )):     ListView.separated(


                    itemCount: controller.projets.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return  ProjetCard(
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




                ],
              ),
            ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
            // floatingActionButton: FloatingActionButton(
            //   shape:RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(15))
            //   ),
            //   onPressed: () {
            //     _showBottomSheet();
            //   },
            //   child: Text("tebar3"),
            //   backgroundColor: primaryColor,
            //   foregroundColor: Colors.white,
            // ),
            bottomNavigationBar: BottomAppBar(
            
              shape: CircularNotchedRectangle(),
              color: primaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/images/main1.svg",
                              color: Colors.white,
                              height: getProportionateScreenHeight(20),
                            ),
                            Text("الرئيسية", style: TextStyle(color: Colors.white,fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mecharie()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/images/main2.svg",
                            color: Colors.white,
                            height: getProportionateScreenHeight(20),
                          ),

                          Text("فرص التبرع", style: TextStyle(color: Colors.white,fontSize: 12)),
                        ],
                      ),
                    ),
                  ),),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Newpage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/images/main3.svg",
                            color: Colors.white,
                            height: getProportionateScreenHeight(20),
                          ),
                          Text("جديدنا", style: TextStyle(color: Colors.white,fontSize: 12)),
                        ],
                      ),
                    ),
                  ),),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profil()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: getProportionateScreenHeight(20),
                          ),
                          Text("حسابي", style: TextStyle(color: Colors.white,fontSize: 12)),
                        ],
                      ),
                    ),
                  ),),
                ],
              ),
            ),

          );
        }
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Text('Bottom Sheet'),
          ),
        );
      },
    );
  }
}
