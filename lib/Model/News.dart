import 'package:sadague/view/Payement.dart';

class News{
 int? id_news;
  String? title;
 String? description;
String? datePost;
String? image_url;

  News(int? id_news,String? title,String? description,String? datePost,String? image_url,){
this.id_news=id_news;
this.title=title;
this.description=description;
this.datePost=datePost;
this.image_url=image_url;

}


  News.fromJson(Map<String,dynamic> json){
    id_news=json["id_news"];
    title=json["title"];
    description=json["description"];
    image_url=json["image_url"];
  datePost=json["datePost"];

 
  
    }

    Map<String,dynamic> toJson(){

      final Map<String,dynamic> data = new Map<String ,dynamic>();
      data["id_news"]=id_news;
            data["title"]=title;
                      data["description"]=description;
                           data["image_url"]=image_url;

                                             
                      


      return data;

    }
    
    }