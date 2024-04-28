import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:ghhg/features/contracts/presentation/views/customtablecontractitem.dart';
import 'package:ghhg/features/contracts/presentation/views/editcontractdialog.dart';
import 'package:ghhg/features/contracts/presentation/views/rent_contract.dart';
import 'package:ghhg/features/contracts/presentation/views/showcontractdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtablecontracts extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtablecontracts(this.width);

  @override
  State<customtablecontracts> createState() => _customtablecontractsState();
}

class _customtablecontractsState extends State<customtablecontracts> {
  initscroll() async {
    BlocProvider.of<contractCubit>(context).queryParameters = null;
    await BlocProvider.of<contractCubit>(context)
        .getallcontracts(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<contractCubit>(context)
            .getallmorecontracts(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var contract = BlocProvider.of<contractCubit>(context).contractdata;
    return Container(
        color: Colors.white,
        width: widget.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: widget.width,
            height: 50,
            color: Appcolors.buttoncolor,
            child: Row(
                children: BlocProvider.of<contractCubit>(context)
                    .headertabel
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "تعديل" || e == "حذف" || e == "طباعة عقد"
                              ? 2
                              : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<contractCubit, contractState>(
                  listener: (context, state) {
            if (state is showcontractfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
            if (state is deletecontractfailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            if (state is showcontractloadin) return loading();
            if (state is showcontractfailure) return SizedBox();
            return BlocProvider.of<contractCubit>(context).contractdata.isEmpty
                ? nodata()
                : SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<contractCubit>(context)
                                      .contractdata
                                      .length
                              ? loading()
                              : showcontractdialog(
                                  index: index,
                                  child: customtablecontractitem(
                                      textStyle: Appstyles.gettabletextstyle(
                                          context: context),
                                      tenantname:
                                          BlocProvider.of<contractCubit>(
                                                  context)
                                              .contractdata[index]
                                              .tenant!
                                              .name!
                                              .toString()!,
                                      adress: BlocProvider.of<contractCubit>(
                                              context)
                                          .contractdata[index]
                                          .realStateAddress!,
                                      phone: BlocProvider.of<contractCubit>(
                                              context)
                                          .contractdata[index]
                                          .tenant!
                                          .phone!,
                                      addcontract: IconButton(
                                          onPressed: () {
                                            navigateto(
                                                navigationscreen: PdfViewContract(
                                                    data: BlocProvider.of<
                                                                contractCubit>(
                                                            context)
                                                        .contractdata[index]),
                                                context: context);
                                          },
                                          icon: Icon(Icons.print_rounded)),
                                      delet: IconButton(
                                          onPressed: () async {
                                            awsomdialogerror(
                                              mywidget: BlocConsumer<
                                                  contractCubit, contractState>(
                                                listener: (context, state) {
                                                  if (state
                                                      is deletecontractsuccess) {
                                                    Navigator.pop(context);

                                                    showsnack(
                                                        comment: state
                                                            .success_message,
                                                        context: context);
                                                  }
                                                  if (state
                                                      is deletecontractfailure) {
                                                    Navigator.pop(context);

                                                    showsnack(
                                                        comment:
                                                            state.errormessage,
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
                                                                    contractCubit>(
                                                                context)
                                                            .deletecontract(
                                                                token:
                                                                    generaltoken,
                                                                contractid: BlocProvider.of<
                                                                            contractCubit>(
                                                                        context)
                                                                    .contractdata[
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
                                              tittle: "هل تريد حذف العقد",
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
                                            BlocProvider.of<contractCubit>(
                                                        context)
                                                    .id =
                                                contract[index].id!.toInt();
                                            BlocProvider.of<contractCubit>(
                                                        context)
                                                    .tenantid =
                                                contract[index].tenant!.id!.toInt();
                                            BlocProvider.of<contractCubit>(
                                                    context)
                                                .havemoney = contract[index]
                                                        .cashType ==
                                                    "تحصيل الايجار من خلال الشركه"
                                                ? "company"
                                                : "owner";

                                            BlocProvider.of<contractCubit>(
                                                        context)
                                                    .aqartype =
                                                show[contract[index]
                                                    .realStateType];
                                            BlocProvider.of<contractCubit>(
                                                        context)
                                                    .commessiontype =
                                                commessionresponse[
                                                    contract[index]
                                                        .commissionType];
                                            BlocProvider.of<DateCubit>(context)
                                                    .date1 =
                                                contract[index].contractDate!;
                                            BlocProvider.of<DateCubit>(context)
                                                    .date3 =
                                                contract[index]
                                                    .contractDateFrom!;
                                            BlocProvider.of<DateCubit>(context)
                                                    .date4 =
                                                contract[index].contractDateTo!;
                                            showDialog(
                                                barrierDismissible:
                                                    false, // user must tap button!

                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            BlocProvider.of<
                                                                        contractCubit>(
                                                                    context)
                                                                .mycleardata();
                                                            BlocProvider.of<
                                                                        DateCubit>(
                                                                    context)
                                                                .cleardates();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          icon: const Icon(
                                                              Icons.close)),
                                                    ),
                                                    scrollable: true,
                                                    surfaceTintColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0)),
                                                    content: editcontractdialog(
                                                        tenantname: TextEditingController(
                                                            text: contract[index]
                                                                .tenant!
                                                                .name!),
                                                        tenanphone: TextEditingController(
                                                            text: contract[index]
                                                                .tenant!
                                                                .phone!),
                                                        tenantcard: TextEditingController(
                                                            text: contract[index]
                                                                .tenant!
                                                                .cardNumber!),
                                                        tenantadress: TextEditingController(
                                                            text: contract[index]
                                                                .tenant!
                                                                .cardAddress!),
                                                        tenantjob: TextEditingController(
                                                            text: contract[index]
                                                                .tenant!
                                                                .jobTitle!),
                                                        tenantnationality: TextEditingController(
                                                            text: contract[index]
                                                                .tenant!
                                                                .nationality!),
                                                        ownername: TextEditingController(text: contract[index].ownerName!),
                                                        ownerphone: TextEditingController(text: contract[index].ownerPhone!),
                                                        ownercard: TextEditingController(text: contract[index].ownerCardNumber!),
                                                        owneradress: TextEditingController(text: contract[index].ownerCardAddress!),
                                                        ownerjob: TextEditingController(text: contract[index].ownerJobTitle!),
                                                        ownernationality: TextEditingController(text: contract[index].ownerNationality!),
                                                        aqaradress: TextEditingController(text: contract[index].realStateAddress),
                                                        aqaradressdetails: TextEditingController(text: contract[index].realStateAddressDetails),
                                                        aqarmohafza: TextEditingController(text: contract[index].governorate),
                                                        area: TextEditingController(text: contract[index].realStateSpace.toString()),
                                                        emaranumber: TextEditingController(text: contract[index].buildingNumber),
                                                        housenumber: TextEditingController(text: contract[index].apartmentNumber),
                                                        totalvalue: TextEditingController(text: contract[index].contractTotal.toString()),
                                                        insuranceval: TextEditingController(text: contract[index].insuranceTotal.toString()),
                                                        commessionvalue: TextEditingController(text: BlocProvider.of<contractCubit>(context).commessiontype == "العموله بالنسبه" ? (contract[index].commission! * 100 / contract[index].contractTotal!).toString() : contract[index].commission.toString()),
                                                        periodofdelay: TextEditingController(text: contract[index].periodOfDelay.toString())),
                                                  );
                                                });
                                          })),
                                );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount:
                            BlocProvider.of<contractCubit>(context).loading ==
                                    true
                                ? BlocProvider.of<contractCubit>(context)
                                        .contractdata
                                        .length +
                                    1
                                : BlocProvider.of<contractCubit>(context)
                                    .contractdata
                                    .length));
          }))
        ]));
  }
}
