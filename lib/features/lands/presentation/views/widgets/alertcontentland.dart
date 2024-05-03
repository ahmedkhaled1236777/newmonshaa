import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';

import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';

import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandcuibt.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandstate.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class landalertcontent extends StatefulWidget {
  @override
  State<landalertcontent> createState() => _landalertcontentState();
}

class _landalertcontentState extends State<landalertcontent> {
  TextEditingController adress = TextEditingController();

  TextEditingController pricefrom = TextEditingController();

  TextEditingController priceto = TextEditingController();

  TextEditingController minimumarea = TextEditingController();

  TextEditingController maximumarea = TextEditingController();

  TextEditingController advertisecode = TextEditingController();

  static final GlobalKey<FormState> minimumareak = GlobalKey<FormState>();

  static final GlobalKey<FormState> maxareak = GlobalKey<FormState>();

  static final GlobalKey<FormState> minpricek = GlobalKey<FormState>();

  static final GlobalKey<FormState> maxpricek = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<addlandcuibt, addlandstate>(builder: (context, state) {
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
                            controller: adress,
                            hintText: "العنوان",
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          BlocBuilder<addaqarcuibt, addaqarstate>(
                            builder: (context, state) {
                              return dropdownbutton(
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
                              );
                            },
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          Form(
                            key: minpricek,
                            child: custommytextform(
                                val: "برجاء ادخال سعر المتر من",
                                controller: pricefrom,
                                hintText: "سعر المتر من"),
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          Form(
                            key: maxpricek,
                            child: custommytextform(
                                val: "برجاء ادخال سعر المتر الي",
                                controller: priceto,
                                hintText: "سعر المتر الي"),
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
                                BlocProvider.of<addlandcuibt>(context)
                                    .changeaddaqaradvistortype(val);
                              },
                              items: ["صاحب الارض", "شركة عقارات"],
                              name: BlocProvider.of<addlandcuibt>(context)
                                  .advistor_type,
                              hint: "نوع المعلن"),
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
                            onPressed: () {
                              if (minimumarea.text.isEmpty &&
                                  maximumarea.text.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child:
                                                Text("برجاء ادخال اقل مساحه"),
                                          ),
                                          SizedBox(
                                            height: Appsizes.size15,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("تم")),
                                          )
                                        ],
                                      );
                                    });
                              } else if (minimumarea.text.isNotEmpty &&
                                  maximumarea.text.isEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child:
                                                Text("برجاء ادخال اعلي مساحه"),
                                          ),
                                          SizedBox(
                                            height: Appsizes.size15,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("تم")),
                                          )
                                        ],
                                      );
                                    });
                              } else if (pricefrom.text.isEmpty &&
                                  priceto.text.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                                "برجاء ادخال سعر المتر من"),
                                          ),
                                          const SizedBox(
                                            height: Appsizes.size15,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("تم")),
                                          )
                                        ],
                                      );
                                    });
                              } else if (priceto.text.isEmpty &&
                                  pricefrom.text.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                                "برجاء ادخال سعر المتر الي"),
                                          ),
                                          SizedBox(
                                            height: Appsizes.size15,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("تم")),
                                          )
                                        ],
                                      );
                                    });
                              } else {
                                BlocProvider.of<ShowlandsCubit>(context)
                                    .queryParameters = {
                                  "address": adress.text,
                                  "user_id":
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .employeeid,
                                  "advertiser_type": requestland[
                                      BlocProvider.of<addlandcuibt>(context)
                                          .advistor_type],
                                  "lowest_price": pricefrom.text.isEmpty
                                      ? null
                                      : num.parse(pricefrom.text),
                                  "highest_price": priceto.text.isEmpty
                                      ? null
                                      : num.parse(priceto.text),
                                  "lowest_space": minimumarea.text,
                                  "highest_space": maximumarea.text,
                                  "code": advertisecode.text,
                                };
                                BlocProvider.of<ShowlandsCubit>(context)
                                    .data
                                    .clear();

                                BlocProvider.of<addaqarcuibt>(context)
                                    .employeeid = null;
                                BlocProvider.of<DateCubit>(context)
                                    .cleardates();

                                Navigator.pop(context);
                                BlocProvider.of<ShowlandsCubit>(context)
                                    .getallalands(
                                  token: generaltoken,
                                  page: 1,
                                );
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
