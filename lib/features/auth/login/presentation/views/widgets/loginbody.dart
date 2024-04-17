import 'package:ghhg/features/auth/login/presentation/views/widgets/desktoplayout.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/mobilelayout.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class loginbody extends StatefulWidget {
  @override
  State<loginbody> createState() => _loginbodyState();
}

class _loginbodyState extends State<loginbody> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 600) {
                return Desktoplayout();
              } else {
                return Mobilelayout();
              }
            },
          ),
        ));
  }
}
