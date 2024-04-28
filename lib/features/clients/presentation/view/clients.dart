import 'package:ghhg/features/clients/presentation/view/desktopclients.dart';
import 'package:ghhg/features/clients/presentation/view/mobileclients.dart';
import 'package:flutter/material.dart';

class clients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktopclientss();
      } else {
        return mobileclientss();
      }
    });
  }
}
