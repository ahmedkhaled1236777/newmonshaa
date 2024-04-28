import 'package:flutter/services.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/customchoosedate.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/revenus/data/model/revenumodelrequest.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_state.dart';
import 'package:ghhg/features/revenus/presentation/views/revenues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/commn/sound.dart';

class addrevenue extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addrevenue({super.key, required this.formkey, required this.width});

  @override
  State<addrevenue> createState() => _addrevenueState();
}

class _addrevenueState extends State<addrevenue> {
  TextEditingController amount = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController tenantname = TextEditingController();
  TextEditingController ownername = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<DateCubit>(context).cleardates();
    BlocProvider.of<revenueCubit>(context).cleardesctype();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: widget.width,
        color: Colors.white,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
        child: Form(
            key: widget.formkey,
            child: ListView(
              children: [
                Container(
                                width: MediaQuery.of(context).size.width * 0.27,
                
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.white,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/mmm.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('تسجيل الايرادات',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff2ba4c8),
                              fontWeight: FontWeight.w100),
                          textAlign: TextAlign.right),
                      const SizedBox(
                        height: 15,
                      ),
                      custommytextform(
                        controller: amount,
                          inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
  ], 
                                                            keyboardType: TextInputType.number,

                        hintText: "المبلغ",
                        val: "برجاء ادخال المبلغ",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                        controller: adress,
                        hintText: "عنوان العقار",
                        val: "برجاء ادخال عنوان العقار",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                        controller: tenantname,
                        hintText: "اسم المستأجر",
                        val: "برجاء ادخال اسم المستأجر",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                        controller: ownername,
                        hintText: "اسم المالك",
                        val: "برجاء ادخال اسم المالك",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<revenueCubit, revenueState>(
                        builder: (context, state) {
                          return dropdownbutton(
                              onchanged: (val) {
                                BlocProvider.of<revenueCubit>(context)
                                    .changedesctype(val);
                              },
                              items: ["عقد ايجار", "عقد بيع", "سند صرف"],
                              name: BlocProvider.of<revenueCubit>(context).desctype,
                              hint: "الوصف");
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      choosedate(),
                      const SizedBox(
                        height: Appsizes.size10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocConsumer<revenueCubit, revenueState>(
                        listener: (context, state) async {
                          if (state is Addrevenuefailure)
                            showsnack(comment: state.error_message, context: context);
                          if (state is Addrevenuesuccess) {
                            sound.playsound();
                                tenantname.clear();
                            ownername.clear();
                            adress.clear();
                            amount.clear();
                            BlocProvider.of<revenueCubit>(context).cleardesctype();
                            BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                            MediaQuery.sizeOf(context).width > 950
                                ? navigateandfinish(
                                    navigationscreen: revenues(), context: context)
                                : {
                                    await BlocProvider.of<revenueCubit>(context)
                                        .getallrevenues(token: generaltoken, page: 1),
                                    Navigator.pop(context),
                                  };
                  
                            showsnack(
                                comment: state.success_message, context: context);
                          }
                        },
                        builder: (context, state) {
                          if (state is Addrevenueloading) return loading();
                          return custommaterialbutton(
                              onPressed: () async {
                                if (widget.formkey.currentState!.validate()) {
                                   if (   BlocProvider.of<revenueCubit>(
                                                            context)
                                                        .desctype ==
                                      null) {
                                    showdialogerror(
                                        error: "برجاء اختيار الوصف",
                                        context: context);
                                  }
                                  if (BlocProvider.of<DateCubit>(context).date1 ==
                                      "التاريخ") {
                                    showdialogerror(
                                        error: "برجاء اختيار التاريخ",
                                        context: context);
                                  } else {
                                    await BlocProvider.of<revenueCubit>(context)
                                        .addrevenue(
                                            token: generaltoken,
                                            revenue: revenuesmodelrequest(
                                                type: "revenue",
                                                ownernamr: ownername.text,
                                                tenentname: tenantname.text,
                                                adress: adress.text,
                                                amount: amount.text,
                                                description:
                                                    BlocProvider.of<revenueCubit>(
                                                            context)
                                                        .desctype!,
                                                date: BlocProvider.of<DateCubit>(
                                                        context)
                                                    .date1));
                                  }
                                }
                              },
                              button_name: "تسجيل البيانات",
                              buttonicon: Icons.send);
                        },
                      )
                    ],
                  )),
                ),
              ],
            )));
  }
}
