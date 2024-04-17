import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/presentation/view/customprofititem.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/presentation/view/search.dart';
import 'package:ghhg/features/reports/presentation/view/profitsreports/presentation/viewmodel/cubit/profit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallmobileprofitatreportss extends StatefulWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<customtableallmobileprofitatreportss> createState() =>
      _customtableallmobileprofitatreportssState();
}

class _customtableallmobileprofitatreportssState
    extends State<customtableallmobileprofitatreportss> {
  initscroll() async {
    await BlocProvider.of<profitatreportsCubit>(context).getallprofitat(
      token: generaltoken,
    );
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<profitatreportsCubit>(context);
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
                      BlocProvider.of<profitatreportsCubit>(context)
                          .queryParameters = null;
                      await BlocProvider.of<profitatreportsCubit>(context)
                          .getallprofitat(
                        token: generaltoken,
                      );
                    },
                    icon:
                        const Icon(Icons.refresh, color: Appcolors.whitecolor)),
                profitatsearchreport(),
                SizedBox(
                  width: 5,
                )
              ],
              title: Text(
                'الارباح',
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
                                BlocProvider.of<profitatreportsCubit>(context)
                                    .mobileheadertabeleallprofitatreportss
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
                        child: BlocConsumer<profitatreportsCubit,
                            profitatreportsState>(
                          listener: (context, state) {
                            if (state is profitatreportsfailure)
                              showsnack(
                                  comment: state.error_message,
                                  context: context);
                          },
                          builder: (context, state) {
                            if (state is profitatreportsloading)
                              return loading();
                            if (state is profitatreportsfailure)
                              return SizedBox();
                            return SingleChildScrollView(
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return customtableprofitatreportsitem(
                                          textStyle:
                                              Appstyles.gettabletextstyle(
                                                  context: context),
                                          allexpense: prov.data!.totalExpense
                                              .toString(),
                                          date: prov.data!.date!,
                                          allrevenus: prov.data!.totalRevenue
                                              .toString(),
                                          profits: prov.data!.totalProfits
                                              .toString());
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: 1));
                          },
                        ),
                      )
                    ]))));
  }
}
