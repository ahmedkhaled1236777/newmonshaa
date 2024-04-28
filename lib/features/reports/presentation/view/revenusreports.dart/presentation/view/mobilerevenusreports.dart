import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/view/custommonetrablereports.dart';
import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/presentation/view/search.dart';
import 'package:ghhg/features/reports/presentation/view/revenusreports.dart/presentation/viewmodel/revenus/revenusreports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallmobilerevenusatreportss extends StatefulWidget {
  ScrollController scrollController = ScrollController();

  @override
  State<customtableallmobilerevenusatreportss> createState() =>
      _customtableallmobilerevenusatreportssState();
}

class _customtableallmobilerevenusatreportssState
    extends State<customtableallmobilerevenusatreportss> {
  initscroll() async {
    await BlocProvider.of<revenusatreportsCubit>(context)
        .getallrevenusat(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<revenusatreportsCubit>(context)
            .getamorellrevenusat(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<revenusatreportsCubit>(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Appcolors.maincolor,
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      BlocProvider.of<revenusatreportsCubit>(context)
                          .queryParameters = null;
                      await BlocProvider.of<revenusatreportsCubit>(context)
                          .getallrevenusat(token: generaltoken, page: 1);
                    },
                    icon:
                        const Icon(Icons.refresh, color: Appcolors.whitecolor)),
                revenusatsearchreport(),
                SizedBox(
                  width: 5,
                )
              ],
              title: const Text(
                'الايرادات',
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
                            children:
                                BlocProvider.of<revenusatreportsCubit>(context)
                                    .mobileheadertabeleallrevenusatreportss
                                    .map((e) => customheadertable(
                                          title: e,
                                          flex: 3,
                                          textStyle:
                                              Appstyles.getheadertextstyle(
                                                  context: context),
                                        ))
                                    .toList()),
                      ),
                      Expanded(
                        child: BlocConsumer<revenusatreportsCubit,
                            revenusatreportsState>(
                          listener: (context, state) {
                            if (state is revenusatreportsfailure)
                              showsnack(
                                  comment: state.error_message,
                                  context: context);
                          },
                          builder: (context, state) {
                            if (state is revenusatreportsloading)
                              return loading();
                            if (state is revenusatreportsfailure)
                              return SizedBox();
                            return BlocProvider.of<revenusatreportsCubit>(
                                        context)
                                    .data
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
                                                              revenusatreportsCubit>(
                                                          context)
                                                      .data
                                                      .length
                                              ? loading()
                                              : customtablemoneyatreportsitem(
                                                  textStyle: Appstyles
                                                      .gettabletextstyle(
                                                          context: context),
                                                  emoloyeename: prov
                                                      .data[index].user!.name!,
                                                  date: prov.data[index]
                                                      .transactionDate!,
                                                  money: prov
                                                      .data[index].totalMoney
                                                      .toString()!,
                                                  desc: prov.data[index]
                                                      .description!);
                                        },
                                        separatorBuilder: (context, index) =>
                                            const Divider(),
                                        itemCount: BlocProvider.of<
                                                            revenusatreportsCubit>(
                                                        context)
                                                    .loading ==
                                                true
                                            ? BlocProvider.of<
                                                            revenusatreportsCubit>(
                                                        context)
                                                    .data
                                                    .length +
                                                1
                                            : BlocProvider.of<
                                                        revenusatreportsCubit>(
                                                    context)
                                                .data
                                                .length));
                          },
                        ),
                      )
                    ]))));
  }
}
