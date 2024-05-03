import 'package:ghhg/features/settings/data/repos/upateprofilerepoimp.dart';
import 'package:ghhg/features/settings/presentation.dart/viewmodel/updateprofilecuibt/updateprofilecuibt.dart';
import 'package:ghhg/features/settings/presentation.dart/views/updatecompanyprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class updatepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return updatepageState();
  }
}

class updatepageState extends State<updatepage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => updateprofileCubit(updateprofilerepoimp()),
      child: LayoutBuilder(builder: (context, consters) {
        if (consters.maxWidth >= 950) {
          return updatecompanyprofile(
              width: MediaQuery.of(context).size.width * 0.4);
        } else {
          return updatecompanyprofile(width: MediaQuery.of(context).size.width);
        }
      }),
    );
  }
}
