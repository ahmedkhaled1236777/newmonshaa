import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:ghhg/features/revenus/presentation/views/choosedates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class revenuesearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<DateCubit>(context).cleardates();
        showDialog(
          context: context,

          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              title: Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close)),
              ),
              content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
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
                                vertical: 20, horizontal: 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  const Text('بحث بواسطة',
                                      style: TextStyle(
                                          fontSize: 12.5,
                                          color: Color(0xff2ba4c8),
                                          fontWeight: FontWeight.w100),
                                      textAlign: TextAlign.right),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  choosedaterevenue(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  custommaterialbutton(
                                      onPressed: () async {
                                        if (BlocProvider.of<DateCubit>(context)
                                                .date6 ==
                                            "التاريخ من")
                                          showdialogerror(
                                              error: "برجاء اختيار التاريخ من",
                                              context: context);
                                        else if (BlocProvider.of<DateCubit>(
                                                    context)
                                                .date7 ==
                                            "التاريخ الي")
                                          showdialogerror(
                                              error: "برجاء اختيار التاريخ الي",
                                              context: context);
                                        else {
                                          BlocProvider.of<revenueCubit>(context)
                                              .queryParameters = {
                                            "date_from":
                                                BlocProvider.of<DateCubit>(
                                                        context)
                                                    .date6,
                                            "date_to":
                                                BlocProvider.of<DateCubit>(
                                                        context)
                                                    .date7,
                                          };

                                          BlocProvider.of<DateCubit>(context)
                                              .cleardates();
                                          Navigator.pop(context);
                                          await BlocProvider.of<revenueCubit>(
                                                  context)
                                              .getallrevenues(
                                                  token: generaltoken, page: 1);
                                        }
                                      },
                                      button_name: "بحث",
                                      buttonicon: Icons.search)
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Icon(
        Icons.search,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
