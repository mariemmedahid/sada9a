import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sadague/API.dart';
import 'package:sadague/Model/Statistique.dart';
import 'package:sadague/view/admin/homeAdmin.dart';

import '../Constante.dart';
import '../Model/Projets.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart'  as firebase_storage;
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'Mechari3Controller.dart';
class AdmMchrou3Controller extends GetxController{
  Projets? projet;
  AdmMchrou3Controller({required this.projet});
  bool isloading=false;

  int? TypeP;

  File? imageFile;

  String dropdownValue = 'سقاية';

  String? url;
  TextEditingController nomProjetController = new TextEditingController();
  TextEditingController DescriptionController = new TextEditingController();
  TextEditingController montantController = new TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    init();
    super.onInit();
  }

Future init() async{
    nomProjetController.text=projet!.nom!;
    DescriptionController.text=projet!.description!;
    montantController.text=projet!.mont_total!.toString();
    TypeP=projet!.typeP;
    url=projet!.image_url!;
    imageFile=await _fileFromImageUrl(projet!.image_url!);
    dropdownValue=GetType(projet!.typeP!);
    update();
}
  String GetType(int t){
    String type="";
    if(t==1) type="سقاية";
    if(t==2) type="مشاريع";
    if(t==3) type="كفالة";
    if(t==4) type="مرضى";
    return type;
  }
  List<Statistique> statistique=[];





  Future ModifiyProjet() async{
    try {
      isloading = true;
      update();
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(now);
       url = await UploadImage();
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
      final reponse = await http.put(
        Uri.parse(API_PROJET+"/"+projet!.id_projet!.toString()),
        headers: {'Content-Type': 'application/json'},

        body: jsonPayload,

      );
log("staaaaaaaaaa"+reponse.body.toString());
      if (reponse.statusCode == 200) {
        isloading = false;
        update();
        // ignore: use_build_context_synchronously
        Get.snackbar(
            "تم بنجاح", "تم تغيير البيانات بنجاح", backgroundColor: Colors.green,
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

  Future DeleteProjet() async{
    try {
      isloading = true;
      update();



      final reponse = await http.delete(
        Uri.parse(API_PROJET+"/"+projet!.id_projet!.toString()),


      );
      log("staaaaaaaaaa"+reponse.body.toString());
      if (reponse.statusCode == 200) {
        isloading = false;
        update();
        // ignore: use_build_context_synchronously
        Get.snackbar(
            "تم بنجاح", "تم الحذف بنجاح", backgroundColor: Colors.green,
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

  Future<File> _fileFromImageUrl(String url) async {
    final response = await http.get(Uri.parse(url));

        final documentDirectory = await getApplicationDocumentsDirectory();

    final file = File(join(documentDirectory.path, 'imagetest.png'));

    file.writeAsBytesSync(response.bodyBytes);

    return file;
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