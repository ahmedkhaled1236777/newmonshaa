import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customtableitem.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/editdialog.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/showestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableaqar extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableaqar(this.width);

  @override
  State<customtableaqar> createState() => _customtableaqarState();
}

class _customtableaqarState extends State<customtableaqar> {
  initscroll() {
    BlocProvider.of<ShowaqaratCubit>(context).queryParameters = null;
    BlocProvider.of<ShowaqaratCubit>(context).data.clear();
    BlocProvider.of<ShowaqaratCubit>(context)
        .getallaqarat(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<ShowaqaratCubit>(context)
            .getamorellaqarat(token: cashhelper.getdata(key: "token"));
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
                children: BlocProvider.of<addaqarcuibt>(context)
                    .headertable
                    .map((e) => MediaQuery.sizeOf(context).width < 650 &&
                            e == "نوع المعلن"
                        ? SizedBox()
                        : customheadertable(
                            title: e,
                            flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                            textStyle:
                                Appstyles.getheadertextstyle(context: context),
                          ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<ShowaqaratCubit, ShowaqaratState>(
                  listener: (context, state) {
            if (state is Showaqaratfailure)
              showsnack(comment: state.error_message, context: context);
            if (state is deleteaqarfailure)
              showsnack(comment: state.error_message, context: context);
          }, builder: (context, state) {
            if (state is Showaqaratloading) {
              return loading();
              // ignore: curly_braces_in_flow_control_structures
            } else if (state is Showaqaratfailure) return const SizedBox();
            return BlocProvider.of<ShowaqaratCubit>(context).data.isEmpty
                ? nodata()
                : SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<ShowaqaratCubit>(context)
                                      .data
                                      .length
                              ? loading()
                              : InkWell(
                                  onTap: (() {
                                    navigateto(
                                        navigationscreen: mShowEstate(
                                          data:
                                              BlocProvider.of<ShowaqaratCubit>(
                                                      context)
                                                  .data[index],
                                        ),
                                        context: context);
                                  }),
                                  child: customtableitem(
                                      textStyle: Appstyles.gettabletextstyle(
                                          context: context),
                                      iconsize:
                                          MediaQuery.of(context).size.width < 600
                                              ? 20.sp
                                              : 22,
                                      adress:
                                          BlocProvider.of<ShowaqaratCubit>(context)
                                              .data[index]
                                              .realStateAddress!,
                                      section: show[
                                          BlocProvider.of<ShowaqaratCubit>(context)
                                              .data[index]
                                              .department!],
                                      price:
                                          BlocProvider.of<ShowaqaratCubit>(context)
                                              .data[index]
                                              .realStatePrice
                                              .toString(),
                                      type: show[
                                          BlocProvider.of<ShowaqaratCubit>(context)
                                              .data[index]
                                              .realStateType!],
                                      advertise_type: show[
                                          BlocProvider.of<ShowaqaratCubit>(context)
                                              .data[index]
                                              .advertiserType!],
                                      edit: IconButton(
                                        icon: const Icon(
                                          Icons.edit_note,
                                          size: 29,
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<addaqarcuibt>(context)
                                              .images = [];
                                          BlocProvider.of<addaqarcuibt>(context)
                                              .imageFile = [];
                                          BlocProvider.of<DateCubit>(context)
                                                  .date1 =
                                              BlocProvider.of<ShowaqaratCubit>(
                                                      context)
                                                  .data[index]
                                                  .createdAt!;
                                          BlocProvider.of<EditCubit>(context)
                                              .advistor_type = null;
                                          BlocProvider.of<EditCubit>(context)
                                              .aqartype = null;
                                          BlocProvider.of<EditCubit>(context)
                                              .departement = null;
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
                                                    content: editdialog(
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
                                                      compoundname: TextEditingController(
                                                          text: BlocProvider.of<
                                                                              ShowaqaratCubit>(
                                                                          context)
                                                                      .data[
                                                                          index]
                                                                      .compoundName ==
                                                                  null
                                                              ? ""
                                                              : BlocProvider.of<
                                                                          ShowaqaratCubit>(
                                                                      context)
                                                                  .data[index]
                                                                  .compoundName),
                                                      advertiser_name:
                                                          TextEditingController(
                                                              text: BlocProvider
                                                                      .of<ShowaqaratCubit>(
                                                                          context)
                                                                  .data[index]
                                                                  .advertiserName),
                                                      aqarnumber: TextEditingController(
                                                          text: BlocProvider.of<
                                                                      ShowaqaratCubit>(
                                                                  context)
                                                              .data[index]
                                                              .buildingNumber),
                                                      data: BlocProvider.of<
                                                                  ShowaqaratCubit>(
                                                              context)
                                                          .data[index],
                                                      adress: TextEditingController(
                                                          text: BlocProvider.of<
                                                                      ShowaqaratCubit>(
                                                                  context)
                                                              .data[index]
                                                              .realStateAddress),
                                                      toilletsnumber: TextEditingController(
                                                          text: BlocProvider.of<
                                                                              ShowaqaratCubit>(
                                                                          context)
                                                                      .data[
                                                                          index]
                                                                      .numberOfBathrooms !=
                                                                  null
                                                              ? BlocProvider.of<
                                                                          ShowaqaratCubit>(
                                                                      context)
                                                                  .data[index]
                                                                  .numberOfBathrooms
                                                                  .toString()
                                                              : ""),
                                                      housenumber:
                                                          TextEditingController(
                                                              text: BlocProvider
                                                                      .of<ShowaqaratCubit>(
                                                                          context)
                                                                  .data[index]
                                                                  .apartmentNumber
                                                                  .toString()),
                                                      phone: TextEditingController(
                                                          text: BlocProvider.of<
                                                                      ShowaqaratCubit>(
                                                                  context)
                                                              .data[index]
                                                              .advertisedPhoneNumber
                                                              .toString()),
                                                      roomsnumber:
                                                          TextEditingController(
                                                              text: BlocProvider
                                                                      .of<ShowaqaratCubit>(
                                                                          context)
                                                                  .data[index]
                                                                  .numberOfRooms
                                                                  .toString()),
                                                      price: TextEditingController(
                                                          text: BlocProvider.of<
                                                                      ShowaqaratCubit>(
                                                                  context)
                                                              .data[index]
                                                              .realStatePrice
                                                              .toString()),
                                                      details: TextEditingController(
                                                          text: BlocProvider.of<
                                                                              ShowaqaratCubit>(
                                                                          context)
                                                                      .data[
                                                                          index]
                                                                      .advertiseDetails ==
                                                                  null
                                                              ? ""
                                                              : BlocProvider.of<
                                                                          ShowaqaratCubit>(
                                                                      context)
                                                                  .data[index]
                                                                  .advertiseDetails
                                                                  .toString()),
                                                      adressdetails:
                                                          TextEditingController(
                                                              text: BlocProvider
                                                                      .of<ShowaqaratCubit>(
                                                                          context)
                                                                  .data[index]
                                                                  .realStateAddressDetails
                                                                  .toString()),
                                                      area: TextEditingController(
                                                          text: BlocProvider.of<
                                                                      ShowaqaratCubit>(
                                                                  context)
                                                              .data[index]
                                                              .realStateSpace
                                                              .toString()),
                                                    ));
                                              });
                                        },
                                      ),
                                      delet: IconButton(
                                        icon: const Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          if (cashhelper.getdata(key: "role") !=
                                              "manager")
                                            showsnack(
                                                comment:
                                                    "ليس لديك صلاحية الوصول للرابط",
                                                context: context);
                                          else
                                            awsomdialogerror(
                                              mywidget: BlocConsumer<
                                                  ShowaqaratCubit,
                                                  ShowaqaratState>(
                                                listener: (context, state) {
                                                  if (state
                                                      is deleteaqarsuccess) {
                                                    Navigator.pop(context);

                                                    showsnack(
                                                        comment: state
                                                            .successmessage,
                                                        context: context);
                                                  }
                                                  if (state
                                                      is deleteaqarfailure) {
                                                    Navigator.pop(context);

                                                    showsnack(
                                                        comment:
                                                            state.error_message,
                                                        context: context);
                                                  }
                                                },
                                                builder: (context, state) {
                                                  if (state
                                                      is deleteaqarloading)
                                                    return deleteloading();
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
                                                                    ShowaqaratCubit>(
                                                                context)
                                                            .deleteaqar(
                                                                token:
                                                                    generaltoken,
                                                                aqarnumber: BlocProvider.of<
                                                                            ShowaqaratCubit>(
                                                                        context)
                                                                    .data[index]
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
                                              tittle: "هل تريد حذف العقار",
                                            );
                                        },
                                      )));
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount:
                            BlocProvider.of<ShowaqaratCubit>(context).loading ==
                                    true
                                ? BlocProvider.of<ShowaqaratCubit>(context)
                                        .data
                                        .length +
                                    1
                                : BlocProvider.of<ShowaqaratCubit>(context)
                                    .data
                                    .length),
                  );
          }))
        ]));
  }
}
