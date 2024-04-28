import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/employeecomission/presentation/view/addemployeecom.dart';
import 'package:ghhg/features/employeecomission/presentation/view/customtableemployeecom.dart';
import 'package:ghhg/features/employeecomission/presentation/view/employeecomsearch.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecocuibt.dart';

class desktopemployeecoms extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Appcolors.maincolor,
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text(
              'عمولة الموظفين',
              style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
            ),
            centerTitle: true,
            backgroundColor: Appcolors.maincolor,
            actions: [
              IconButton(
                  onPressed: () async {
                    BlocProvider.of<employeecomCubit>(context).queryParameters =
                        null;
                    BlocProvider.of<employeecomCubit>(context)
                        .getallemployeecoms(token: generaltoken, page: 1);
                  },
                  icon: Icon(Icons.refresh, color: Appcolors.whitecolor)),
              employeecomsearch(),
              SizedBox(
                width: 10,
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
                addemployeecom(
                  formkey: formkey,
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtableemployeecoms((MediaQuery.of(context).size.width * 0.70)),
              ],
            ),
          )),
    );
  }
}