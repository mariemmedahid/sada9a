class Statistique{
  int? nb_projet;
  int? nb_user;
  int? nb_aide;
  int? total_montant;



  Statistique.fromJson(Map<String,dynamic> json){
    nb_projet=json["nb_projet"];
    nb_user=json["nb_user"];
    nb_aide=json["nb_aide"];
    total_montant=json["total_montant"];
  }

  Map<String,dynamic> toJson(){

    final Map<String,dynamic> data = new Map<String ,dynamic>();
    data["nb_projet"]=nb_projet;
    data["nb_user"]=nb_user;
    data["nb_aide"]=nb_aide;
    data["total_montant"]=total_montant;
    return data;

  }

}