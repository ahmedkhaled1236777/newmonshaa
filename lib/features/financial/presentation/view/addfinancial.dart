import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/contracts/presentation/views/customshoosedate.dart';
import 'package:ghhg/features/financial/data/model/financialmodelrequest.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_cubit.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghhg/core/commn/sound.dart';

class addfinancial extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;
  addfinancial({super.key, required this.formkey, required this.width});

  @override
  State<addfinancial> createState() => _addfinancialState();
}

class _addfinancialState extends State<addfinancial> {
  @override
  void initState() {
    /*  BlocProvider.of<financialCubit>(context).clearcontrollers();
    BlocProvider.of<DateCubit>(context).cleardates();*/
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Container(
        height: double.infinity,
        width: widget.width,
        color: Colors.white,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.h,
                  ),
                  Image.asset(
                    'images/mone.png',
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('سند قبض',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff2ba4c8),
                          fontWeight: FontWeight.w100),
                      textAlign: TextAlign.right),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<financialCubit, financialState>(
                    builder: (context, state) {
                      return custommytextform(
                        readonly: true,
                        controller:
                            BlocProvider.of<financialCubit>(context).tenantname,
                        hintText: "اسم المستأجر",
                        val: "برجاء ادخال اسم المستأجر",
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<financialCubit, financialState>(
                    builder: (context, state) {
                      return custommytextform(
                        readonly: true,
                        controller:
                            BlocProvider.of<financialCubit>(context).ownername,
                        hintText: "اسم المالك",
                        val: "برجاء ادخال اسم المالك",
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<DateCubit, DateState>(
                    builder: (context, state) {
                      return choosedatecontract(
                        date: BlocProvider.of<DateCubit>(context).date1,
                        onPressed: () {
                          BlocProvider.of<DateCubit>(context)
                              .changedate(context);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: Appsizes.size10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<financialCubit, financialState>(
                    builder: (context, state) {
                      return custommytextform(
                        readonly: true,
                        controller: BlocProvider.of<financialCubit>(context)
                            .amountofmoney,
                        hintText: "قيمة القسط",
                        val: "برجاء ادخال قيمة القسط ",
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<DateCubit, DateState>(
                    builder: (context, state) {
                      return choosedatecontract(
                        date: BlocProvider.of<DateCubit>(context).date3,
                        onPressed: () {
                          BlocProvider.of<DateCubit>(context)
                              .changedate3(context);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<DateCubit, DateState>(
                    builder: (context, state) {
                      return choosedatecontract(
                        date: BlocProvider.of<DateCubit>(context).date4,
                        onPressed: () {
                          BlocProvider.of<DateCubit>(context)
                              .changedate4(context);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocConsumer<financialCubit, financialState>(
                    listener: (context, state) async {
                      if (state is Addfinancialfailure)
                        showsnack(
                            comment: state.error_message, context: context);
                      else if (state is Addfinancialsuccess) {
                        sound.playsound();
                        BlocProvider.of<financialCubit>(context).id = null;
                        BlocProvider.of<financialCubit>(context)
                            .clearcontrollers();

                        BlocProvider.of<DateCubit>(context).cleardates();
                        BlocProvider.of<financialCubit>(context)
                            .queryParameters = null;
                        await BlocProvider.of<financialCubit>(context)
                            .getallfinancials(token: generaltoken, page: 1);
                        showsnack(
                            comment: state.success_message, context: context);
                      }
                    },
                    builder: (context, state) {
                      if (state is Addfinancialloading) return loading();
                      return custommaterialbutton(
                          onPressed: () async {
                            if (widget.formkey.currentState!.validate()) {
                              if (BlocProvider.of<DateCubit>(context).date1 ==
                                  "التاريخ") {
                                showdialogerror(
                                    error: "برجاء اختيار التاريخ",
                                    context: context);
                              } else if (BlocProvider.of<DateCubit>(context)
                                      .date3 ==
                                  "الايجار من") {
                                showdialogerror(
                                    error: "برجاء اختيار تاريخ الايجار من",
                                    context: context);
                              } else if (BlocProvider.of<DateCubit>(context)
                                      .date4 ==
                                  "الايجار الي") {
                                showdialogerror(
                                    error: "برجاء اختيار تاريخ الايجار الي",
                                    context: context);
                              } else {
                                await BlocProvider.of<financialCubit>(context)
                                    .addfinancial(
                                        token: generaltoken,
                                        financial: financialmodelrequest(
                                            date:
                                                BlocProvider.of<DateCubit>(context)
                                                    .date1,
                                            amountofmoney:
                                                BlocProvider.of<financialCubit>(
                                                        context)
                                                    .amountofmoney
                                                    .text,
                                            datefrom:
                                                BlocProvider.of<DateCubit>(context)
                                                    .date3,
                                            dateto: BlocProvider.of<DateCubit>(
                                                    context)
                                                .date4),
                                        id: BlocProvider.of<financialCubit>(
                                                context)
                                            .id!);
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
        ),
      ),
    );
  }
}
