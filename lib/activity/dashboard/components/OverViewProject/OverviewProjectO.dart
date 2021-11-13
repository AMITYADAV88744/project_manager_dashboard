import 'package:flutter/cupertino.dart';
import '../../../../constants.dart';
import '../chart.dart';
import '../team_member.dart';

class OverviewProjectO extends StatefulWidget {
  const OverviewProjectO({Key? key}) : super(key: key);

  @override
  _OverviewProjectOState createState() => _OverviewProjectOState();
}

class _OverviewProjectOState extends State<OverviewProjectO> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chart(),
        SizedBox(height: defaultPadding),

        TeamMember(),
    ]
    );
  }
}
