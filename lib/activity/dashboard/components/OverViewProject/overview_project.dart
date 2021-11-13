import 'package:flutter/cupertino.dart';
import '../../../../constants.dart';
import 'OverviewProjectM.dart';
import 'OverviewProjectO.dart';

class OverviewProject extends StatefulWidget {
  const OverviewProject({Key? key}) : super(key: key);

  @override
  _OverviewProjectState createState() => _OverviewProjectState();
}

class _OverviewProjectState extends State<OverviewProject> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child:LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const OverviewProjectM();//for mobile
          } else {
            return const OverviewProjectO();//for tab
          }
        },
      ),

    );
  }
}



















