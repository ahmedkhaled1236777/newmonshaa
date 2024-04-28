import 'package:ghhg/features/lands/presentation/views/widgets/desktopland.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/mobileland.dart';

import 'package:flutter/material.dart';

class landsEstate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return landsEstateState();
  }
}

class landsEstateState extends State<landsEstate> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth > 950)
        return desktopland();
      else {
        return mobileland();
      }
    });
  }
}
