import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:ghhg/features/revenus/presentation/views/addrevenuewithscaffold.dart';
import 'package:ghhg/features/revenus/presentation/views/customtablerevenue.dart';
import 'package:ghhg/features/revenus/presentation/views/revenuessearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mobilerevenues extends StatelessWidget {
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
              title: const Text(
                'الايرادات',
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
                          BlocProvider.of<revenueCubit>(context)
                              .queryParameters = null;

                          BlocProvider.of<revenueCubit>(context)
                              .getallrevenues(token: generaltoken, page: 1);
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Appcolors.whitecolor,
                        )),
                    revenuesearch(),
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
                    navigationscreen: addrevenuewithscafold(),
                    context: context);
              },
              backgroundColor: Color(0xffBF4F51),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [customtablerevenues(MediaQuery.sizeOf(context).width)],
            )),
      );
    });
  }
}
