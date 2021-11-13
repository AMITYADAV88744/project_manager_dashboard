import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_manager_dashboard/models/ProjectList.dart';
import '../../constants.dart';
import '../SelectTeam.dart';
import 'HeaderP.dart';

class ProjectBasketView extends StatefulWidget {
  const ProjectBasketView({Key? key}) : super(key: key);
  @override
  _ProjectBasketView createState() => _ProjectBasketView();
}


class _ProjectBasketView extends State<ProjectBasketView>  {
  final ScrollController _firstController = ScrollController();

  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            HeaderP(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: SizedBox(
                    height:double.maxFinite,
                        child:StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("ProjectBasket").snapshots(includeMetadataChanges: true),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>querySnapshot){
                            if(querySnapshot.hasError)
                              return Text("Some Error");
                            if(querySnapshot.connectionState==ConnectionState.waiting){
                              return CircularProgressIndicator();
                            }else {
                              final projectlist=querySnapshot.data!.docs;
                              return ListView.builder(itemBuilder: (context,index){
                                return Container(
                                margin: EdgeInsets.only(top: defaultPadding),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(defaultPadding),
                                  ),
                                ),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage:
                                    NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
                                  ),
                                  title: Text(projectlist[index]["p_title"]),
                                  onTap: (){
                                    String ptitle=projectlist[index]["p_title"];
                                    int pid=projectlist[index]["p_id"];
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SelectTeam(ptitle:ptitle,pid:pid),
                                        ));

                                  },
                                ),
                              );
                            },
                                itemCount:projectlist.length,
                            );
                            }
                          },
                        ),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



