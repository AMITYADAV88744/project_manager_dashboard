import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_manager_dashboard/activity/Main_Screen.dart';
import 'package:project_manager_dashboard/activity/ProjectBasket/ProjectBasket.dart';
import 'package:project_manager_dashboard/activity/dashboard/dashboard_screen.dart';


int index= 0;

class DashConnection extends StatefulWidget {
  @override
  _CleanState createState() => _CleanState();

}

class _CleanState extends State<DashConnection> {

  @override
  Widget  _detectOS() {
    String? _uid=FirebaseAuth.instance.currentUser!.displayName;
    final CollectionReference documentReference = FirebaseFirestore.instance.collection("USERS");
    print(_uid);
    documentReference.doc(_uid).get().then((DocumentSnapshot documentSnapshot) {
      if ((documentSnapshot.data() as Map<String, dynamic>).containsValue('false')) {
        print('project not present in before db $index');
        index=1;
        print('project not present in before db $index');
        return index;
      }if ((documentSnapshot.data() as Map<String, dynamic>).containsValue('true')) {
        print('project  present in after db $index');
        index=-1;
        print('project  present in after db $index');
        return index;
      }
    });
    if(index<0&&index!=0) {
      print('project  present in 1  $index');
      return Main_Screen();
    }else{
      print('project not present in 2  $index');
      return ProjectBasket();
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Container(child: _detectOS());
  }
}

