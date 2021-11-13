import 'package:flutter/material.dart';

import '../../../constants.dart';

class CheckBoxListTileDemo extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
  CheckBoxListTileModel.getUsers();


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: checkBoxListTileModel.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                margin: EdgeInsets.only(top: defaultPadding),
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(defaultPadding),
                  ),
                ),
              child: Column(
                children: <Widget>[
                  new CheckboxListTile(
                    activeColor: Colors.white70,
                    dense: true,
                    //font change
                    title: new Text(
                      checkBoxListTileModel[index].title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checkBoxListTileModel[index].isCheck,
                    onChanged: (bool? value) {
                      itemChange(value!,index);

                    },
                    /*  onChanged: (bool val) {
                          itemChange(val, index);
                        }*/
                  )
                ],
              ),
            );
          }),
    );
  }

  void itemChange(bool value, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = value;
    });
  }
}
class CheckBoxListTileModel {
  int userId;
  //String img;
  String title;
  bool isCheck;

  CheckBoxListTileModel({required this.userId,  required this.title, required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          //  img: 'assets/images/avtar_team.png',
          title: ""
              "Project Proposal",
          isCheck: true),
      CheckBoxListTileModel(
          userId: 2,
          // img: 'assets/images/avtar_team.png',
          title: "Synopsis",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          // img: 'assets/images/avtar_team.png',
          title: "Rubic 1",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          // img: 'assets/images/avtar_team.png',
          title: "Rupic 2",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          //img: 'assets/images/avtar_team.png',
          title: "Final Report",
          isCheck: false),
    ];
  }
}