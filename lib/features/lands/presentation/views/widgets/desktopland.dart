import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';

import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/addland.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customtableland.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/searchland.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktopland extends StatefulWidget {
  @override
  State<desktopland> createState() => _desktoplandState();
}

class _desktoplandState extends State<desktopland> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Color(0xff415769),
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text(
              'الاراضي',
              style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff415769),
            actions: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<ShowlandsCubit>(context).data.clear();
                        BlocProvider.of<ShowlandsCubit>(context)
                            .queryParameters = null;
                        BlocProvider.of<ShowlandsCubit>(context)
                            .getallalands(token: generaltoken, page: 1);
                      },
                      icon: Icon(Icons.refresh, color: Appcolors.whitecolor)),
                  landsearch(),
                  const SizedBox(
                    width: Appsizes.size10,
                  ),
                ],
              )
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addland(
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtableland((MediaQuery.of(context).size.width * 0.70))
              ],
            ),
          )),
    );
  }
}
