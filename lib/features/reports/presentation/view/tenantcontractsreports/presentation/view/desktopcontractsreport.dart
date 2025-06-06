import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/shimmer/shimmer.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/view/customtablecontractreportitem.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/view/search.dart';
import 'package:ghhg/features/reports/presentation/view/tenantcontractsreports/presentation/viewmodel/contracts/contractsreport_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtabledesktopcontractsatreports extends StatefulWidget {
  ScrollController scrollController = ScrollController();

  @override
  State<customtabledesktopcontractsatreports> createState() =>
      _customtabledesktopcontractsatreportsState();
}

class _customtabledesktopcontractsatreportsState
    extends State<customtabledesktopcontractsatreports> {
  initscroll() async {
    await BlocProvider.of<contractsatreportsCubit>(context)
        .getallcontractsat(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<contractsatreportsCubit>(context)
            .getamorellcontractsat(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<contractsatreportsCubit>(context);

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
                      BlocProvider.of<contractsatreportsCubit>(context)
                          .queryParameters = null;
                      await BlocProvider.of<contractsatreportsCubit>(context)
                          .getallcontractsat(token: generaltoken, page: 1);
                    },
                    icon:
                        const Icon(Icons.refresh, color: Appcolors.whitecolor)),
                contractsatsearchreport(),
                SizedBox(
                  width: 5,
                )
              ],
              title: Text(
                'عقود الايجار',
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
                            children: BlocProvider.of<contractsatreportsCubit>(
                                    context)
                                .headertabeleallcontractsatreportss
                                .map((e) => customheadertable(
                                      title: e,
                                      flex: 3,
                                      textStyle: Appstyles.getheadertextstyle(
                                          context: context),
                                    ))
                                .toList()),
                      ),
                      Expanded(
                          child: BlocConsumer<contractsatreportsCubit,
                              contractsatreportsState>(
                        listener: (context, state) {
                          if (state is contractsatreportsfailure)
                            showsnack(
                                comment: state.error_message, context: context);
                        },
                        builder: (context, state) {
                          if (state is contractsatreportsloading)
                            return loadingshimmer();
                          if (state is contractsatreportsfailure)
                            return SizedBox();
                          return BlocProvider.of<contractsatreportsCubit>(
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
                                                            contractsatreportsCubit>(
                                                        context)
                                                    .data
                                                    .length
                                            ? loading()
                                            : customtablecontractsatreportsitem(
                                                textStyle:
                                                    Appstyles.gettabletextstyle(
                                                        context: context),
                                                date: prov
                                                    .data[index].contractDate!,
                                                tenantname: prov
                                                    .data[index].tenant!.name!,
                                                totalmoney: prov
                                                    .data[index].contractTotal
                                                    .toString()!,
                                                tenantphone: prov
                                                    .data[index].tenant!.phone!
                                                    .toString(),
                                                ownername:
                                                    prov.data[index].ownerName!,
                                                ownerphone: prov
                                                    .data[index].ownerPhone!,
                                                adress: prov.data[index]
                                                    .realStateAddress!,
                                              );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: BlocProvider.of<
                                                          contractsatreportsCubit>(
                                                      context)
                                                  .loading ==
                                              true
                                          ? BlocProvider.of<
                                                          contractsatreportsCubit>(
                                                      context)
                                                  .data
                                                  .length +
                                              1
                                          : BlocProvider.of<
                                                      contractsatreportsCubit>(
                                                  context)
                                              .data
                                              .length));
                        },
                      ))
                    ]))));
  }
}
