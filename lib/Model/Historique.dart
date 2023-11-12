class Historique{
  String? typeP;
  int? id_aide;
  String? date_poste;
  int? montant;



  Historique.fromJson(Map<String,dynamic> json){
    typeP=json["typeP"];
    id_aide=json["id_aide"];
    date_poste=json["datePost"];
    montant=json["montant"];
  }

  Map<String,dynamic> toJson(){

    final Map<String,dynamic> data = new Map<String ,dynamic>();
    data["typeP"]=typeP;
    data["id_aide"]=id_aide;
    data["datePost"]=date_poste;
    data["montant"]=montant;
    return data;

  }

}