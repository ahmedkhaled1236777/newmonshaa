import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/nointernet.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/home/presentation/views/widgets/desktoplayout.dart';
import 'package:ghhg/features/home/presentation/views/widgets/mobilelayout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/features/notifications/presentations/viewmodel/notifications/notifications_cubit.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  @override
  intializedata() async {
   if (BlocProvider.of<HomeCubit>(context).first_time_interner == true) {
      var result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.none) {
        navigateto(navigationscreen: nointernet(), context: context);
      }

      BlocProvider.of<HomeCubit>(context).first_time_interner = false;
    }
    await BlocProvider.of<HomeCubit>(context).gethome(token: generaltoken);
    await BlocProvider.of<NotificationsCubit>(context)
        .getallnotifications(token: generaltoken, page: 1);
    insplash=false;
  }

  void initState() {
    intializedata();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktoplayout();
      } else {
        return mobilelayout(
          tablet_or_mobile: consters.maxWidth > 600 ? "tablet" : "mobile",
        );
      }
    });
  }
}
