import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/contracts/presentation/views/showcontractdialog.dart';
import 'package:ghhg/features/finishedcontracts/presentation/viewmodel/finishedcontracts/finishedcontracts_cubit.dart';
import 'package:ghhg/features/finishedcontracts/presentation/viewmodel/finishedcontracts/finishedcontracts_state.dart';
import 'package:ghhg/features/finishedcontracts/presentation/views/customtablefinishedcontractitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghhg/features/finishedcontracts/presentation/views/showfinishedcontractdialog.dart';

class customtableallfinishedcontracts extends StatefulWidget {
  ScrollController scrollController = ScrollController();

  @override
  State<customtableallfinishedcontracts> createState() =>
      _customtableallfinishedcontractsState();
}

class _customtableallfinishedcontractsState
    extends State<customtableallfinishedcontracts> {
  initscroll() async {
    await BlocProvider.of<finishedcontractsCubit>(context)
        .getallfinishedcontractss(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<finishedcontractsCubit>(context)
            .getallmorefinishedcontractss(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<finishedcontractsCubit>(context);

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Appcolors.maincolor,
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
              ),
              title: Text(
                'العقود المنتهيه',
                style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
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
                            children:
                                BlocProvider.of<finishedcontractsCubit>(context)
                                    .headertabeleallfinishedcontractss
                                    .map((e) => customheadertable(
                                          title: e,
                                          flex: e == "طباعه" ||
                                                  e == "حذف" ||
                                                  e == "رقم القسط"
                                              ? 2
                                              : 3,
                                          textStyle:
                                              Appstyles.getheadertextstyle(
                                                  context: context),
                                        ))
                                    .toList()),
                      ),
                      Expanded(
                          child: BlocConsumer<finishedcontractsCubit,
                              finishedcontractsState>(
                        listener: (context, state) {
                          if (state is showfinishedcontractsfailure)
                            showsnack(
                                comment: state.errorr_message,
                                context: context);
                          if (state is deletefinishedcontractsfailure)
                            showsnack(
                                comment: state.errormessage, context: context);
                        },
                        builder: (context, state) {
                          print( BlocProvider.of<
                                                            finishedcontractsCubit>(
                                                        context)
                                                    .myfinishedcontractss.length);
                          if (state is showfinishedcontractsloadin)
                            return loading();
                          if (state is showfinishedcontractsfailure)
                            return SizedBox();
                          return BlocProvider.of<finishedcontractsCubit>(
                                      context)
                                  .myfinishedcontractss
                                  .isEmpty
                              ? nodata()
                              : SingleChildScrollView(
                                  controller: widget.scrollController,
                                  child: ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return index >=
                                                BlocProvider.of<
                                                            finishedcontractsCubit>(
                                                        context)
                                                    .myfinishedcontractss
                                                    .length
                                            ? loading()
                                            : showfinishedcontractdialog(
                                              index: index,
                                              child: customtablefinishedcontractsitem(
                                                  delet: IconButton(
                                                      onPressed: () async {
                                                        awsomdialogerror(
                                                          mywidget: BlocConsumer<
                                                              finishedcontractsCubit,
                                                              finishedcontractsState>(
                                                            listener:
                                                                (context, state) {
                                                              if (state
                                                                  is deletefinishedcontractssuccess) {
                                                                Navigator.pop(
                                                                    context);
                                              
                                                                showsnack(
                                                                    comment: state
                                                                        .succes_message,
                                                                    context:
                                                                        context);
                                                              }
                                                              if (state
                                                                  is deletefinishedcontractsfailure) {
                                                                Navigator.pop(
                                                                    context);
                                              
                                                                showsnack(
                                                                    comment: state
                                                                        .errormessage,
                                                                    context:
                                                                        context);
                                                              }
                                                            },
                                                            builder:
                                                                (context, state) {
                                                              return ElevatedButton(
                                                                  style:
                                                                      const ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStatePropertyAll(Color.fromARGB(
                                                                            255,
                                                                            37,
                                                                            163,
                                                                            42)),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await BlocProvider.of<finishedcontractsCubit>(context).deletefinishedcontracts(
                                                                        token:
                                                                            generaltoken,
                                                                        finishedcontractsid: BlocProvider.of<finishedcontractsCubit>(
                                                                                context)
                                                                            .myfinishedcontractss[
                                                                                index]
                                                                            .id!
                                                                            .toInt());
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    "تاكيد",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ));
                                                            },
                                                          ),
                                                          context: context,
                                                          tittle:
                                                              "هل تريد حذف هذا العقد ؟",
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        size: 24,
                                                        Icons
                                                            .delete_outline_outlined,
                                                        color: Colors.red,
                                                      )),
                                                  textStyle:
                                                      Appstyles.gettabletextstyle(
                                                          context: context),
                                                  tenentname: prov
                                                      .myfinishedcontractss[index]
                                                      .tenant!
                                                      .name!,
                                                  tenentphone: prov
                                                      .myfinishedcontractss[index]
                                                      .tenant!
                                                      .phone,
                                                  ownername: prov
                                                      .myfinishedcontractss[index]
                                                      .ownerName!,
                                                  ownerphone: prov
                                                      .myfinishedcontractss[index]
                                                      .ownerPhone!,
                                                  adress: prov
                                                      .myfinishedcontractss[index]
                                                      .realStateAddress!,
                                                  amoutofmoney: prov
                                                      .myfinishedcontractss[index]
                                                      .contractTotal
                                                      .toString(),
                                                  finisheddate: prov
                                                      .myfinishedcontractss[index]
                                                      .contractDateTo!,
                                                ),
                                            );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: BlocProvider.of<
                                                          finishedcontractsCubit>(
                                                      context)
                                                  .loading ==
                                              true
                                          ? BlocProvider.of<
                                                          finishedcontractsCubit>(
                                                      context)
                                                  .myfinishedcontractss
                                                  .length +
                                              1
                                          : BlocProvider.of<
                                                      finishedcontractsCubit>(
                                                  context)
                                              .myfinishedcontractss
                                              .length));
                        },
                      ))
                    ]))));
  }
}
