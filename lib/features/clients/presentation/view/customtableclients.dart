import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
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
import 'package:ghhg/features/clients/presentation/view/customtableclientitem.dart';
import 'package:ghhg/features/clients/presentation/view/editclientdialog.dart';
import 'package:ghhg/features/clients/presentation/view/showclientdialog.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customtableclientss extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableclientss(this.width);

  @override
  State<customtableclientss> createState() => _customtableclientssState();
}

class _customtableclientssState extends State<customtableclientss> {
  initscroll() async {
    await BlocProvider.of<clientsCubit>(context)
        .getallclientss(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<clientsCubit>(context)
            .getallmoreclientss(token: generaltoken);
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
                children: BlocProvider.of<clientsCubit>(context)
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
              child: BlocConsumer<clientsCubit, clientsState>(
                  listener: (context, state) {
            if (state is showclientsfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
            if (state is deleteclientsfailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            print(BlocProvider.of<clientsCubit>(context).clientsdata.length);
            if (state is showclientsloadin) return loadingshimmer();
            if (state is showclientsfailure) return SizedBox();
            return BlocProvider.of<clientsCubit>(context).clientsdata.isEmpty
                ? nodata()
                : SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<clientsCubit>(context)
                                      .clientsdata
                                      .length
                              ? loading()
                              : showclientsdialog(
                                  index: index,
                                  child: customtableclientsitem(
                                      textStyle: Appstyles.gettabletextstyle(
                                          context: context),
                                      clientname:
                                          BlocProvider.of<clientsCubit>(context)
                                              .clientsdata[index]
                                              .name
                                              .toString()!,
                                      clientphone:    cashhelper.getdata(
                        key: "permessions").contains("client_phone_hidden")?"مخفي":
                                          BlocProvider.of<clientsCubit>(context)
                                              .clientsdata[index]
                                              .phone!,
                                      status: clientstatussresponse[
                                          BlocProvider.of<clientsCubit>(context)
                                              .clientsdata[index]
                                              .status!],
                                      delet: IconButton(
                                          onPressed: () async {
                                            if (cashhelper.getdata(
                                                    key: "role") !=
                                                "manager")
                                                                                        showdialogerror(error: "! ليس لديك صلاحية الحذف لهذا البيان", context: context);

                                            else
                                              awsomdialogerror(
                                                mywidget: BlocConsumer<
                                                    clientsCubit, clientsState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is deleteclientssuccess) {
                                                      Navigator.pop(context);

                                                      showsnack(
                                                          comment: state
                                                              .successmessage,
                                                          context: context);
                                                    }
                                                    if (state
                                                        is deleteclientsfailure) {
                                                      Navigator.pop(context);

                                                      showsnack(
                                                          comment: state
                                                              .errormessage,
                                                          context: context);
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    if (state
                                                        is deleteclientsloading)
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
                                                                      clientsCubit>(
                                                                  context)
                                                              .deleteclients(
                                                                  token:
                                                                      generaltoken,
                                                                  clientsid: BlocProvider.of<
                                                                              clientsCubit>(
                                                                          context)
                                                                      .clientsdata[
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
                                                tittle: "هل تريد حذف العميل",
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
                                          if (BlocProvider.of<clientsCubit>(
                                                      context)
                                                  .clientsdata[index]
                                                  .inspectionDate !=
                                              null) {
                                            BlocProvider.of<DateCubit>(context)
                                                    .date5 =
                                                BlocProvider.of<clientsCubit>(
                                                        context)
                                                    .clientsdata[index]
                                                    .inspectionDate!;
                                          }
                                          if (BlocProvider.of<clientsCubit>(
                                                      context)
                                                  .clientsdata[index]
                                                  .inspectionTime !=
                                              null) {
                                            BlocProvider.of<DateCubit>(context)
                                                    .time =
                                                BlocProvider.of<clientsCubit>(
                                                        context)
                                                    .clientsdata[index]
                                                    .inspectionTime!;
                                          }
                                          BlocProvider.of<clientsCubit>(context)
                                                  .status =
                                              clientstatussresponse[
                                                  BlocProvider.of<clientsCubit>(
                                                          context)
                                                      .clientsdata[index]
                                                      .status];
                                          BlocProvider.of<clientsCubit>(context)
                                                  .clienttype =
                                              clientstyperesponsr[
                                                  BlocProvider.of<clientsCubit>(
                                                          context)
                                                      .clientsdata[index].clientType
                                                      ];
                                          BlocProvider.of<clientsCubit>(context)
                                                  .departement =
                                              clientsdepartementresponse[
                                                  BlocProvider.of<clientsCubit>(
                                                          context)
                                                      .clientsdata[index]
                                                      .department];

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
                                                            BlocProvider.of<
                                                                        DateCubit>(
                                                                    context)
                                                                .cleardates();
                                                            BlocProvider.of<
                                                                        clientsCubit>(
                                                                    context)
                                                                .cleardata();

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
                                                    content: editclientdialog(
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
                                                                  clientsCubit>(
                                                              context)
                                                          .clientsdata[index],
                                                      clientname:
                                                          TextEditingController(
                                                              text: BlocProvider
                                                                      .of<clientsCubit>(
                                                                          context)
                                                                  .clientsdata[
                                                                      index]
                                                                  .name
                                                                  .toString()),
                                                      clientphone:
                                                          TextEditingController(
                                                              text: BlocProvider
                                                                      .of<clientsCubit>(
                                                                          context)
                                                                  .clientsdata[
                                                                      index]
                                                                  .phone),
                                                      code: TextEditingController(
                                                          text: BlocProvider.of<
                                                                      clientsCubit>(
                                                                  context)
                                                              .clientsdata[
                                                                  index]
                                                              .code
                                                              .toString()),
                                                      notes: TextEditingController(
                                                          text: BlocProvider.of<
                                                                          clientsCubit>(
                                                                      context)
                                                                  .clientsdata[
                                                                      index]
                                                                  .notes ??
                                                              ""),
                                                    ));
                                              });
                                        },
                                      )),
                                );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: BlocProvider.of<clientsCubit>(context)
                                    .loading ==
                                true
                            ? BlocProvider.of<clientsCubit>(context)
                                    .clientsdata
                                    .length +
                                1
                            : BlocProvider.of<clientsCubit>(context)
                                .clientsdata
                                .length));
          }))
        ]));
  }
}
