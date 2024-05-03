import 'dart:async';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/technical%20support/presentation/view/connect.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/home/presentation/views/widgets/appbartittle.dart';
import 'package:ghhg/features/home/presentation/views/widgets/customappbaractions.dart';
import 'package:ghhg/features/home/presentation/views/widgets/customdraweitem.dart';
import 'package:ghhg/features/home/presentation/views/widgets/customgriditem.dart';
import 'package:ghhg/features/notifications/presentations/view/alertnotifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

// ignore: camel_case_types, use_key_in_widget_constructors
class desktoplayout extends StatefulWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<desktoplayout> createState() => _desktoplayoutState();
}

class _desktoplayoutState extends State<desktoplayout> {
   /*void notificationhandle() {
    inhome = true;
    if (BlocProvider.of<HomeCubit>(context).firstfirebasenotifications &&
        this.mounted) {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (inhome && this.mounted) {
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
  }*/
  int x = 0;
  Timer? timer;
  @override
  void initState() {
  //  notificationhandle();

    /*if (context.mounted)
      timer = Timer.periodic(
          Duration(seconds: 15),
          (Timer t) =>
              BlocProvider.of<HomeCubit>(context).gethome(token: generaltoken));*/
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: widget.scafoldstate,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: appbartittle(
            sizedboxwidth: Appsizes.size5.w,
            fontSize: 15,
          ),
          leading: const Text(''),
          leadingWidth: 0,
          titleSpacing: 10,
          backgroundColor: Appcolors.maincolor,
          actions: [
            customappbaractions(
              onTapmessage: (() {
                navigateto(navigationscreen: Connect(), context: context);
              }),
              onTapnotific: (() {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        title: Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.close)),
                        ),
                        content: alernotifications(
                          tablet_or_mobile: "",
                          counter: BlocProvider.of<HomeCubit>(context)
                              .sidebar[13]["count"],
                        ),
                      );
                    }));
              }),
            )
          ],
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is Homefailure)
              showsnack(comment: state.error_message, context: context);
          },
          builder: (context, state) {
            if (state is Homeloading)
              return loading();
            else if (state is Homefailure) return SizedBox();

            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Appcolors.maincolor,
                  child: ListView(
                      children: BlocProvider.of<HomeCubit>(context)
                          .sidebarpermessions
                          .map((e) => e["name"] == "الاشعارات" ||
                                  e["name"] == "الصفحه الرئيسيه"
                              ? SizedBox()
                              : Column(
                                  children: [
                                    customdraweritem(
                                        mykey: widget.scafoldstate,
                                        count: e["count"],
                                        sizedboxwidth: 3.w,
                                        textstyle: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                        iconsize: 21,
                                        iconData: e["icon"],
                                        text: e["name"],
                                        onTap: () {
                                          navigateto(
                                              navigationscreen: e["page"],
                                              context: context);
                                        }),
                                    SizedBox(
                                      height: 22,
                                    )
                                  ],
                                ))
                          .toList()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 1,
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            childAspectRatio: 1.53,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 5.w),
                        children: BlocProvider.of<HomeCubit>(context)
                            .gridpermessions
                            .map((e) => GestureDetector(
                                  child: customgriditem(
                                      imagewidth: 50,
                                      textfontsize: 13.5,
                                      image: e.icon!,
                                      onTap: () {
                                        navigateto(
                                            navigationscreen:
                                                BlocProvider.of<HomeCubit>(
                                                        context)
                                                    .homenavigation[e.name],
                                            context: context);
                                      },
                                      count: e.count!.toInt(),
                                      name: e.name!),
                                ))
                            .toList()),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
