import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/shimmer/shimmer.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_state.dart';
import 'package:ghhg/features/expenses.dart/presentation/views/customtableexpenseitem.dart';
import 'package:ghhg/features/expenses.dart/presentation/views/editexpenseialog.dart';
import 'package:ghhg/features/expenses.dart/presentation/views/showexpensedialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customtableexpenses extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableexpenses(this.width);

  @override
  State<customtableexpenses> createState() => _customtableexpensesState();
}

class _customtableexpensesState extends State<customtableexpenses> {
  initscroll() async {
    await BlocProvider.of<expenseCubit>(context)
        .getallexpenses(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<expenseCubit>(context)
            .getallmoreexpenses(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: widget.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 50,
            color: Appcolors.buttoncolor,
            child: Row(
                children: BlocProvider.of<expenseCubit>(context)
                    .headertabel
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<expenseCubit, expenseState>(
                  listener: (context, state) {
            if (state is showexpensefailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
            if (state is deleteexpensefailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            if (state is showexpenseloadin) return loadingshimmer();
            if (state is showexpensefailure) return SizedBox();
            return BlocProvider.of<expenseCubit>(context).expensedata.isEmpty
                ? nodata()
                : SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<expenseCubit>(context)
                                      .expensedata
                                      .length
                              ? loading()
                              : showexpensedialog(
                                  index: index,
                                  child: customtableexpenseitem(
                                      textStyle: Appstyles.gettabletextstyle(
                                          context: context),
                                      amount:
                                          BlocProvider.of<expenseCubit>(context)
                                              .expensedata[index]
                                              .totalMoney
                                              .toString()!,
                                      descrip:
                                          BlocProvider.of<expenseCubit>(context)
                                              .expensedata[index]
                                              .description!,
                                      date:
                                          BlocProvider.of<expenseCubit>(context)
                                              .expensedata[index]
                                              .transactionDate!,
                                      delet: IconButton(
                                          onPressed: () async {
                                            if (cashhelper.getdata(
                                                    key: "role") !=
                                                "manager")
                                                                                       showdialogerror(error: "! ليس لديك صلاحية الحذف لهذا البيان", context: context);

                                            else
                                              awsomdialogerror(
                                                mywidget: BlocConsumer<
                                                    expenseCubit, expenseState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is deleteexpensesuccess) {
                                                      Navigator.pop(context);

                                                      showsnack(
                                                          comment: state
                                                              .success_message,
                                                          context: context);
                                                    }
                                                    if (state
                                                        is deleteexpensefailure) {
                                                      Navigator.pop(context);

                                                      showsnack(
                                                          comment: state
                                                              .errormessage,
                                                          context: context);
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    if (state
                                                        is deleteexpenseloading)
                                                      return deleteloading();
                                                    return ElevatedButton(
                                                        style:
                                                            const ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          37,
                                                                          163,
                                                                          42)),
                                                        ),
                                                        onPressed: () async {
                                                          await await BlocProvider
                                                                  .of<expenseCubit>(
                                                                      context)
                                                              .deleteexpense(
                                                                expense:BlocProvider.of<
                                                                              expenseCubit>(
                                                                          context)
                                                                      .expensedata[
                                                                          index].totalMoney! ,
                                                                  token:
                                                                      generaltoken,
                                                                  expenseid: BlocProvider.of<
                                                                              expenseCubit>(
                                                                          context)
                                                                      .expensedata[
                                                                          index]
                                                                      .id!
                                                                      .toInt());
                                                        },
                                                        child: const Text(
                                                          "تاكيد",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ));
                                                  },
                                                ),
                                                context: context,
                                                tittle: "هل تريد حذف المصروف ؟",
                                              );
                                          },
                                          icon: const Icon(
                                            size: 24,
                                            Icons.delete_outline_outlined,
                                            color: Colors.red,
                                          )),
                                      edit: IconButton(
                                        icon: const Icon(
                                          Icons.edit_note,
                                          size: 29,
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<DateCubit>(context)
                                                  .date1 =
                                              BlocProvider.of<expenseCubit>(
                                                      context)
                                                  .expensedata[index]
                                                  .transactionDate!;
                                          showDialog(
                                              barrierDismissible:
                                                  false, // user must tap button!

                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                    title: Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          icon: const Icon(
                                                              Icons.close)),
                                                    ),
                                                    surfaceTintColor: Colors
                                                        .white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0)),
                                                    scrollable: true,
                                                    content: editexpensedialog(
                                                      width: MediaQuery.sizeOf(context)
                                                                  .width >
                                                              950
                                                          ? MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.25
                                                          : MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              1,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.85,
                                                      data: BlocProvider.of<
                                                                  expenseCubit>(
                                                              context)
                                                          .expensedata[index],
                                                      amount: TextEditingController(
                                                          text: BlocProvider.of<
                                                                      expenseCubit>(
                                                                  context)
                                                              .expensedata[
                                                                  index]
                                                              .totalMoney!
                                                              .toString()),
                                                      descreption:
                                                          TextEditingController(
                                                              text: BlocProvider
                                                                      .of<expenseCubit>(
                                                                          context)
                                                                  .expensedata[
                                                                      index]
                                                                  .description),
                                                    ));
                                              });
                                        },
                                      )),
                                );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: BlocProvider.of<expenseCubit>(context)
                                    .loading ==
                                true
                            ? BlocProvider.of<expenseCubit>(context)
                                    .expensedata
                                    .length +
                                1
                            : BlocProvider.of<expenseCubit>(context)
                                .expensedata
                                .length));
          })),
          Divider(
            color: Colors.black,
          ),
          BlocBuilder<expenseCubit, expenseState>(builder: (context, state) {
            return SizedBox(
              height: 40,
              child: Center(
                  child: Text(
                      "الاجمالى : ${BlocProvider.of<expenseCubit>(context).total == null ? 0 : BlocProvider.of<expenseCubit>(context).total}")),
            );
          })
        ]));
  }
}
