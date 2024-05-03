import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/reciept/presentaion/view/customtableallrecieptsitem.dart';
import 'package:ghhg/features/reciept/presentaion/view/receipt_print.dart';
import 'package:ghhg/features/reciept/presentaion/viewmodel/recieptcuibt/recieptcuibt.dart';
import 'package:ghhg/features/reciept/presentaion/viewmodel/recieptcuibt/recieptstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallreciepts extends StatefulWidget {
  ScrollController scrollController = ScrollController();

  customtableallreciepts();

  @override
  State<customtableallreciepts> createState() => _customtableallrecieptsState();
}

class _customtableallrecieptsState extends State<customtableallreciepts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<recieptCubit, recieptState>(
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
                'سند صرف',
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
                            children: BlocProvider.of<recieptCubit>(context)
                                .headertabeleallreciepts
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
                          child: BlocProvider.of<recieptCubit>(context)
                                  .reciepts
                                  .isEmpty
                              ? nodata()
                              : ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return customtablerecieptsitem(
                                        textStyle: Appstyles.gettabletextstyle(
                                            context: context),
                                        cashnumber:
                                            (BlocProvider.of<recieptCubit>(context)
                                                        .reciepts
                                                        .length -
                                                    index)
                                                .toString(),
                                        date: BlocProvider.of<recieptCubit>(context)
                                            .reciepts[index]
                                            .transactionDate!,
                                        datefrom:
                                            BlocProvider.of<recieptCubit>(context)
                                                .reciepts[index]
                                                .contractDateFrom,
                                        dateto: BlocProvider.of<recieptCubit>(context)
                                            .reciepts[index]
                                            .contractDateTo,
                                        ownername:
                                            BlocProvider.of<recieptCubit>(context)
                                                .reciepts[index]
                                                .ownerName!,
                                        ownerphone:
                                            BlocProvider.of<recieptCubit>(context)
                                                .reciepts[index]
                                                .ownerPhone,
                                        amountofmoney:
                                            BlocProvider.of<recieptCubit>(context)
                                                .reciepts[index]
                                                .totalAmount
                                                .toString(),
                                        print: IconButton(
                                            onPressed: () {
                                              navigateto(
                                                  navigationscreen: PdfViewReceipt(
                                                      data: BlocProvider.of<
                                                                  recieptCubit>(
                                                              context)
                                                          .reciepts[index]),
                                                  context: context);
                                            },
                                            icon: const Icon(
                                              Icons.print,
                                              size: 24,
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
                                                      recieptCubit,
                                                      recieptState>(
                                                    listener: (context, state) {
                                                      if (state
                                                          is deleterecieptsuccess) {
                                                        Navigator.pop(context);

                                                        showsnack(
                                                            comment: state
                                                                .succes_message,
                                                            context: context);
                                                      }
                                                      if (state
                                                          is deleterecieptfailure) {
                                                        Navigator.pop(context);

                                                        showsnack(
                                                            comment: state
                                                                .errormessage,
                                                            context: context);
                                                      }
                                                    },
                                                    builder: (context, state) {
                                                      if (state
                                                          is deleterecieptloading)
                                                        return deleteloading();
                                                      return ElevatedButton(
                                                          style:
                                                              const ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    Color.fromARGB(
                                                                        255,
                                                                        37,
                                                                        163,
                                                                        42)),
                                                          ),
                                                          onPressed: () async {
                                                            await BlocProvider
                                                                    .of<recieptCubit>(
                                                                        context)
                                                                .deletereciept(
                                                                    token:
                                                                        generaltoken,
                                                                    recieptid: BlocProvider.of<recieptCubit>(
                                                                            context)
                                                                        .reciepts[
                                                                            index]
                                                                        .id!
                                                                        .toInt());
                                                          },
                                                          child: const Text(
                                                            "تاكيد",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ));
                                                    },
                                                  ),
                                                  context: context,
                                                  tittle:
                                                      "هل تريد حذف سند الصرف ؟",
                                                );
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline_outlined,
                                              color: Colors.red,
                                              size: 24,
                                            )));
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemCount:
                                      BlocProvider.of<recieptCubit>(context)
                                          .reciepts
                                          .length))
                    ])),
          ),
        );
      },
    );
  }
}
