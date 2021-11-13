import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_manager_dashboard/models/Team.dart';
import '../../../constants.dart';

class TeamMember extends StatefulWidget{
  @override
  _TeamMember createState() => _TeamMember();
}
class _TeamMember extends State<TeamMember> {
  String? userID=FirebaseAuth.instance.currentUser!.displayName;

  @override
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(color: secondaryColor,
        borderRadius:  BorderRadius.all(Radius.circular(10)
        )
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('USERS')
              .doc(userID).collection("Project_Detail").snapshots(includeMetadataChanges: true),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return Text('Something went wrong');
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Text("Loading");
            }
            return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Team team = Team.fromMap(document.data()! as Map<String, dynamic>);
                return ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/avtar_team.png"),
                        ),
                        title: Text(team.member_1.toString()),
                        trailing: Text(team.role_1.toString()),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/avtar_team.png"),
                        ),
                        title: Text(team.member_2.toString()),
                        trailing: Text(team.role_2.toString()),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/avtar_team.png"),
                        ),
                        title: Text(team.member_3.toString()),
                        trailing: Text(team.role_3.toString()),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/avtar_team.png"),
                        ),
                        title: Text(team.member_4.toString()),
                        trailing: Text(team.role_4.toString()),
                      ),
                    ]
                );
              }
              ).toList(),
            );
            },
        )
    );
  }
}

