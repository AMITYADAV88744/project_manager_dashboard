import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'task_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);
  final int crossAxisCount;
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Task",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
         // Chart(),
         CheckBoxListTileDemo(),
         /* StorageInfoCard(
            m_pic: "assets/images/avtar_team.png",
            m_name: "Amit Yadav",
            m_role: "Leader",
          ),
          StorageInfoCard(
            m_pic: "assets/images/avtar_team.png",
            m_name: "Yogesh Juneja",
            m_role: "UI Designer",
          ),
          StorageInfoCard(
            m_pic: "assets/images/avtar_team.png",
            m_name: "Aman Negi",
            m_role: "Tester",
          ),
          StorageInfoCard(
            m_pic: "assets/images/avtar_team.png",
            m_name: "Gulam Jilani",
            m_role: "Back-End ",
          ),

          */
        ],
      ),


      /*
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Progress Chart",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
       Chart(),
          StorageInfoCard(
            m_pic: "assets/images/avtar_team.png",
            m_name: "Amit Yadav",
            m_role: "Leader",
          ),
          StorageInfoCard(
            m_pic: "assets/images/avtar_team.png",
            m_name: "Yogesh Juneja",
            m_role: "UI Designer",
          ),
          StorageInfoCard(
            m_pic: "assets/images/avtar_team.png",
            m_name: "Aman Negi",
            m_role: "Tester",
          ),
          StorageInfoCard(
            m_pic: "assets/images/avtar_team.png",
            m_name: "Gulam Jilani",
            m_role: "Back-End ",
          ),
        ],
      ),
      */
    );
  }
}
