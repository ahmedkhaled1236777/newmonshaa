import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/revenus/data/model/revenuesmodelupdaterequest.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_state.dart';
import 'package:ghhg/features/revenus/presentation/views/choosedates.dart';
import 'package:ghhg/features/revenus/presentation/views/revenues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/revenumodel/datum.dart';

class editrevenuedialog extends StatelessWidget {
  final double width;
  final double height;
  final Datum data;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController amount;
  final TextEditingController descreption;

  editrevenuedialog({
    super.key,
    required this.width,
    required this.height,
    required this.data,
    required this.amount,
    required this.descreption,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<revenueCubit, revenueState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: Appsizes.size20,
                ),
                Image.asset(
                  "images/mmm.png",
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل الايرادات',
                    style: Appstyles.textStyle12
                        .copyWith(color: Appcolors.bluecolor),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      custommytextform(
                          val: "برجاء ادخال المبلغ",
                          controller: amount,
                          hintText: "المبلغ"),
                      const SizedBox(
                        height: 10,
                      ),
                      dropdownbutton(
                        items: ["عقد ايجار", "عقد بيع", "سند صرف"],
                        hint: "الوصف",
                        name: BlocProvider.of<revenueCubit>(context).desctype,
                        onchanged: (val) {
                          BlocProvider.of<revenueCubit>(context)
                              .changedesctype(val);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      choosedate(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                BlocConsumer<revenueCubit, revenueState>(
                  listener: (context, state) {
                    if (state is editrevenuefailure) {
                      showsnack(comment: state.error_message, context: context);
                    }
                    if (state is editrevenuesuccess) {
                      amount.clear();
                      BlocProvider.of<revenueCubit>(context).cleardesctype();
                      BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                      navigateandfinish(
                          navigationscreen: revenues(), context: context);

                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editrevenueloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          BlocProvider.of<revenueCubit>(context).updaterevenue(
                              token: generaltoken,
                              id: data.id!.toInt(),
                              revenuemodel: revenuesmodelupdaterequest(
                                  amount: amount.text,
                                  description:
                                      BlocProvider.of<revenueCubit>(context)
                                          .desctype!,
                                  date: BlocProvider.of<DateCubit>(context)
                                      .date1));
                        },
                        button_name: "تعديل الايرادات",
                        buttonicon: Icons.edit);
                  },
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
