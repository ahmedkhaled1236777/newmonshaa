import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/viewmodel/landsreports/landsreports_cubit.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/views/customtablelandsreports.dart';
import 'package:ghhg/features/reports/presentation/view/landsreports.dart/presentation/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customtableallmobilelandatreportss extends StatefulWidget {
  ScrollController scrollController = ScrollController();

  @override
  State<customtableallmobilelandatreportss> createState() =>
      _customtableallmobilelandatreportssState();
}

class _customtableallmobilelandatreportssState
    extends State<customtableallmobilelandatreportss> {
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
                const SizedBox(
                  width: 5,
                )
              ],
              title: const Text(
                'الاراضي',
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
                                BlocProvider.of<landatreportsCubit>(context)
                                    .mobileheadertabelealllandatreportss
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
                                  comment: state.error_message,
                                  context: context);
                          },
                          builder: (context, state) {
                            if (state is landatreportsloading) return loading();
                            if (state is landatreportsfailure)
                              return SizedBox();
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
                                                  priceofmeter: prov.data[index]
                                                      .priceOfOneMeter
                                                      .toString()!,
                                                  textStyle: Appstyles
                                                      .gettabletextstyle(
                                                          context: context),
                                                  emoloyeename: prov
                                                      .data[index].user!.name!,
                                                  date: prov
                                                      .data[index].createdAt!,
                                                  adress:
                                                      prov.data[index].address!,
                                                  area: prov
                                                      .data[index].sizeInMetres
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
                                            ? BlocProvider.of<
                                                            landatreportsCubit>(
                                                        context)
                                                    .data
                                                    .length +
                                                1
                                            : BlocProvider.of<
                                                    landatreportsCubit>(context)
                                                .data
                                                .length));
                          },
                        ),
                      )
                    ]))));
  }
}
