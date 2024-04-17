import 'package:ghhg/features/auth/logout/data/repo/logoutrepoimplementation.dart';
import 'package:ghhg/features/auth/logout/presentation/viewmodel/cubit/logout_cubit.dart';

import 'package:ghhg/features/settings/presentation.dart/views/customsettings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingState();
  }
}

class SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(logoutrepo: logoutrepoimplementation()),
      child: LayoutBuilder(builder: (context, consters) {
        if (consters.maxWidth >= 950) {
          return customsettings(width: MediaQuery.of(context).size.width * 0.4);
        } else {
          return customsettings(width: MediaQuery.of(context).size.width);
        }
      }),
    );
  }
}
