import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/view/custommonetrablereports.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/view/search.dart';
import 'package:ghhg/features/reports/presentation/view/moneyreports/presentation/viewmodel/expenses/expenswsreports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallmobilemoneyatreportss extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<customtableallmobilemoneyatreportss> createState() =>
      _customtableallmobilemoneyatreportssState();
}

class _customtableallmobilemoneyatreportssState
    extends State<customtableallmobilemoneyatreportss> {
  initscroll() async {
    await BlocProvider.of<moneyatreportsCubit>(context)
        .getallmoneyat(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<moneyatreportsCubit>(context)
            .getamorellmoneyat(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<moneyatreportsCubit>(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            key: widget.scafoldstate,
            backgroundColor: Appcolors.maincolor,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  widget.scafoldstate.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      BlocProvider.of<moneyatreportsCubit>(context)
                          .queryParameters = null;
                      await BlocProvider.of<moneyatreportsCubit>(context)
                          .getallmoneyat(token: generaltoken, page: 1);
                    },
                    icon:
                        const Icon(Icons.refresh, color: Appcolors.whitecolor)),
                moneyatsearchreport(),
                SizedBox(
                  width: 5,
                )
              ],
              title: Text(
                'العقارات',
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        MediaQuery.sizeOf(context).width > 600 ? 6.sp : 9.sp),
              ),
              centerTitle: true,
              backgroundColor: Appcolors.maincolor,
            ),
            drawer: Dashboard(),
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
                                BlocProvider.of<moneyatreportsCubit>(context)
                                    .mobileheadertabeleallmoneyatreportss
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
                        child: BlocConsumer<moneyatreportsCubit,
                            moneyatreportsState>(
                          listener: (context, state) {
                            if (state is moneyatreportsfailure)
                              showsnack(
                                  comment: state.error_message,
                                  context: context);
                          },
                          builder: (context, state) {
                            if (state is moneyatreportsloading)
                              return loading();
                            if (state is moneyatreportsfailure)
                              return SizedBox();
                            return SingleChildScrollView(
                                controller: widget.scrollController,
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return index >=
                                              BlocProvider.of<
                                                          moneyatreportsCubit>(
                                                      context)
                                                  .data
                                                  .length
                                          ? loading()
                                          : customtablemoneyatreportsitem(
                                              textStyle:
                                                  Appstyles.gettabletextstyle(
                                                      context: context),
                                              emoloyeename:
                                                  prov.data[index].user!.name!,
                                              date: prov
                                                  .data[index].transactionDate!,
                                              money: prov.data[index].totalMoney
                                                  .toString()!,
                                              desc: prov
                                                  .data[index].description!);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: BlocProvider.of<
                                                        moneyatreportsCubit>(
                                                    context)
                                                .loading ==
                                            true
                                        ? BlocProvider.of<moneyatreportsCubit>(
                                                    context)
                                                .data
                                                .length +
                                            1
                                        : BlocProvider.of<moneyatreportsCubit>(
                                                context)
                                            .data
                                            .length));
                          },
                        ),
                      )
                    ]))));
  }
}
