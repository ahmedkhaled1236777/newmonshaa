import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/financial/presentation/view/catch_print.dart';
import 'package:ghhg/features/financial/presentation/view/customtablefinancialsitem.dart';
import 'package:ghhg/features/financial/presentation/view/showfinancial.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_cubit.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/financialmodel/receipt.dart';

class customtableallmobilefinancials extends StatefulWidget {
  ScrollController scrollController = ScrollController();

  customtableallmobilefinancials();

  @override
  State<customtableallmobilefinancials> createState() =>
      _customtableallmobilefinancialsState();
}

class _customtableallmobilefinancialsState
    extends State<customtableallmobilefinancials> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<financialCubit, financialState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Appcolors.maincolor,
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
              ),
              title: Text(
                'سند قبض',
                style: TextStyle(
                    color: Colors.white, fontSize: Appsizes.mappBarsize),
              ),
              centerTitle: true,
              backgroundColor: Appcolors.maincolor,
            ),
            body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        color: Appcolors.buttoncolor,
                        child: Row(
                            children: BlocProvider.of<financialCubit>(context)
                                .mobileheadertabeleallfinancials
                                .map((e) => customheadertable(
                                      title: e,
                                      flex: e == "طباعه" ||
                                              e == "حذف" ||
                                              e == "رقم القسط"
                                          ? 2
                                          : 3,
                                      textStyle: Appstyles.getheadertextstyle(
                                          context: context),
                                    ))
                                .toList()),
                      ),
                      Expanded(
                          child:
                              BlocProvider.of<financialCubit>(context)
                                      .myreciepts
                                      .isEmpty
                                  ? nodata()
                                  : SingleChildScrollView(
                                      controller: widget.scrollController,
                                      child: ListView.separated(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: ((context) {
                                                      return showfinancial(
                                                        myreciept: BlocProvider
                                                                .of<financialCubit>(
                                                                    context)
                                                            .myreciepts[index],
                                                      );
                                                    }));
                                              },
                                              child: customtablefinancialsitem(
                                                  textStyle:
                                                      Appstyles.gettabletextstyle(
                                                          context: context),
                                                  cashnumber:
                                                      (BlocProvider.of<financialCubit>(
                                                                      context)
                                                                  .myreciepts
                                                                  .length -
                                                              index)
                                                          .toString(),
                                                  date: BlocProvider.of<financialCubit>(
                                                          context)
                                                      .myreciepts[index]
                                                      .transactionDate!,
                                                  tenantname:
                                                      BlocProvider.of<financialCubit>(
                                                              context)
                                                          .myreciepts[index]
                                                          .tenantName!,
                                                  amountofmoney:
                                                      BlocProvider.of<financialCubit>(
                                                              context)
                                                          .myreciepts[index]
                                                          .totalAmount
                                                          .toString(),
                                                  print: IconButton(
                                                      onPressed: () {
                                                        navigateto(
                                                            navigationscreen: PdfViewCatch(
                                                                data: BlocProvider.of<
                                                                            financialCubit>(
                                                                        context)
                                                                    .myreciepts[index]),
                                                            context: context);
                                                      },
                                                      icon: Icon(
                                                        Icons.print,
                                                        size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                600
                                                            ? 20.sp
                                                            : 22,
                                                      )),
                                                  delete: IconButton(
                                                      onPressed: () {
                                                        if (cashhelper.getdata(
                                                                key: "role") !=
                                                            "manager")
                                                          showsnack(
                                                              comment:
                                                                  "ليس لديك صلاحية الوصول للرابط",
                                                              context: context);
                                                        else
                                                          awsomdialogerror(
                                                            mywidget: BlocConsumer<
                                                                financialCubit,
                                                                financialState>(
                                                              listener:
                                                                  (context,
                                                                      state) {
                                                                if (state
                                                                    is deletefinancialsuccess) {
                                                                  Navigator.pop(
                                                                      context);

                                                                  showsnack(
                                                                      comment: state
                                                                          .succes_message,
                                                                      context:
                                                                          context);
                                                                }
                                                                if (state
                                                                    is deletefinancialfailure) {
                                                                  Navigator.pop(
                                                                      context);

                                                                  showsnack(
                                                                      comment: state
                                                                          .errormessage,
                                                                      context:
                                                                          context);
                                                                }
                                                              },
                                                              builder: (context,
                                                                  state) {
                                                                if (state
                                                                    is deletefinancialloading)
                                                                  return deleteloading();

                                                                return ElevatedButton(
                                                                    style:
                                                                        const ButtonStyle(
                                                                      backgroundColor: MaterialStatePropertyAll(Color.fromARGB(
                                                                          255,
                                                                          37,
                                                                          163,
                                                                          42)),
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      await BlocProvider.of<financialCubit>(context).deletefinancial(
                                                                          token:
                                                                              generaltoken,
                                                                          financialid: BlocProvider.of<financialCubit>(context)
                                                                              .myreciepts[index]
                                                                              .id!
                                                                              .toInt());
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      "تاكيد",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ));
                                                              },
                                                            ),
                                                            context: context,
                                                            tittle:
                                                                "هل تريد حذف سند القبض ؟",
                                                          );
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .delete_outline_outlined,
                                                        color: Colors.red,
                                                        size: 24,
                                                      ))),
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              const Divider(),
                                          itemCount:
                                              BlocProvider.of<financialCubit>(
                                                      context)
                                                  .myreciepts
                                                  .length)))
                    ])),
          ),
        );
      },
    );
  }
}
