import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';

import 'package:ghhg/core/styles/style.dart';

import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/editdialog.dart';

import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandcuibt.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customtablelanditem.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/editlanddialog.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/showestate.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableland extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableland(this.width);

  @override
  State<customtableland> createState() => _customtablelandState();
}

class _customtablelandState extends State<customtableland> {
  initscroll() {
    BlocProvider.of<ShowlandsCubit>(context)
        .getallalands(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<ShowlandsCubit>(context)
            .getamorelllands(token: generaltoken);
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
                children: BlocProvider.of<addlandcuibt>(context)
                    .headertable
                    .map((e) => MediaQuery.sizeOf(context).width < 650 &&
                            e == "نوع المعلن"
                        ? SizedBox()
                        : customheadertable(
                            title: e,
                            flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                            textStyle:
                                Appstyles.getheadertextstyle(context: context)))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<ShowlandsCubit, ShowlandsState>(
                  listener: (context, state) {
            if (state is Showlandsfailure)
              showsnack(comment: state.error_message, context: context);
            if (state is deletelandsfailure)
              showsnack(comment: state.error_message, context: context);
          }, builder: (context, state) {
            if (state is Showlandsloading) {
              return loading();
              // ignore: curly_braces_in_flow_control_structures
            } else if (state is Showlandsfailure) return const SizedBox();
            return BlocProvider.of<ShowlandsCubit>(context).data.isEmpty
                ? nodata()
                : SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<ShowlandsCubit>(context)
                                      .data
                                      .length
                              ? loading()
                              : InkWell(
                                  onTap: (() {
                                    navigateto(
                                        navigationscreen: mlandShowEstate(
                                          data: BlocProvider.of<ShowlandsCubit>(
                                                  context)
                                              .data[index],
                                        ),
                                        context: context);
                                  }),
                                  child: customtablelanditem(
                                    textStyle: Appstyles.gettabletextstyle(
                                        context: context),
                                    iconsize:
                                        MediaQuery.of(context).size.width < 600
                                            ? 20.sp
                                            : 22,
                                    adress:
                                        BlocProvider.of<ShowlandsCubit>(context)
                                            .data[index]
                                            .address!,
                                    totalcost:
                                        BlocProvider.of<ShowlandsCubit>(context)
                                            .data[index]
                                            .totalCost
                                            .toString(),
                                    priceofmeter:
                                        BlocProvider.of<ShowlandsCubit>(context)
                                            .data[index]
                                            .priceOfOneMeter
                                            .toString(),
                                    area:
                                        BlocProvider.of<ShowlandsCubit>(context)
                                            .data[index]
                                            .sizeInMetres
                                            .toString()!,
                                    advertise_type: showland[
                                        BlocProvider.of<ShowlandsCubit>(context)
                                            .data[index]
                                            .advertiserType!],
                                    edit: IconButton(
                                      icon: const Icon(
                                        Icons.edit_note,
                                        size: 29,
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<addlandcuibt>(context)
                                            .images = [];
                                        BlocProvider.of<EditlandCubit>(context)
                                            .advistor_type = null;
                                        BlocProvider.of<addlandcuibt>(context)
                                            .imageFile = [];
                                        BlocProvider.of<DatelandCubit>(context)
                                                .date1 =
                                            BlocProvider.of<ShowlandsCubit>(
                                                    context)
                                                .data[index]
                                                .createdAt!;
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
                                                  content: editlanddialog(
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
                                                                ShowlandsCubit>(
                                                            context)
                                                        .data[index],
                                                    adressdetails:
                                                        TextEditingController(
                                                            text: BlocProvider
                                                                    .of<ShowlandsCubit>(
                                                                        context)
                                                                .data[index]
                                                                .addressDetails),
                                                    adress: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    ShowlandsCubit>(
                                                                context)
                                                            .data[index]
                                                            .address),
                                                    clientname:
                                                        TextEditingController(
                                                            text: BlocProvider
                                                                    .of<ShowlandsCubit>(
                                                                        context)
                                                                .data[index]
                                                                .sellerName),
                                                    phone: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    ShowlandsCubit>(
                                                                context)
                                                            .data[index]
                                                            .sellerPhoneNumber
                                                            .toString()),
                                                    price: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    ShowlandsCubit>(
                                                                context)
                                                            .data[index]
                                                            .priceOfOneMeter
                                                            .toString()),
                                                    details: TextEditingController(
                                                        text: BlocProvider.of<
                                                                        ShowlandsCubit>(
                                                                    context)
                                                                .data[index]
                                                                .advertiseDetails ??
                                                            ""),
                                                    area: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    ShowlandsCubit>(
                                                                context)
                                                            .data[index]
                                                            .sizeInMetres
                                                            .toString()),
                                                  ));
                                            });
                                      },
                                    ),
                                    delet: BlocBuilder<ShowlandsCubit,
                                            ShowlandsState>(
                                        builder: (context, state) {
                                      return IconButton(
                                        icon: const Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          awsomdialogerror(
                                            mywidget: BlocConsumer<
                                                ShowlandsCubit, ShowlandsState>(
                                              listener: (context, state) {
                                                if (state
                                                    is deletelandssuccess) {
                                                  Navigator.pop(context);

                                                  showsnack(
                                                      comment:
                                                          state.successmessage,
                                                      context: context);
                                                }
                                                if (state
                                                    is deletelandsfailure) {
                                                  Navigator.pop(context);

                                                  showsnack(
                                                      comment:
                                                          state.error_message,
                                                      context: context);
                                                }
                                              },
                                              builder: (context, state) {
                                                return ElevatedButton(
                                                    style: const ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Color.fromARGB(
                                                                  255,
                                                                  37,
                                                                  163,
                                                                  42)),
                                                    ),
                                                    onPressed: () async {
                                                      await BlocProvider.of<
                                                                  ShowlandsCubit>(
                                                              context)
                                                          .deleteland(
                                                              token:
                                                                  generaltoken,
                                                              landnumber: BlocProvider
                                                                      .of<ShowlandsCubit>(
                                                                          context)
                                                                  .data[index]
                                                                  .id!
                                                                  .toInt());
                                                    },
                                                    child: const Text(
                                                      "تاكيد",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ));
                                              },
                                            ),
                                            context: context,
                                            tittle: "هل تريد حذف هذه الارض ؟",
                                          );
                                        },
                                      );
                                    }),
                                  ),
                                );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount:
                            BlocProvider.of<ShowlandsCubit>(context).loading ==
                                    true
                                ? BlocProvider.of<ShowlandsCubit>(context)
                                        .data
                                        .length +
                                    1
                                : BlocProvider.of<ShowlandsCubit>(context)
                                    .data
                                    .length),
                  );
          }))
        ]));
  }
}
