import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/shimmer/shimmer.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/cashedimage.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/notifications/presentations/viewmodel/notifications/notifications_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class alernotifications extends StatefulWidget {
  final String tablet_or_mobile;
  int counter;
  alernotifications(
      {super.key, required this.tablet_or_mobile, required this.counter});
  ScrollController scrollController = ScrollController();

  @override
  State<alernotifications> createState() =>
      _alernotificationsmobilenotificationslayoutState();
}

class _alernotificationsmobilenotificationslayoutState
    extends State<alernotifications> {
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
        child: SizedBox(
          width: 400,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "الاشعارات",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocConsumer<NotificationsCubit, NotificationsState>(
                  listener: (context, state) {
                    if (state is Notificationsfailure)
                      showsnack(comment: state.error_message, context: context);

                    if (state is Notificationssuccess) {
                      BlocProvider.of<HomeCubit>(context).resetcounter();
                    }
                  },
                  builder: (context, state) {
                    if (state is Notificationsloading) return loadingnotificationshimmer ();
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
                                      BlocProvider.of<NotificationsCubit>(
                                                  context)
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
                                          cashhelper.getdata(key: "logo") ==
                                                  null
                                              ? const CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: AssetImage(
                                                      "images/logo.png"),
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
                            itemCount: BlocProvider.of<NotificationsCubit>(
                                            context)
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
                ),
              ),
            ],
          ),
        ));
  }
}
