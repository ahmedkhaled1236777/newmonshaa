import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';

import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';

import 'package:ghhg/features/home/presentation/views/widgets/appbartittle.dart';
import 'package:ghhg/features/home/presentation/views/widgets/customdraweitem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> mykey;

  const Dashboard({super.key, required this.mykey});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, conters) {
      if (MediaQuery.sizeOf(context).width >= 950) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.19,
          child: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Color(0xff415769),
              width: MediaQuery.of(context).size.width * 0.25,
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    appbartittle(
                      sizedboxwidth: Appsizes.size5.w,
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: BlocProvider.of<HomeCubit>(context)
                          .sidebarpermessions
                          .map((e) => e["name"] == "الاشعارات" ||
                                  e["name"] == "الصفحه الرئيسيه"
                              ? SizedBox()
                              : Column(
                                  children: [
                                    customdraweritem(
                                        mykey: mykey,
                                        count: e["count"],
                                        sizedboxwidth: 3.w,
                                        textstyle: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                        iconData: e["icon"],
                                        text: e["name"],
                                        onTap: () {
                                          navigateto(
                                              navigationscreen: e["page"],
                                              context: context);
                                        },
                                        iconsize: 21),
                                    SizedBox(
                                      height: 22,
                                    )
                                  ],
                                ))
                          .toList(),
                    )
                  ],
                ),
              )),
        );
      } else {
        return Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Color(0xff415769),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.18,
                padding: EdgeInsets.all(10),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    appbartittle(
                      sizedboxwidth: Appsizes.size10.w,
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: BlocProvider.of<HomeCubit>(context)
                          .sidebarpermessions
                          .map((e) => e["name"] == "الاشعارات" ||
                                  e["name"] == "الصفحه الرئيسيه"
                              ? SizedBox()
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customdraweritem(
                                        mykey: mykey,
                                        count: e["count"],
                                        sizedboxwidth: 6.w,
                                        textstyle: TextStyle(
                                            fontSize: conters.maxWidth > 600
                                                ? 8.sp
                                                : 12.sp.clamp(0, 12.sp),
                                            color: Appcolors.whitecolor),
                                        iconData: e["icon"],
                                        text: e["name"],
                                        onTap: () {
                                          mykey.currentState!.closeDrawer();

                                          navigateto(
                                              navigationscreen: e["page"],
                                              context: context);
                                        },
                                        iconsize: conters.maxWidth > 600
                                            ? 15.sp
                                            : 20.sp),
                                    SizedBox(
                                      height: 20.h,
                                    )
                                  ],
                                ))
                          .toList(),
                    )
                  ],
                ),
              )),
        );
      }
    });
  }
}
