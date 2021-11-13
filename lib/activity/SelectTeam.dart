import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_manager_dashboard/activity/dashboard/DashConnection.dart';
import 'package:project_manager_dashboard/main.dart';
import '../../Navigation_UI/components/header.dart';
import '../../Navigation_UI/controllers/MenuController.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class SelectTeam extends StatelessWidget {
  final String ptitle;
  final int pid;

  SelectTeam({Key? key, required this.ptitle, required this.pid}) : super(key: key);
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: SelectTeamScreen(pid: pid, p_title: ptitle,),
    );
  }
}
class SelectTeamScreen extends StatefulWidget{
  final String p_title;
  final int pid;
  SelectTeamScreen({Key? key, required this.p_title, required this.pid}) : super(key: key);

  @override
  State<SelectTeamScreen> createState() => _MyStatefulWidgetState();
  }
  class _MyStatefulWidgetState extends State<SelectTeamScreen> {
    var selectedmember1;
    var selectedmember2;
    var selectedmember3;
    var selectedmember4;

    Widget build(BuildContext context) {
      return Scaffold(
        key: context
            .read<MenuController>()
            .scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                HeaderT(),
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(defaultPadding),
                        margin: EdgeInsets.only(top: defaultPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: primaryColor.withOpacity(0.15)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(defaultPadding),
                          ),
                        ),
                        child: SizedBox(width: defaultPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: defaultPadding,),
                              Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text("Project ID : $pid",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline6,),
                                  SizedBox(height: 30),
                                  StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection("USERS").snapshots(),
                                    builder: (context, snapshots) {
                                      if (!snapshots.hasData) {
                                        Text('Loading....');
                                      } else {
                                        List<DropdownMenuItem>_userID = [];
                                        for (int i = 0; i <
                                            snapshots.data!.docs.length; i++) {
                                          DocumentSnapshot snap = snapshots
                                              .data!
                                              .docs[i];
                                          _userID.add(
                                              DropdownMenuItem(
                                                child: Text(snap.id),
                                                value: "${snap.id}",
                                              ));
                                        }
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Leader',),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              iconSize: 24,
                                              elevation: 16,
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .headline6,
                                              items: _userID,
                                              onChanged: (uservalue) {
                                                final snackbar = SnackBar(
                                                    content: Text(
                                                        " $uservalue Selected "
                                                    ));
                                                Scaffold.of(context)
                                                    .showSnackBar(
                                                    snackbar);
                                                setState(() {
                                                  selectedmember1 = uservalue;
                                                });
                                              },
                                              value: selectedmember1,
                                            ),
                                            SizedBox(height: 20,),
                                            DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Member 1',),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              iconSize: 24,
                                              elevation: 16,
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .headline6,
                                              items: _userID,
                                              onChanged: (uservalue) {
                                                final snackbar = SnackBar(
                                                    content: Text(
                                                        " $uservalue Selected "
                                                    ));
                                                Scaffold.of(context)
                                                    .showSnackBar(
                                                    snackbar);
                                                setState(() {
                                                  selectedmember2 = uservalue;
                                                });
                                              },
                                              value: selectedmember2,

                                            ),
                                            SizedBox(height: 20,),
                                            DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Member 2',),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              iconSize: 24,
                                              elevation: 16,
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .headline6,
                                              items: _userID,
                                              onChanged: (uservalue) {
                                                final snackbar = SnackBar(
                                                    content: Text(
                                                        " $uservalue Selected "
                                                    ));
                                                Scaffold.of(context)
                                                    .showSnackBar(
                                                    snackbar);
                                                setState(() {
                                                  selectedmember3 = uservalue;
                                                });
                                              },
                                              value: selectedmember3,
                                            ),
                                            SizedBox(height: 20,),
                                            DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Member 3',),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              iconSize: 24,
                                              elevation: 16,
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .headline6,
                                              items: _userID,
                                              onChanged: (uservalue) {
                                                final snackbar = SnackBar(
                                                    content: Text(
                                                        " $uservalue Selected "
                                                    ));
                                                Scaffold.of(context)
                                                    .showSnackBar(
                                                    snackbar);
                                                setState(() {
                                                  selectedmember4 = uservalue;
                                                });
                                              },
                                              value: selectedmember4,

                                            ),
                                          ],

                                        );
                                      }

                                      return Text(""); //
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                      height: 50,
                                      padding: EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      margin: EdgeInsets.only(
                                          top: defaultPadding),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2,
                                            color: primaryColor.withOpacity(
                                                0.15)),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(defaultPadding),
                                        ),
                                      ),
                                      child: RaisedButton(
                                          textColor: Colors.white,
                                          color: bgColor,
                                          child: Text('Save'),
                                          onPressed: () {
                                            _saveteam();
                                          }
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    void _saveteam() async {
      // for member 1
      CollectionReference user1 = FirebaseFirestore.instance.collection('USERS')
          .doc(selectedmember1).collection("Project_Detail");
     await user1.doc().set({
        'member_1': selectedmember1,
        'role_1': 'Leader',
        'member_2': selectedmember2,
        'role_2': null,
        'member_3': selectedmember3,
        'role_3': null,
        'member_4': selectedmember4,
        'role_4': null,
      }).then(  updatet1()).catchError((error) =>
          print("Failed to add user: $error"));
    }

    //update project status

     updatet1() {
      print("member 1 added");
      CollectionReference user11 = FirebaseFirestore.instance.collection(
          'USERS');
       user11
          .doc(selectedmember1)
          .update({'project': "true"})
          .then(_addteam2())
          .catchError((error) => print("Failed to update status: $error"));
    }

    // for member 2

    _addteam2()  {

      print("member 1 update");///////

      CollectionReference user2 = FirebaseFirestore.instance.collection('USERS')
          .doc(selectedmember2).collection("Project_Detail");
       user2.doc().set({
        'member_1': selectedmember1,
        'role_1': 'Leader',
        'member_2': selectedmember2,
        'role_2': null,
        'member_3': selectedmember3,
        'role_3': null,
        'member_4': selectedmember4,
        'role_4':null,
      }).then(_updateTeam2()).catchError((error) =>
          print("Failed to add user: $error"));
    }

    _updateTeam2()  {

      print("member 2 added");
      //update project status
      CollectionReference user22 = FirebaseFirestore.instance.collection(
          'USERS');
       user22
          .doc(selectedmember2)
          .update({'project': "true"})
          .then(_addteam3())
          .catchError((error) => print("Failed to update status: $error"));
    }

    _addteam3()  {

      print("member 2 update");///////

      CollectionReference user3 = FirebaseFirestore.instance.collection('USERS')
          .doc(selectedmember3).collection("Project_Detail");
       user3.doc().set({
        'member_1': selectedmember1,
        'role_1': 'Leader',
        'member_2': selectedmember2,
        'role_2': null,
        'member_3': selectedmember3,
        'role_3': null,
        'member_4': selectedmember4,
        'role_4':null,
      }).then(_updateTeam3()).catchError((error) =>
          print("Failed to add user: $error"));


    }

    _updateTeam3() {

      print("member 3 added");///////

      //update project status
      CollectionReference user33 = FirebaseFirestore.instance.collection('USERS');
       user33
          .doc(selectedmember3)
          .update({'project': "true"})
          .then(_addteam4())
          .catchError((error) => print("Failed to update status: $error"));
    }

    _addteam4() {

      print("member 3 update");///////

      CollectionReference user4 = FirebaseFirestore.instance.collection('USERS')
          .doc(selectedmember4).collection("Project_Detail");
       user4.doc().set({
        'member_1': selectedmember1,
        'role_1': null,
        'member_2': selectedmember2,
        'role_2': null,
        'member_3': selectedmember3,
        'role_3': null,
        'member_4': selectedmember4,
        'role_4': null,
      }).then(_updateTeam()).catchError((error) =>
          print("Failed to add user: $error"));

    }
    _updateTeam() {
      print("member 4 added");///////
      CollectionReference user44 = FirebaseFirestore.instance.collection('USERS');
      user44
          .doc(selectedmember4)
          .update({'project': "true"})
          .then(notify())
          .catchError((error) => print("Failed to update status: $error"));
    }
    notify() {
      print("member 4 update");///
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashConnection()));
  }
}


