import 'package:ghhg/core/commn/nointernet.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/features/auth/login/presentation/views/login.dart';
import 'package:ghhg/features/home/presentation/views/home.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class listeninternet {
  static Connectivity connect = Connectivity();
  static bool checked = false;
  static init() async {
    await connect.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        checked = true;
        Get.to(() => nointernet(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
      if (event != ConnectivityResult.none && checked == true) {
        checked = false;
        Get.back();
      }
    });
  }
}
