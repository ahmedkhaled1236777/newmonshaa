import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/desktopaqarat.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/mobileaddaqqar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Estate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EstateState();
  }
}

class EstateState extends State<Estate> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth > 950)
        return desktopaqarat();
      else {
        return mobiladdaqaar();
      }
    });
  }
}
