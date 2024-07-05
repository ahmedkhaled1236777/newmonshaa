import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/shimmer/shimmer.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/presentation/view/customtableaqaratreportitem.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/presentation/view/search.dart';
import 'package:ghhg/features/reports/presentation/view/aqaratreports.dart/presentation/viewmodel/aqaratreports/aqaratreports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtabledesktopaqaratreports extends StatefulWidget {
  ScrollController scrollController = ScrollController();

  @override
  State<customtabledesktopaqaratreports> createState() =>
      _customtabledesktopaqaratreportsState();
}

class _customtabledesktopaqaratreportsState
    extends State<customtabledesktopaqaratreports> {
  initscroll() async {
    print(BlocProvider.of<AqaratreportsCubit>(context).queryParameters);
    await BlocProvider.of<AqaratreportsCubit>(context)
        .getallaqarat(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<AqaratreportsCubit>(context)
            .getamorellaqarat(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<AqaratreportsCubit>(context);

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
                      BlocProvider.of<AqaratreportsCubit>(context)
                          .queryParameters = null;
                      await BlocProvider.of<AqaratreportsCubit>(context)
                          .getallaqarat(token: generaltoken, page: 1);
                    },
                    icon:
                        const Icon(Icons.refresh, color: Appcolors.whitecolor)),
                aqaratsearchreport(),
                SizedBox(
                  width: 5,
                )
              ],
              title: Text(
                'العقارات',
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
                                BlocProvider.of<AqaratreportsCubit>(context)
                                    .headertabeleallaqaratreportss
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
                          child: BlocConsumer<AqaratreportsCubit,
                              AqaratreportsState>(
                        listener: (context, state) {
                          if (state is Aqaratreportsfailure)
                            showsnack(
                                comment: state.error_message, context: context);
                        },
                        builder: (context, state) {
                          if (state is Aqaratreportsloading) return loadingshimmer();
                          if (state is Aqaratreportsfailure) return SizedBox();
                          return BlocProvider.of<AqaratreportsCubit>(context)
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
                                                            AqaratreportsCubit>(
                                                        context)
                                                    .data
                                                    .length
                                            ? loading()
                                            : customtableaqaratreportsitem(
                                                textStyle:
                                                    Appstyles.gettabletextstyle(
                                                        context: context),
                                                date:
                                                    prov.data[index].createdAt!,
                                                type: show[prov.data[index]
                                                    .realStateType!],
                                                advertisertype: show[prov
                                                    .data[index]
                                                    .advertiserType!],
                                                departement: show[prov
                                                    .data[index].department!],
                                                emoloyeename: prov
                                                    .data[index].user!.name!,
                                                advertiser: prov.data[index]
                                                    .advertiserName!,
                                                area: prov
                                                    .data[index].realStateSpace!
                                                    .toString(),
                                                phone:  cashhelper.getdata(
                        key: "permessions").contains("owner_phone_hidden")   ?"مخفي" : prov.data[index]
                                                    .advertisedPhoneNumber!,
                                                adress: prov.data[index]
                                                    .realStateAddress!,
                                                amoutofmoney: prov
                                                    .data[index].realStatePrice
                                                    .toString(),
                                              );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: BlocProvider.of<
                                                          AqaratreportsCubit>(
                                                      context)
                                                  .loading ==
                                              true
                                          ? BlocProvider.of<AqaratreportsCubit>(
                                                      context)
                                                  .data
                                                  .length +
                                              1
                                          : BlocProvider.of<AqaratreportsCubit>(
                                                  context)
                                              .data
                                              .length));
                        },
                      ))
                    ]))));
  }
}
