import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_manager_dashboard/activity/Authentication/LoginPage.dart';

import '../Main_Screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String _email;
  late String _pass;
  late String _fullName;
  late String _userID;

  Future<void> _Signin() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _pass
      );
      CollectionReference users = FirebaseFirestore.instance.collection('USERS');
      users.doc(_userID).set({
        'full_name': _fullName,
        'email': _email,
        'password': _pass,
        'user_ID':_userID,
        'project':'false'
      }).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
      var newUser = userCredential.user;
      String newDisplayName = '$_userID';
      await newUser!
          .updateDisplayName(newDisplayName)
          .catchError((error) => print(error));
      print("User $userCredential");
      notifylisentner();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: AssetImage('assets/login_logo.png'),
                    ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Project Management',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (value){
                      _fullName=value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (value){
                      _userID=value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'UserID',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value){
                      _email=value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    onChanged: (value){
                      _pass=value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Register '),
                      onPressed: () {
                        _Signin();
                      }
                    )),
                FlatButton(
                  onPressed: (){
                    // Create Account
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  textColor: Colors.blue,
                  child: Text('Already have account!! Login '),
                ),
              ],
            ),
        ),
    );
  }

  void notifylisentner() {

    print ("succesfully create");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Main_Screen()));

  }
}


