import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/features/auth/login/presentation/views/login.dart';
import 'package:ghhg/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogoAnimationScreen extends StatefulWidget {
  const LogoAnimationScreen();

  @override
  LogoAnimationScreenState createState() => LogoAnimationScreenState();
}

class LogoAnimationScreenState extends State<LogoAnimationScreen> {
  bool isFirst = true;
  bool issecond = false;
  bool vis = false;

  int align = 0;
  bool showtext = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          isFirst = false;
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() {
          issecond = true;
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 1100), () {
      if (mounted) {
        setState(() {
          showtext = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPadding(
              duration: const Duration(seconds: 500),
              padding: EdgeInsets.only(bottom: issecond ? 5 : 0),
              child: AnimatedScale(
              
                scale: isFirst ? 0.1 :MediaQuery.sizeOf(context).width<950?1: 2,
                duration: const Duration(milliseconds: 600),
                // width: isFirst ? 180 : 83,
                // height: isFirst ? 170 : 84,
                child: Image.asset(
                  "images/splash-2.png",
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            AnimatedRotation(
              duration: const Duration(milliseconds: 600),
              turns: issecond ? .25 : 0,
              child: AnimatedAlign(
                alignment: isFirst ? Alignment.topCenter : Alignment.center,
                duration: const Duration(milliseconds: 400),
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: isFirst ? 0 : -1.25,
                  child: SizedBox(
                    width: 296,
                    height: 282,
                    child: Image.asset("images/splash1.PNG"),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 100,
                child: AnimatedOpacity(
                    onEnd: () {
                      navigateandfinish(
                          navigationscreen:
cashhelper.getdata(key: "token")!=null?MyHomePage():Login()                                  ,
                          context: context);
                    },
                    // If the widget is visible, animate to 0.0 (invisible).
                    // If the widget is hidden, animate to 1.0 (fully visible).
                    opacity: showtext ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1500),
                    // The green box must be a child of the AnimatedOpacity widget.
                    child: const Text(
                      "M o n s h a a",
                      style: TextStyle(
                        fontSize: 70.0,
                        fontFamily: 'Tre',
                        color: Color.fromARGB(255, 203, 171, 90),
                      ),
                    ))),
          ],
        ));
  }
}
