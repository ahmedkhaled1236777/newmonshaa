import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/customchoosedate.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/revenus/data/model/revenuesmodelupdaterequest.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/revenumodel/datum.dart';

class editrevenuedialog extends StatefulWidget {
  final double width;
  final double height;
  final Datum data;
  final TextEditingController amount;
  final TextEditingController adress;
  final TextEditingController ownername;

  const editrevenuedialog(
      {super.key,
      required this.width,
      required this.height,
      required this.data,
      required this.amount,
      required this.adress,
      required this.ownername});

  @override
  State<editrevenuedialog> createState() => _editrevenuedialogState(
      amount: amount, adress: adress, ownername: ownername);
}

class _editrevenuedialogState extends State<editrevenuedialog> {
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController amount;
  final TextEditingController adress;
  final TextEditingController ownername;

  _editrevenuedialogState(
      {required this.amount, required this.adress, required this.ownername});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<revenueCubit, revenueState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9-.]")),
                          ],
                          keyboardType: TextInputType.number,
                          val: "برجاء ادخال المبلغ",
                          controller: amount,
                          hintText: "المبلغ"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال عنوان العقار",
                          controller: adress,
                          hintText: "عنوان العقار"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال اسم المالك",
                          controller: ownername,
                          hintText: "اسم المالك"),
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
              ),
              const SizedBox(
                height: Appsizes.size10,
              ),
              BlocConsumer<revenueCubit, revenueState>(
                listener: (context, state) async {
                  if (state is editrevenuefailure) {
                    showdialogerror(
                        error: state.error_message, context: context);
                  }
                  if (state is editrevenuesuccess) {
                    widget.amount.clear();
                    BlocProvider.of<revenueCubit>(context).cleardesctype();
                    BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                    await BlocProvider.of<revenueCubit>(context)
                        .getallrevenues(token: generaltoken, page: 1);
                    Navigator.pop(context);

                    showsnack(comment: state.success_message, context: context);
                  }
                },
                builder: (context, state) {
                  if (state is editrevenueloading) return loading();
                  return custommaterialbutton(
                      onPressed: () async {
                        BlocProvider.of<revenueCubit>(context).updaterevenue(
                            token: generaltoken,
                            id: widget.data.id!.toInt(),
                            revenuemodel: revenuesmodelupdaterequest(
                                ownername: ownername.text,
                                adress: adress.text,
                                amount: amount.text,
                                description:
                                    BlocProvider.of<revenueCubit>(context)
                                        .desctype!,
                                date:
                                    BlocProvider.of<DateCubit>(context).date1));
                      },
                      button_name: "تعديل الايرادات",
                      buttonicon: Icons.edit);
                },
              )
            ]),
          ),
        );
      },
    );
  }
}
