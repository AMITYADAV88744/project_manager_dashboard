import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_manager_dashboard/Navigation_UI/components/side_menu.dart';
import 'package:project_manager_dashboard/Navigation_UI/controllers/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import '../../responsive.dart';
import 'ProjectBasketView.dart';

class ProjectBasket extends StatefulWidget {
  const ProjectBasket({Key? key}) : super(key: key);
  @override
  _ProjectBasket createState() => _ProjectBasket();
}

class _ProjectBasket extends State<ProjectBasket> {

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: ProjectScreen(),
    );
  }
}
  class ProjectScreen extends StatelessWidget {
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
              child:ProjectBasketView(),
            ),
          ],
        ),
      ),
    );
  }
}