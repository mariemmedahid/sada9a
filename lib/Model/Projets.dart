class Projets{
  int? id_projet;
   String? nom;
    String? description;
     int? mont_total;
      int? current_montant;
       String? image_url;
           String? date_poste;
           int? typeP;

Projets( int? id_projet,
  String? nom,
  String? description,
  int? mont_total,
  int? current_montant,
  String? image_url,
  String? date_poste,
  int? typeP,){
  this.id_projet=id_projet;
  this.description=description;
  this.current_montant=current_montant;
  this.date_poste=date_poste;
  this.typeP=typeP;
  this.image_url=image_url;
  this.nom=nom;
}
    
  Projets.fromJson(Map<String,dynamic> json){
  id_projet=json["id_projet"];
  nom=json["nom"];
  description=json["description"];
  mont_total=json["mont_total"];
  current_montant=json["current_montant"];
  image_url=json["image_url"];
  date_poste=json["date_poste"];
  typeP=json["typeP"];
  
    }

    Map<String,dynamic> toJson(){

      final Map<String,dynamic> data = new Map<String ,dynamic>();
      data["id_projet"]=id_projet;
            data["nom"]=nom;
                      data["description"]=description;
                           data["mont_total"]=mont_total;
                                    data["current_montant"]=mont_total;
                                              data["image_url"]=image_url;
                                               data["date_poste"]=date_poste;
                                                data["typeP"]=typeP;
                      


      return data;

    }
    
    }