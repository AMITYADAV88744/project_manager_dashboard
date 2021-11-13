import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:project_manager_dashboard/activity/Main_Screen.dart';
import 'package:project_manager_dashboard/activity/dashboard/DashConnection.dart';
import 'package:provider/provider.dart';
import 'Navigation_UI/controllers/MenuController.dart';
import 'activity/Authentication/LoginPage.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){

  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );

 // runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Management ',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
   home: LandingPage()
    );
   /* home: MultiProvider(
    providers: [
      ChangeNotifierProvider(
    create: (context) => MenuController(),
    )
    ],
    child: LandingPage(),
    )
    );
    */
  }
}
class LandingPage  extends StatelessWidget {
  final Future<FirebaseApp> _initiallize = Firebase.initializeApp();
   LandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initiallize,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var user=FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      return DashConnection();
                    } else {
                      return LoginPage();
                    }
                  }
                  return Scaffold(
                    body: Center(
                      child: Text("Loading......."),
                    ),
                  );
                }
            );
          }
          return Scaffold(
            body: Center(
              child: Text("Checking authentication...."),
            ),
          );
        }
    );
  }
}