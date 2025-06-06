import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';

import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/addlandswithscaffold.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customtableland.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/searchland.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mobileland extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
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
                style: TextStyle(
                    color: Colors.white, fontSize: Appsizes.mappBarsize),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff415769),
              actions: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<ShowlandsCubit>(context)
                              .queryParameters = null;
                          BlocProvider.of<ShowlandsCubit>(context).data.clear();
                          BlocProvider.of<ShowlandsCubit>(context)
                              .getallalands(token: generaltoken, page: 1);
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: Appcolors.whitecolor,
                        )),
                    landsearch(),
                    const SizedBox(
                      width: Appsizes.size10,
                    ),
                  ],
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateto(
                    navigationscreen: addlandwithscafold(), context: context);
              },
              backgroundColor: Color(0xffBF4F51),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtableland(
                  (MediaQuery.of(context).size.width),
                )
              ],
            )),
      );
    });
  }
}
