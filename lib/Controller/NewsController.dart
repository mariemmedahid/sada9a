import 'dart:convert';

import 'package:get/get.dart';
import 'package:sadague/API.dart';

import '../Model/News.dart';
import '../Model/Projets.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController{



  @override
  void onInit() {
    // TODO: implement onInit
    GetNews();
    super.onInit();
  }
  bool isloading=false;

  List<News> news=[];

  Future<List<News>> GetNews() async {
    isloading = true;
    update();


    final response = await http.get(Uri.parse(GET_NEWS));

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      for (int i = 0; i < data.length; i++) {
        News n = News.fromJson(data[i] as Map<String, dynamic>);
        news.add(n);
      }

      isloading = false;
      update();
      print("len" + news.length.toString());
    }

    return news;
  }
}