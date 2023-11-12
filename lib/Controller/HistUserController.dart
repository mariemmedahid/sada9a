import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sadague/API.dart';
import 'package:sadague/Constante.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/Historique.dart';
import 'package:http/http.dart' as http;


class HistUserController extends GetxController {
  bool isloading = false;
  List<Historique> hist = [];

  @override
  void onInit() {
    super.onInit();
    GetHistorique();
  }

  Future<List<Historique>> GetHistorique() async {
    isloading = true;
    update();
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    int? userId=prefs.getInt("id");
    final response = await http.get(Uri.parse(API_HISTORIQUE_USER + '${userId}/historique_aides'));

    print("response"+response.body.toString());
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));

      for (int i = 0; i < data.length; i++) {
        Historique h = Historique.fromJson(data[i] as Map<String, dynamic>);
        hist.add(h);

      }

      isloading = false;
      update();

    }

    return   hist;
  }

  String GetType(String type){
    switch (type)
    {
      case "1":
        return TYPE1;
      // statement1;
        break;
      case "2":
        return TYPE2;
        break;
      case "3":
        return TYPE3;

        break;
      case "4":
        return TYPE4;

        break;


        break;
      default:
     return "تبرع";
        break;
    }
  }

  String Dateformat(int timestap){

    var dt = DateTime.fromMillisecondsSinceEpoch(timestap);



// 24 Hour format:
    var d24 = DateFormat('dd/MM/yyyy, HH:mm').format(dt);
    return d24;
  }
}
