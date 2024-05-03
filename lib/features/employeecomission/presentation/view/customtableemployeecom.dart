import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/employeecomission/presentation/view/customtableemployycomitm.dart';
import 'package:ghhg/features/employeecomission/presentation/view/editemployeecomdialog.dart';
import 'package:ghhg/features/employeecomission/presentation/view/showemployeecomdialog.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecocuibt.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecomstate.dart';

class customtableemployeecoms extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableemployeecoms(this.width);

  @override
  State<customtableemployeecoms> createState() =>
      _customtableemployeecomsState();
}

class _customtableemployeecomsState extends State<customtableemployeecoms> {
  initscroll() async {
    await BlocProvider.of<employeecomCubit>(context)
        .getallemployeecoms(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<employeecomCubit>(context)
            .getallmoreemployeecoms(token: generaltoken);
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
                children: BlocProvider.of<employeecomCubit>(context)
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
              child: BlocConsumer<employeecomCubit, employeecomState>(
                  listener: (context, state) {
            if (state is showemployeecomfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
            if (state is deleteemployeecomfailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            if (state is showemployeecomloadin) return loading();
            if (state is showemployeecomfailure) return SizedBox();
            return BlocProvider.of<employeecomCubit>(context)
                    .employeecomdata
                    .isEmpty
                ? nodata()
                : SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<employeecomCubit>(context)
                                      .employeecomdata
                                      .length
                              ? loading()
                              : showemployeecomdialog(
                                  index: index,
                                  child: customtableemployeecomitem(
                                      textStyle: Appstyles.gettabletextstyle(
                                          context: context),
                                      employeename:
                                          BlocProvider.of<employeecomCubit>(
                                                  context)
                                              .employeecomdata[index]
                                              .employee!
                                              .name!
                                              .toString(),
                                      amount: BlocProvider.of<employeecomCubit>(
                                              context)
                                          .employeecomdata[index]
                                          .totalMoney
                                          .toString()!,
                                      descrip:
                                          BlocProvider.of<employeecomCubit>(
                                                  context)
                                              .employeecomdata[index]
                                              .description!,
                                      date: BlocProvider.of<employeecomCubit>(
                                              context)
                                          .employeecomdata[index]
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
                                                    employeecomCubit,
                                                    employeecomState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is deleteemployeecomsuccess) {
                                                      Navigator.pop(context);

                                                      showsnack(
                                                          comment: state
                                                              .succes_message,
                                                          context: context);
                                                    }
                                                    if (state
                                                        is deleteemployeecomfailure) {
                                                      Navigator.pop(context);

                                                      showsnack(
                                                          comment: state
                                                              .errormessage,
                                                          context: context);
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    if (state
                                                        is deleteemployeecomloading)
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
                                                                      employeecomCubit>(
                                                                  context)
                                                              .deleteemployeecom(
                                                                  token:
                                                                      generaltoken,
                                                                  employeecomid: BlocProvider.of<
                                                                              employeecomCubit>(
                                                                          context)
                                                                      .employeecomdata[
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
                                          BlocProvider.of<employeecomCubit>(
                                                      context)
                                                  .desctype =
                                              BlocProvider.of<employeecomCubit>(
                                                      context)
                                                  .employeecomdata[index]
                                                  .description!;
                                          BlocProvider.of<addaqarcuibt>(context)
                                                  .employeename =
                                              BlocProvider.of<employeecomCubit>(
                                                      context)
                                                  .employeecomdata[index]
                                                  .employee!
                                                  .name!;
                                          BlocProvider.of<addaqarcuibt>(context)
                                                  .employeeid =
                                              BlocProvider.of<employeecomCubit>(
                                                      context)
                                                  .employeecomdata[index]
                                                  .employee!
                                                  .id!
                                                  .toInt();
                                          BlocProvider.of<DateCubit>(context)
                                                  .date1 =
                                              BlocProvider.of<employeecomCubit>(
                                                      context)
                                                  .employeecomdata[index]
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
                                                  scrollable: false,
                                                  content:
                                                      editemployeecomdialog(
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
                                                                employeecomCubit>(
                                                            context)
                                                        .employeecomdata[index],
                                                    amount: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    employeecomCubit>(
                                                                context)
                                                            .employeecomdata[
                                                                index]
                                                            .totalMoney!
                                                            .toString()),
                                                    ownername: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    employeecomCubit>(
                                                                context)
                                                            .employeecomdata[
                                                                index]
                                                            .ownerName!
                                                            .toString()),
                                                    adress: TextEditingController(
                                                        text: BlocProvider.of<
                                                                    employeecomCubit>(
                                                                context)
                                                            .employeecomdata[
                                                                index]
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
                        itemCount: BlocProvider.of<employeecomCubit>(context)
                                    .loading ==
                                true
                            ? BlocProvider.of<employeecomCubit>(context)
                                    .employeecomdata
                                    .length +
                                1
                            : BlocProvider.of<employeecomCubit>(context)
                                .employeecomdata
                                .length));
          })),
          Divider(
            color: Colors.black,
          ),
          BlocBuilder<employeecomCubit, employeecomState>(
              builder: (context, state) {
            return SizedBox(
              height: 40,
              child: Center(
                  child: Text(
                      "الاجمالى : ${BlocProvider.of<employeecomCubit>(context).total == null ? 0 : BlocProvider.of<employeecomCubit>(context).total}")),
            );
          })
        ]));
  }
}
