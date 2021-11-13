import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectList{
  late  String p_id;
  late String p_title;
  late String p_image;


  ProjectList.fromMap(Map<String,dynamic>data){
    p_id=data['p_id'];
    p_title=data['p_title'];
  }

  Map<String, dynamic> toMap() {
    return {
      "p_id":p_id,
      "p_title": p_title,
    };
  }
}