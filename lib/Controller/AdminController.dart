import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sadague/API.dart';
import 'package:sadague/Model/Statistique.dart';
import 'package:sadague/view/admin/homeAdmin.dart';

import '../Constante.dart';
import '../Model/Projets.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart'  as firebase_storage;

class AdminController extends GetxController{

  bool isloading=false;

  int? TypeP;

  File? imageFile;


  TextEditingController nomProjetController = new TextEditingController();
  TextEditingController DescriptionController = new TextEditingController();
  TextEditingController montantController = new TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    GetStatistique();
    super.onInit();
  }



  List<Statistique> statistique=[];

  Future<List<Statistique>> GetStatistique() async {
    isloading = true;
    statistique.clear();


    update();


    final response = await http.get(Uri.parse(STATISTIQUE));

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      for (int i = 0; i < data.length; i++) {
        Statistique p = Statistique.fromJson(data[i] as Map<String, dynamic>);
        statistique.add(p);
      }

      isloading = false;
      update();

    }

    return statistique;
  }



  Future AddProject() async{
    try {
      isloading = true;
      update();
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(now);
      String url = await UploadImage();
      Map<String, dynamic> payload = {
        "nom": nomProjetController.text,
        "description": DescriptionController.text,
        "mont_total": int.parse(montantController.text),
        "current_montant": 0,
        "image_url": url,
        "date_poste": formattedDate,
        "typeP": TypeP,


      };
      String jsonPayload = json.encode(payload);
      final reponse = await http.post(
        Uri.parse(API_PROJET),
        headers: {'Content-Type': 'application/json'},

        body: jsonPayload,

      );
log("staaaaaaaaaa"+reponse.body.toString());
      if (reponse.statusCode == 200) {
        isloading = false;
        update();
        // ignore: use_build_context_synchronously
        Get.snackbar(
            "تم بنجاح", "تم اضافة المشروع بنجاح", backgroundColor: Colors.green,
            colorText: Colors.white);

        Get.offAll(HomeAdmin());
      }
    }catch(e){
      isloading=false;
      update();
      Get.snackbar(
          "خطأ", "حدث خطأ", backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }

  Future Addnews() async{
    try {
      isloading = true;
      update();
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(now);
      String url = await UploadImage();
      Map<String, dynamic> payload = {
        "title": nomProjetController.text,
        "description": DescriptionController.text,
        "image_url": url,
        "datePost": formattedDate,



      };
      String jsonPayload = json.encode(payload);
      final reponse = await http.post(
        Uri.parse(GET_NEWS),
        headers: {'Content-Type': 'application/json'},

        body: jsonPayload,

      );
      log("staaaaaaaaaa"+reponse.body.toString());
      if (reponse.statusCode == 200) {
        isloading = false;
        update();
        // ignore: use_build_context_synchronously
        Get.snackbar(
            "تم بنجاح", "تم اضافة المقال بنجاح", backgroundColor: Colors.green,
            colorText: Colors.white);

        Get.offAll(HomeAdmin());
      }
    }catch(e){
      isloading=false;
      update();
      Get.snackbar(
          "خطأ", "حدث خطأ", backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }


  Future<String> UploadImage() async{
    final time = DateTime.now();
    final destination = 'files';
    String urlimg="";
    final refer = firebase_storage.FirebaseStorage.instance
        .ref(destination)
        .child('$time');
    try {
      await refer.putFile(imageFile!);
    urlimg = await refer.getDownloadURL();

    } catch (e) {
      print('error occured');
    }
    return urlimg;
  }
}