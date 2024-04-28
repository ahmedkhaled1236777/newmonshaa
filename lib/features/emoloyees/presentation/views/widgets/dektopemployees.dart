import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/toast.dart';

import 'package:ghhg/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:ghhg/features/emoloyees/presentation/views/widgets/addemployee.dart';
import 'package:ghhg/features/emoloyees/presentation/views/widgets/customtableemployees.dart';
import 'package:ghhg/features/emoloyees/presentation/views/widgets/emplyeesearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktopemployees extends StatelessWidget {
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
              'الموظفين',
              style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
            ),
            centerTitle: true,
            backgroundColor: Appcolors.maincolor,
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<showemployeescuibt>(context)
                        .employeesdata
                        .clear();
                    BlocProvider.of<showemployeescuibt>(context)
                        .getallemployees(
                      page: 1,
                      token: generaltoken,
                    );
                  },
                  icon: Icon(Icons.refresh, color: Appcolors.whitecolor)),
              Row(
                children: [
                  emplyeesearch(),
                  const SizedBox(
                    width: 10,
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
                addemplyee(
                  formkey: formkey,
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtableemployees(
                    (MediaQuery.of(context).size.width * 0.70)),
              ],
            ),
          )),
    );
  }
}
