import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_manager_dashboard/activity/Main_Screen.dart';
import 'package:project_manager_dashboard/activity/dashboard/DashConnection.dart';

import 'Register.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

     late String _email;
     late String _pass;

     Future<void> _Signin() async{
       try {
         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
             email: _email,
             password: _pass
         );
         //DashConnection();
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashConnection()));
         print("User $userCredential");
       } on FirebaseAuthException catch (e) {
         print("Error: $e");
       } catch (e) {
         print(e);
       }
     }

  @override
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
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Project Management',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                TextButton(
                  onPressed: (){
                    //forgot password screen
                  },
                   style: TextButton.styleFrom(primary: Colors.blue),
                    child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Login '),
                        onPressed: () {
                          _Signin();
                        }
                    )),
                TextButton(
                  onPressed: (){
                    // Create Account
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
                  },
                  style: TextButton.styleFrom(primary: Colors.blue),
                  child: Text('Do not have !! Create Account'),
                ),
              ],
            )
        )
    );
     }
}

