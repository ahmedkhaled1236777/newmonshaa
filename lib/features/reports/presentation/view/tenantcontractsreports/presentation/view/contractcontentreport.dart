import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/core/commn/widgets/customshoosedate.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/viewmodel/contracts/contractsreport_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class contractsatalertcontent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width > 950
                      ? MediaQuery.sizeOf(context).width * 0.25
                      : MediaQuery.sizeOf(context).width * 1,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            Text('بحث بواسطة',
                                style: Appstyles.textStyle12
                                    .copyWith(color: Appcolors.bluecolor),
                                textAlign: TextAlign.right),
                            const SizedBox(
                              height: 15,
                            ),
                            BlocBuilder<DateCubit, DateState>(
                              builder: (context, state) {
                                return choosedatecontract(
                                  date:
                                      BlocProvider.of<DateCubit>(context).date6,
                                  onPressed: () {
                                    BlocProvider.of<DateCubit>(context)
                                        .changedate6(context);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            BlocBuilder<DateCubit, DateState>(
                              builder: (context, state) {
                                return choosedatecontract(
                                  date:
                                      BlocProvider.of<DateCubit>(context).date7,
                                  onPressed: () {
                                    BlocProvider.of<DateCubit>(context)
                                        .changedate7(context);
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            custommaterialbutton(
                              button_name: "بحث",
                              buttonicon: Icons.search,
                              onPressed: () {
                                if (BlocProvider.of<DateCubit>(context).date6 ==
                                    "التاريخ من")
                                  showdialogerror(
                                      error: "برجاء اختيار التاريخ من",
                                      context: context);
                                else if (BlocProvider.of<DateCubit>(context)
                                        .date7 ==
                                    "التاريخ الي")
                                  showdialogerror(
                                      error: "برجاء اختيار التاريخ الي",
                                      context: context);
                                else {
                                  BlocProvider.of<contractsatreportsCubit>(
                                          context)
                                      .queryParameters = {
                                    "date_from":
                                        BlocProvider.of<DateCubit>(context)
                                            .date6,
                                    "date_to":
                                        BlocProvider.of<DateCubit>(context)
                                            .date7
                                  };
                                  BlocProvider.of<DateCubit>(context)
                                      .cleardates();
                                  Navigator.pop(context);
                                  BlocProvider.of<contractsatreportsCubit>(
                                          context)
                                      .getallcontractsat(
                                          token: generaltoken, page: 1);
                                }
                              },
                            )
                          ]))))
            ])));
  }
}
