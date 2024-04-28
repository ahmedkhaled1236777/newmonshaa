import 'dart:async';

import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/home/presentation/views/widgets/appbartittle.dart';
import 'package:ghhg/features/home/presentation/views/widgets/customdraweitem.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktopdrawer extends StatefulWidget {
  @override
  State<desktopdrawer> createState() => _desktopdrawerState();
}

class _desktopdrawerState extends State<desktopdrawer> {
  GlobalKey<ScaffoldState> mykey = GlobalKey<ScaffoldState>();

  Timer? timer;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          child: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: const Color(0xff415769),
              width: MediaQuery.of(context).size.width * 0.25,
              child: Container(
                child: ListView(
                  children: [
                    appbartittle(
                      sizedboxwidth: Appsizes.size5.w,
                      fontSize: 6.sp,
                    ),
                    SizedBox(
                      height: 5.h.sp,
                    ),
                    Column(
                      children: BlocProvider.of<HomeCubit>(context)
                          .sidebarpermessions
                          .map((e) => Column(
                                children: [
                                  customdraweritem(
                                      mykey: mykey,
                                      count: e["count"],
                                      sizedboxwidth: 3.w,
                                      textstyle: Appstyles.textStyle13wd,
                                      iconData: e["icon"],
                                      text: e["name"],
                                      onTap: () {
                                        BlocProvider.of<ShowaqaratCubit>(
                                                context)
                                            .queryParameters = null;
                                        BlocProvider.of<ShowlandsCubit>(context)
                                            .queryParameters = null;
                                        navigateandfinish(
                                            navigationscreen: e["page"],
                                            context: context);
                                      },
                                      iconsize: 8.sp.clamp(0, 8.sp)),
                                  SizedBox(
                                    height: 5.h.sp,
                                  )
                                ],
                              ))
                          .toList(),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
}
