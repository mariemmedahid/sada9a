import 'package:sadague/view/Payement.dart';

class Aides{
  int? id_aide;
   int? id_donneur;
    int? id_project;
     int? montant;
      String? datePost;
      int? payment_type;
         
Aides(int? id_aide,int? id_donneur,int? id_project,int? id_montant,String? datePost,int? payment_type){
this.id_aide=id_aide;
this.id_donneur=id_donneur;
this.id_project=id_project;
this.montant=montant;
this.datePost=datePost;
this.payment_type=payment_type;
}

    
  Aides.fromJson(Map<String,dynamic> json){
  id_aide=json["id_aide"];
  id_donneur=json["id_donneur"];
  id_project=json["id_project"];
  montant=json["montant"];
  datePost=json["datePost"];
  payment_type=json["payment_type"];
 
  
    }

    Map<String,dynamic> toJson(){

      final Map<String,dynamic> data = new Map<String ,dynamic>();
      data["id_aide"]=id_aide;
            data["id_donneur"]=id_donneur;
                      data["id_project"]=id_project;
                           data["montant"]=montant;
                                    data["datePost"]=datePost;
                                              data["payment_type"]=payment_type;
                                             
                      


      return data;

    }
    
    }