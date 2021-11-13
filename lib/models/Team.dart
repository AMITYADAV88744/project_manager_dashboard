import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 class Team {
  late String? member_1;
  late String? role_1;
  late  String? member_2;
  late  String? role_2;
  late  String? member_3;
  late  String? role_3;
  late  String? member_4;
  late  String? role_4;

  Team();

  Team.fromMap(Map<String?,dynamic>data){
    member_1=data['member_1'];
    role_1=data['role_1'];
    member_2=data['member_2'];
    role_2=data['role_2'];
    member_3=data['member_3'];
    role_3=data['role_3'];
    member_4=data['member_4'];
    role_4=data['role_4'];
  }

  Map<String, dynamic> toMap() {
    return {
      "member_1":member_1,
      "role_1": role_1,
      "member_2":member_2,
      "role_2": role_2,
      "member_3":member_3,
      "role_3": role_3,
      "member_4":member_4,
      "role_4": role_4,
    };
  }

//  Team(this._member_1, this._role_1, this._member_2, this._role_2,
  //    this._member_3, this._role_3, this._member_4, this._role_4);

}