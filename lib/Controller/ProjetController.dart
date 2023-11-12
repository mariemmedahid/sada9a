import 'dart:convert';

import 'package:get/get.dart';
import 'package:sadague/API.dart';

import '../Model/Projets.dart';
import 'package:http/http.dart' as http;

class ProjetsController extends GetxController{
  int? type;
  ProjetsController({required this.type});

  @override
  void onInit() {
    // TODO: implement onInit
    GetProjectsById(this.type);
    super.onInit();
  }
  bool isloading=false;

  List<Projets> projets=[];

  Future<List<Projets>> GetProjectsById(int? type) async {
    isloading = true;
    projets.clear();


    update();
    final String apiUrl = (type == 0) ? API_TOUS_PROJET : API_SELON_T_PROJET + type.toString();

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      for (int i = 0; i < data.length; i++) {
        Projets p = Projets.fromJson(data[i] as Map<String, dynamic>);
        projets.add(p);
      }

      isloading = false;
      update();
      print("len" + projets.length.toString());
    }

    return projets;
  }
}