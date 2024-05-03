import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';

import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class alertcontent extends StatefulWidget {
  @override
  State<alertcontent> createState() => _alertcontentState();
}

class _alertcontentState extends State<alertcontent> {
  static final GlobalKey<FormState> minimumareak = GlobalKey<FormState>();
  static final GlobalKey<FormState> maxareak = GlobalKey<FormState>();
  static final GlobalKey<FormState> minpricek = GlobalKey<FormState>();
  static final GlobalKey<FormState> maxpricek = GlobalKey<FormState>();
  TextEditingController adress = TextEditingController();
  TextEditingController compoundname = TextEditingController();

  TextEditingController pricefrom = TextEditingController();

  TextEditingController priceto = TextEditingController();

  TextEditingController minimumarea = TextEditingController();

  TextEditingController maximumarea = TextEditingController();

  TextEditingController advertisecode = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<addaqarcuibt>(context).cleardata();
    BlocProvider.of<addaqarcuibt>(context).employeename = null;
    BlocProvider.of<addaqarcuibt>(context).employeeid = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<addaqarcuibt, addaqarstate>(builder: (context, state) {
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
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
                          custommytextform(
                            controller: compoundname,
                            hintText: "اسم الكمبوند",
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          custommytextform(
                            controller: adress,
                            hintText: "العنوان",
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          dropdownbutton(
                            items: BlocProvider.of<addaqarcuibt>(context)
                                        .allemployeesmodel ==
                                    null
                                ? []
                                : BlocProvider.of<addaqarcuibt>(context)
                                    .allemployeesmodel!
                                    .data!
                                    .map((e) => e.name!)
                                    .toList(),
                            hint: "اسم الموظف",
                            name: BlocProvider.of<addaqarcuibt>(context)
                                .employeename,
                            onchanged: (val) {
                              BlocProvider.of<addaqarcuibt>(context)
                                  .changeemployeename(val);
                            },
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          dropdownbutton(
                              onchanged: (val) {
                                BlocProvider.of<addaqarcuibt>(context)
                                    .changeaddaqardepartement(val);
                              },
                              name: BlocProvider.of<addaqarcuibt>(context)
                                  .departement,
                              items: ["بيع", "ايجار"],
                              hint: "القسم"),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          Form(
                            key: minpricek,
                            child: custommytextform(
                                val: "برجاء ادخال السعر من",
                                controller: pricefrom,
                                hintText: "السعر من"),
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          Form(
                            key: maxpricek,
                            child: custommytextform(
                                val: "برجاء ادخال السعر الى",
                                controller: priceto,
                                hintText: "السعر الي"),
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          custommytextform(
                              key: minimumareak,
                              val: "برجاء ادخال اقل مساحه",
                              controller: minimumarea,
                              hintText: "اقل مساحه"),
                          const SizedBox(
                            height: 10,
                          ),
                          custommytextform(
                              key: maxareak,
                              val: "برجاء ادخال اعلي مساحه",
                              controller: maximumarea,
                              hintText: "أعلي مساحه"),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          dropdownbutton(
                              onchanged: (val) {
                                BlocProvider.of<addaqarcuibt>(context)
                                    .changeaddaqartype(val);
                              },
                              items: [
                                "فيلا فارغه",
                                "شقه فارغه",
                                "شقه مفروشه",
                                "فيلا مفروشه",
                                "مكتب اداري فارغ",
                                "مكتب اداري مفروش",
                                "محل"
                              ],
                              name: BlocProvider.of<addaqarcuibt>(context)
                                  .aqartype,
                              hint: "نوع العقار"),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          custommytextform(
                              controller: advertisecode,
                              hintText: "كود الاعلان"),
                          const SizedBox(
                            height: Appsizes.size20,
                          ),
                          custommaterialbutton(
                            button_name: "بحث",
                            buttonicon: Icons.search,
                            onPressed: () async {
                              if (minimumarea.text.isEmpty &&
                                  maximumarea.text.isNotEmpty) {
                                showdialogerror(
                                    error: "برجاء ادخال اقل مساحه",
                                    context: context);
                              } else if (minimumarea.text.isNotEmpty &&
                                  maximumarea.text.isEmpty) {
                                showdialogerror(
                                    error: "برجاء ادخال اعلي مساحه",
                                    context: context);
                              } else if (pricefrom.text.isEmpty &&
                                  priceto.text.isNotEmpty) {
                                showdialogerror(
                                    error: "برجاء ادخال اقل سعر",
                                    context: context);
                              } else if (priceto.text.isEmpty &&
                                  pricefrom.text.isNotEmpty) {
                                showdialogerror(
                                    error: "برجاء ادخال اعلي سعر",
                                    context: context);
                              } else {
                                BlocProvider.of<ShowaqaratCubit>(context)
                                    .queryParameters = {
                                  "real_state_type": request[
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .aqartype],
                                  "compound_name": compoundname.text,
                                  "real_state_address": adress.text,
                                  "code": advertisecode.text,
                                  "user_id":
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .employeeid,
                                  "department": request[
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .departement],
                                  "lowest_price": pricefrom.text.isEmpty
                                      ? null
                                      : num.parse(pricefrom.text),
                                  "highest_price": priceto.text.isEmpty
                                      ? null
                                      : num.parse(priceto.text),
                                  "lowest_space": minimumarea.text,
                                  "highest_space": maximumarea.text,
                                  "code": advertisecode.text
                                };
                                BlocProvider.of<ShowaqaratCubit>(context)
                                    .data
                                    .clear();
                                BlocProvider.of<addaqarcuibt>(context)
                                    .cleardata();
                                BlocProvider.of<DateCubit>(context)
                                    .cleardates();
                                BlocProvider.of<addaqarcuibt>(context)
                                    .employeeid = null;
                                BlocProvider.of<addaqarcuibt>(context)
                                    .aqartype = null;
                                Navigator.pop(context);

                                await BlocProvider.of<ShowaqaratCubit>(context)
                                    .getallaqarat(token: generaltoken, page: 1);
                              }
                            },
                          )
                        ])),
                  ),
                )
              ])));
    });
  }
}
