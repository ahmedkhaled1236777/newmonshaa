import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/shimmer/shimmer.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/viewmodel/landsreports/landsreports_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/views/customtablelandsreports.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtabledesktoplandatreports extends StatefulWidget {
  ScrollController scrollController = ScrollController();

  @override
  State<customtabledesktoplandatreports> createState() =>
      _customtabledesktoplandatreportsState();
}

class _customtabledesktoplandatreportsState
    extends State<customtabledesktoplandatreports> {
  initscroll() async {
    await BlocProvider.of<landatreportsCubit>(context)
        .getalllandat(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<landatreportsCubit>(context)
            .getamorelllandat(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<landatreportsCubit>(context);

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
                      BlocProvider.of<landatreportsCubit>(context)
                          .queryParameters = null;
                      await BlocProvider.of<landatreportsCubit>(context)
                          .getalllandat(token: generaltoken, page: 1);
                    },
                    icon:
                        const Icon(Icons.refresh, color: Appcolors.whitecolor)),
                landatsearchreport(),
                SizedBox(
                  width: 5,
                )
              ],
              title: Text(
                'الاراضي',
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
                                BlocProvider.of<landatreportsCubit>(context)
                                    .headertabelealllandatreportss
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
                          child: BlocConsumer<landatreportsCubit,
                              landatreportsState>(
                        listener: (context, state) {
                          if (state is landatreportsfailure)
                            showsnack(
                                comment: state.error_message, context: context);
                        },
                        builder: (context, state) {
                          if (state is landatreportsloading) return loadingshimmer();
                          if (state is landatreportsfailure) return SizedBox();
                          return BlocProvider.of<landatreportsCubit>(context)
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
                                                            landatreportsCubit>(
                                                        context)
                                                    .data
                                                    .length
                                            ? loading()
                                            : customtablelandatreportsitem(
                                                textStyle:
                                                    Appstyles.gettabletextstyle(
                                                        context: context),
                                                date:
                                                    prov.data[index].createdAt!,
                                                advertisertype: show[prov
                                                    .data[index]
                                                    .advertiserType],
                                                emoloyeename: prov
                                                    .data[index].user!.name!,
                                                advertiser: prov
                                                    .data[index].sellerName!,
                                                area: prov
                                                    .data[index].sizeInMetres!
                                                    .toString(),
                                                phone:  cashhelper.getdata(
                        key: "permessions").contains("owner_phone_hidden")    ?"مخفي" : prov.data[index]
                                                    .sellerPhoneNumber!,
                                                adress:
                                                    prov.data[index].address!,
                                                amoutofmoney: prov
                                                    .data[index].totalCost
                                                    .toString(),
                                                priceofmeter: prov
                                                    .data[index].priceOfOneMeter
                                                    .toString(),
                                              );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: BlocProvider.of<
                                                          landatreportsCubit>(
                                                      context)
                                                  .loading ==
                                              true
                                          ? BlocProvider.of<landatreportsCubit>(
                                                      context)
                                                  .data
                                                  .length +
                                              1
                                          : BlocProvider.of<landatreportsCubit>(
                                                  context)
                                              .data
                                              .length));
                        },
                      ))
                    ]))));
  }
}
