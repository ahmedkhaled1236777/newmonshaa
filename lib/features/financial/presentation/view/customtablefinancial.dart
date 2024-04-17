import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:ghhg/features/financial/presentation/view/addfinancialwithscafold.dart';
import 'package:ghhg/features/financial/presentation/view/allfinancials.dart';
import 'package:ghhg/features/financial/presentation/view/customtablefinancialitem.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_cubit.dart';
import 'package:ghhg/features/financial/presentation/viewmodel/financial/financial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtablefinancials extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtablefinancials(this.width);

  @override
  State<customtablefinancials> createState() => _customtablefinancialsState();
}

class _customtablefinancialsState extends State<customtablefinancials> {
  initscroll() async {
    BlocProvider.of<financialCubit>(context).queryParameters = null;
    await BlocProvider.of<financialCubit>(context)
        .getallfinancials(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<financialCubit>(context)
            .getallmorefinancials(token: generaltoken);
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
                children: BlocProvider.of<financialCubit>(context)
                    .headertabel
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "قبض" ? 2 : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<financialCubit, financialState>(
                  listener: (context, state) {
            if (state is showfinancialfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
          }, builder: (context, state) {
            if (state is showfinancialloadin) return loading();
            if (state is showfinancialfailure) return SizedBox();
            return SingleChildScrollView(
                controller: widget.scrollController,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >=
                              BlocProvider.of<financialCubit>(context)
                                  .myfinancials
                                  .length
                          ? loading()
                          : GestureDetector(
                              onTap: () {
                                BlocProvider.of<financialCubit>(context)
                                        .myreciepts =
                                    BlocProvider.of<financialCubit>(context)
                                        .myfinancials[index]
                                        .receipts!;
                                navigateandfinish(
                                    navigationscreen: allfinancialsState(),
                                    context: context);
                              },
                              child: customtablefinancialitem(
                                textStyle: Appstyles.gettabletextstyle(
                                    context: context),
                                tenantname:
                                    BlocProvider.of<financialCubit>(context)
                                        .myfinancials[index]
                                        .tenant!,
                                ownername:
                                    BlocProvider.of<financialCubit>(context)
                                        .myfinancials[index]
                                        .ownerName!,
                                aqaradress:
                                    BlocProvider.of<financialCubit>(context)
                                        .myfinancials[index]
                                        .realStateAddress!,
                                amountofmoney:
                                    BlocProvider.of<financialCubit>(context)
                                        .myfinancials[index]
                                        .contractTotal
                                        .toString(),
                                addfinancial: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<financialCubit>(context)
                                          .id = BlocProvider.of<financialCubit>(
                                              context)
                                          .myfinancials[index]
                                          .id!
                                          .toInt();
                                      if (MediaQuery.sizeOf(context).width <=
                                          950) {
                                        BlocProvider.of<financialCubit>(context)
                                            .givefinancialdata(
                                                BlocProvider.of<financialCubit>(
                                                        context)
                                                    .myfinancials[index]);
                                        navigateandfinish(
                                            context: context,
                                            navigationscreen:
                                                addfinancialwithscafold());
                                      } else {
                                        BlocProvider.of<financialCubit>(context)
                                            .givefinancialdata(
                                                BlocProvider.of<financialCubit>(
                                                        context)
                                                    .myfinancials[index]);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.add_box_outlined,
                                      size: 24,
                                    )),
                              ),
                            );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        BlocProvider.of<financialCubit>(context).loading == true
                            ? BlocProvider.of<financialCubit>(context)
                                    .myfinancials
                                    .length +
                                1
                            : BlocProvider.of<financialCubit>(context)
                                .myfinancials
                                .length));
          }))
        ]));
  }
}
