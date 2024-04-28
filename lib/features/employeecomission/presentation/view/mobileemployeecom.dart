import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/employeecomission/presentation/view/addemployeecomwithscaffold.dart';
import 'package:ghhg/features/employeecomission/presentation/view/customtableemployeecom.dart';
import 'package:ghhg/features/employeecomission/presentation/view/employeecomsearch.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecocuibt.dart';

class mobileemployeecoms extends StatelessWidget {
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
                'عمولة الموظفين',
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
                          BlocProvider.of<employeecomCubit>(context)
                              .queryParameters = null;

                          BlocProvider.of<employeecomCubit>(context)
                              .getallemployeecoms(token: generaltoken, page: 1);
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Appcolors.whitecolor,
                        )),
                    employeecomsearch(),
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
                    navigationscreen: addemployeecomwithscafold(),
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
              children: [customtableemployeecoms(MediaQuery.sizeOf(context).width)],
            )),
      );
    });
  }
}
