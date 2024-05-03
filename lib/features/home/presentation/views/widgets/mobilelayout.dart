import 'dart:math';

import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/technical%20support/presentation/view/connect.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/home/presentation/views/widgets/customappbaractions.dart';
import 'package:ghhg/features/home/presentation/views/widgets/customgriditem.dart';
import 'package:ghhg/features/home/presentation/views/widgets/leadinappbar.dart';
import 'package:ghhg/features/notifications/presentations/view/mobilenotifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class mobilelayout extends StatefulWidget {
  final String tablet_or_mobile;

  mobilelayout({super.key, required this.tablet_or_mobile});
  @override
  State<mobilelayout> createState() => _mobilelayoutState();
}

class _mobilelayoutState extends State<mobilelayout> {
  @override
  initState() {
    notificationhandle();
  }

  void notificationhandle() {
    inhome = true;
    if (BlocProvider.of<HomeCubit>(context).firstfirebasenotifications &&
        this.mounted) {
     
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (inhome && this.mounted) {
           print(
          "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");

          BlocProvider.of<HomeCubit>(context).gethome(token: generaltoken);
        }
        AwesomeNotifications()
            .createNotification(
                content: NotificationContent(
                    id: Random().nextInt(1000),
                    channelKey: "newas",
                    body: message.notification!.body,
                    title: message.notification!.title))
            .then((value) {})
            .onError((error, stackTrace) {
          print(error);
          showsnack(comment: error.toString(), context: context);
        }).catchError((e) {
          showsnack(comment: e.toString(), context: context);
        });
      });
      BlocProvider.of<HomeCubit>(context).firstfirebasenotifications = false;
    }
  }

  final GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scafoldstate,
        appBar: AppBar(
          backgroundColor: Appcolors.maincolor,
          leading: leadingappbar(
            scafoldstate: scafoldstate,
          ),
          title: Text(
            'الرئيسية',
            style: widget.tablet_or_mobile == "mobile"
                ? Appstyles.textStyle14wm
                : Appstyles.textStyle14wt,
          ),
          centerTitle: true,
          actions: [
            customappbaractions(onTapnotific: () {
              navigateto(
                  navigationscreen: mobilenotificationslayout(
                    tablet_or_mobile: "mobile",
                    counter: BlocProvider.of<HomeCubit>(context).sidebar[13]
                        ["count"],
                  ),
                  context: context);
            }, onTapmessage: () {
              navigateto(navigationscreen: Connect(), context: context);
            }),
            SizedBox(
              width: 7.w,
            ),
          ],
        ),
        drawer: Dashboard(mykey: scafoldstate),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is Homefailure)
              showsnack(comment: state.error_message, context: context);
          },
          builder: (context, state) {
            if (state is Homeloading)
              return loading();
            else if (state is Homefailure) return SizedBox();
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.center,
              width: double.infinity,
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          widget.tablet_or_mobile == "tablet" ? 3 : 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  children: BlocProvider.of<HomeCubit>(context)
                      .gridpermessions
                      .map((e) => customgriditem(
                          imagewidth: 45,
                          textfontsize: 12.5,
                          image: e.icon!,
                          onTap: () {
                            navigateto(
                                navigationscreen:
                                    BlocProvider.of<HomeCubit>(context)
                                        .homenavigation[e.name],
                                context: context);
                          },
                          count: e.count!.toInt(),
                          name: e.name!))
                      .toList()),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    inhome = false;
    super.dispose();
  }
}
