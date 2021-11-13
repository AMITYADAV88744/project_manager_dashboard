import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_manager_dashboard/Navigation_UI/controllers/MenuController.dart';
import 'package:project_manager_dashboard/activity/dashboard/DashConnection.dart';
import 'package:project_manager_dashboard/activity/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../responsive.dart';
import '../Navigation_UI/components/side_menu.dart';

class Main_Screen extends StatefulWidget {

  const Main_Screen({Key? key}) : super(key: key);

  @override
  _Main_Screen createState() => _Main_Screen();
}

class _Main_Screen extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: MainScreen(),
    );

  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
