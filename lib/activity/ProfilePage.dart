import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_manager_dashboard/activity/Main_Screen.dart';
import 'package:project_manager_dashboard/activity/dashboard/DashConnection.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: profileView()
      );
    }
    Widget profileView() {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back,
                    size: 24,
                    color: Colors.white70,
                  ), onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => DashConnection()));
                },
                ),
                Text('Profiles details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Container(height: 24,width: 24)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0,0 ,50),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  child: ClipOval(child: Image.asset('assets/images/avtar_team.png', height: 150, width: 150, fit: BoxFit.cover,),),
                ),
                Positioned(bottom: 1, right: 1 ,child: Container(
                  height: 40, width: 40,
                  child: Icon(Icons.add_a_photo, color: Colors.white,),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ))
              ],
            ),
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]
                )
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Name', style: TextStyle(color: Colors.white70),),
                      ),
                    ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Email', style: TextStyle(color: Colors.white70),),
                      ),
                    ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Type something about yourself', style: TextStyle(color: Colors.white70),),
                      ),
                    ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Phone number', style: TextStyle(color: Colors.white70),),
                      ),
                    ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container( height: 70, width: 200,
                      child: Align(child: Text('Save', style: TextStyle(color: Colors.white70, fontSize: 20),),),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),)
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
          )
        ],
      );
    }
  }