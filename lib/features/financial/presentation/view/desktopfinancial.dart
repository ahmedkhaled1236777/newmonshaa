import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/financial/presentation/view/addfinancial.dart';
import 'package:ghhg/features/financial/presentation/view/customtablefinancial.dart';
import 'package:ghhg/features/financial/presentation/view/financialsearch.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_cubit.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktopfinancials extends StatefulWidget {
  @override
  State<desktopfinancials> createState() => _desktopfinancialsState();
}

class _desktopfinancialsState extends State<desktopfinancials> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    BlocProvider.of<financialCubit>(context).dispose();
    BlocProvider.of<DateCubit>(context).cleardates();
  }

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
              'سند قبض',
              style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
            ),
            centerTitle: true,
            backgroundColor: Appcolors.maincolor,
            actions: [
              IconButton(
                  onPressed: () async {
                    BlocProvider.of<financialCubit>(context).queryParameters =
                        null;
                    await BlocProvider.of<financialCubit>(context)
                        .getallfinancials(token: generaltoken, page: 1);
                  },
                  icon: const Icon(Icons.refresh, color: Appcolors.whitecolor)),
              allfinancialsearch(),
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
                addfinancial(
                  formkey: formkey,
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtablefinancials(
                    (MediaQuery.of(context).size.width * 0.70)),
              ],
            ),
          )),
    );
  }
}
