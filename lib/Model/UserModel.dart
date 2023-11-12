class UserModel{
  int? id_user;
  String? nom;
  int? tel;
  String? mdp;
  int? typeU;


UserModel(int? id_user,String? nom,int? tel,String? mdp, int? typeU){
  this.id_user=id_user;
  this.nom=nom;
  this.tel=tel;
  this.mdp=mdp;
  this.typeU=typeU;
}

  UserModel.fromJson(Map<String,dynamic> json){
    id_user=json["id"];
    nom=json["nom"];
    tel=json["tel"];
    mdp=json["mdp"];
    typeU=json["typeU"];


  }

  Map<String,dynamic> toJson(){

    final Map<String,dynamic> data = new Map<String ,dynamic>();

    data["nom"]=nom;
    data["tel"]=tel;
    data["mdp"]=mdp;
    data["typeU"]=typeU;




    return data;

  }

}