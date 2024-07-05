import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/shimmer/shimmer.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/cashedimage.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/notifications/presentations/viewmodel/notifications/notifications_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mobilenotificationslayout extends StatefulWidget {
  final String tablet_or_mobile;
  int counter;
  mobilenotificationslayout(
      {super.key, required this.tablet_or_mobile, required this.counter});
  ScrollController scrollController = ScrollController();

  @override
  State<mobilenotificationslayout> createState() =>
      _mobilenotificationslayoutState();
}

class _mobilenotificationslayoutState extends State<mobilenotificationslayout> {
  @override
  initscroll() async {
    await BlocProvider.of<NotificationsCubit>(context)
        .getallnotifications(token: generaltoken, page: 1);

    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<NotificationsCubit>(context)
            .getallmorenotifications(token: generaltoken);
      }
    });
  }

  initState() {
    initscroll();
  }

  final GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<NotificationsCubit>(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
              ),
              backgroundColor: Appcolors.maincolor,
              title: Text(
                'الاشعارات',
                style: widget.tablet_or_mobile == "mobile"
                    ? Appstyles.textStyle14wm
                    : widget.tablet_or_mobile == "tablet"
                        ? Appstyles.textStyle14wt
                        : TextStyle(color: Colors.white, fontSize: 4.sp),
              ),
              centerTitle: true,
            ),
            body: BlocConsumer<NotificationsCubit, NotificationsState>(
              listener: (context, state) {
                if (state is Notificationsfailure)
                  showsnack(comment: state.error_message, context: context);

                if (state is Notificationssuccess) {
                  BlocProvider.of<HomeCubit>(context).resetcounter();
                }
              },
              builder: (context, state) {
                if (state is Notificationsloading) return loadingnotificationshimmer();
                if (state is Notificationsfailure) return SizedBox();
                return Container(
                    width: double.infinity,
                    child: ListView.separated(
                        controller: widget.scrollController,
                        itemBuilder: (context, index) {
                          return index >=
                                      BlocProvider.of<NotificationsCubit>(
                                              context)
                                          .mynotifications
                                          .length &&
                                  BlocProvider.of<NotificationsCubit>(context)
                                          .mynotifications
                                          .length !=
                                      0
                              ? loading()
                              : Container(
                                  color: index < widget.counter
                                      ? Color.fromARGB(255, 114, 177, 228)
                                      : Colors.white,
                                  height: 70,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      cashhelper.getdata(key: "logo") == null
                                          ? const CircleAvatar(
                                              radius: 20,
                                              backgroundImage:
                                                  AssetImage("images/logo.png"),
                                            )
                                          : imagefromrequest(
                                              url: cashhelper.getdata(
                                                  key: "logo"),
                                              height: 40,
                                              width: 40,
                                            ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          prov.mynotifications[index].body!,
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: index < widget.counter
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      )
                                    ],
                                  ));
                        },
                        separatorBuilder: ((context, index) => Container(
                              height: 1,
                              width: double.infinity,
                              color: const Color.fromARGB(255, 74, 73, 73),
                            )),
                        itemCount: BlocProvider.of<NotificationsCubit>(context)
                                    .loading ==
                                true
                            ? BlocProvider.of<NotificationsCubit>(context)
                                    .mynotifications
                                    .length +
                                1
                            : BlocProvider.of<NotificationsCubit>(context)
                                .mynotifications
                                .length));
              },
            )));
  }
}
