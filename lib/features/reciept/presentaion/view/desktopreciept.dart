import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/reciept/presentaion/view/addreciept.dart';
import 'package:ghhg/features/reciept/presentaion/view/customtablereciept.dart';
import 'package:ghhg/features/reciept/presentaion/view/recieptsearch.dart';
import 'package:ghhg/features/reciept/presentaion/viewmodel/recieptcuibt/recieptcuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktopreciepts extends StatefulWidget {
  @override
  State<desktopreciepts> createState() => _desktoprecieptsState();
}

class _desktoprecieptsState extends State<desktopreciepts> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    BlocProvider.of<recieptCubit>(context).dispose();
    BlocProvider.of<DateCubit>(context).cleardates();
    BlocProvider.of<contractCubit>(context).commessiontype = null;
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
              'سند صرف',
              style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
            ),
            centerTitle: true,
            backgroundColor: Appcolors.maincolor,
            actions: [
              IconButton(
                  onPressed: () async {
                    BlocProvider.of<recieptCubit>(context).queryParameters =
                        null;
                    await BlocProvider.of<recieptCubit>(context)
                        .getallreciepts(token: generaltoken, page: 1);
                  },
                  icon: const Icon(Icons.refresh, color: Appcolors.whitecolor)),
              allrecieptsearch(),
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
                addreciept(
                  formkey: formkey,
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtablereciepts((MediaQuery.of(context).size.width * 0.70)),
              ],
            ),
          )),
    );
  }
}
