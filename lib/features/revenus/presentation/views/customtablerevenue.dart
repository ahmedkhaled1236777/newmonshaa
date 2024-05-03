import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:ghhg/features/revenus/presentation/viewmodel/revenuecuibt/revenue_state.dart';
import 'package:ghhg/features/revenus/presentation/views/customtablerevenuitem.dart';
import 'package:ghhg/features/revenus/presentation/views/editrevenudialog.dart';
import 'package:ghhg/features/revenus/presentation/views/showrevenuedialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customtablerevenues extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtablerevenues(this.width);

  @override
  State<customtablerevenues> createState() => _customtablerevenuesState();
}

class _customtablerevenuesState extends State<customtablerevenues> {
  initscroll() async {
    await BlocProvider.of<revenueCubit>(context)
        .getallrevenues(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<revenueCubit>(context)
            .getallmorerevenues(token: generaltoken);
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
                children: BlocProvider.of<revenueCubit>(context)
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
              child: BlocConsumer<revenueCubit, revenueState>(
                  listener: (context, state) {
            if (state is showrevenuefailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
            if (state is deleterevenuefailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            if (state is showrevenueloadin) return loading();
            if (state is showrevenuefailure) return SizedBox();
            return BlocProvider.of<revenueCubit>(context).revenuedata.isEmpty
                ? nodata()
                : SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<revenueCubit>(context)
                                      .revenuedata
                                      .length
                              ? loading()
                              : showrevenuedialog(
                                  index: index,
                                  child: customtablerevenueitem(
                                      textStyle: Appstyles.gettabletextstyle(
                                          context: context),
                                      amount:
                                          BlocProvider.of<revenueCubit>(context)
                                              .revenuedata[index]
                                              .totalMoney
                                              .toString(),
                                      descrip:
                                          BlocProvider.of<revenueCubit>(context)
                                              .revenuedata[index]
                                              .description!,
                                      date:
                                          BlocProvider.of<revenueCubit>(context)
                                              .revenuedata[index]
                                              .transactionDate!,
                                      delet: IconButton(
                                          onPressed: () async {
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
                                                    revenueCubit, revenueState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is deleterevenuesuccess) {
                                                      Navigator.pop(context);

                                                      showsnack(
                                                          comment: state
                                                              .succes_message,
                                                          context: context);
                                                    }
                                                    if (state
                                                        is deleterevenuefailure) {
                                                      Navigator.pop(context);

                                                      showsnack(
                                                          comment: state
                                                              .errormessage,
                                                          context: context);
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    if (state
                                                        is deleterevenueloading)
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
                                                          await BlocProvider.of<
                                                                      revenueCubit>(
                                                                  context)
                                                              .deleterevenue(
                                                                  token:
                                                                      generaltoken,
                                                                  revenueid: BlocProvider.of<
                                                                              revenueCubit>(
                                                                          context)
                                                                      .revenuedata[
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
                                                tittle: "هل تريد حذف الايراد ؟",
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
                                          BlocProvider.of<revenueCubit>(context)
                                                  .desctype =
                                              BlocProvider.of<revenueCubit>(
                                                      context)
                                                  .revenuedata[index]
                                                  .description!;
                                          BlocProvider.of<DateCubit>(context)
                                                  .date1 =
                                              BlocProvider.of<revenueCubit>(
                                                      context)
                                                  .revenuedata[index]
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
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons.close)),
                                                  ),
                                                  surfaceTintColor:
                                                      Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0)),
                                                  scrollable: true,
                                                  content: editrevenuedialog(
                                                    width:
                                                        MediaQuery.sizeOf(
                                                                        context)
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
                                                                revenueCubit>(
                                                            context)
                                                        .revenuedata[index],
                                                    amount: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    revenueCubit>(
                                                                context)
                                                            .revenuedata[index]
                                                            .totalMoney!
                                                            .toString()),
                                                    ownername:
                                                        TextEditingController(
                                                            text: BlocProvider
                                                                    .of<revenueCubit>(
                                                                        context)
                                                                .revenuedata[
                                                                    index]
                                                                .ownerName!
                                                                .toString()),
                                                    adress: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    revenueCubit>(
                                                                context)
                                                            .revenuedata[index]
                                                            .realStateAddress!
                                                            .toString()),
                                                  ),
                                                );
                                              });
                                        },
                                      )),
                                );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: BlocProvider.of<revenueCubit>(context)
                                    .loading ==
                                true
                            ? BlocProvider.of<revenueCubit>(context)
                                    .revenuedata
                                    .length +
                                1
                            : BlocProvider.of<revenueCubit>(context)
                                .revenuedata
                                .length));
          })),
          Divider(
            color: Colors.black,
          ),
          BlocBuilder<revenueCubit, revenueState>(builder: (context, state) {
            return SizedBox(
              height: 40,
              child: Center(
                  child: Text(
                      "الاجمالى : ${BlocProvider.of<revenueCubit>(context).total == null ? 0 : BlocProvider.of<revenueCubit>(context).total}")),
            );
          })
        ]));
  }
}
