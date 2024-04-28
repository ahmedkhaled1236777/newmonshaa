import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/core/commn/widgets/customshoosedate.dart';
import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/presentation/viewmodel/revenus/revenusreports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class revenusatalertcontent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                  width:MediaQuery.sizeOf(context).width > 950
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
                                BlocProvider.of<revenusatreportsCubit>(context)
                                    .queryParameters = {
                                  "date_from":
                                      BlocProvider.of<DateCubit>(context).date6,
                                  "date_to":
                                      BlocProvider.of<DateCubit>(context).date7
                                };
                                BlocProvider.of<DateCubit>(context)
                                    .cleardates();
                                Navigator.pop(context);
                                BlocProvider.of<revenusatreportsCubit>(context)
                                    .getallrevenusat(
                                        token: generaltoken, page: 1);
                              },
                            )
                          ]))))
            ])));
  }
}
