import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/addaqarwithscaffold.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customtableaqar.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/search.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mobiladdaqaar extends StatelessWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

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
                'العقارات',
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
                          BlocProvider.of<ShowaqaratCubit>(context)
                              .queryParameters = null;
                          BlocProvider.of<ShowaqaratCubit>(context)
                              .data
                              .clear();
                          BlocProvider.of<ShowaqaratCubit>(context)
                              .getallaqarat(token: generaltoken, page: 1);
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Appcolors.whitecolor,
                        )),
                    search(),
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
                    navigationscreen: addaqarwithscafold(), context: context);
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
                customtableaqar(
                  (MediaQuery.of(context).size.width),
                )
              ],
            )),
      );
    });
  }
}
